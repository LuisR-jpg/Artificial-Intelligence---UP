using UnityEngine;

public class Piece : MonoBehaviour {
    //Specific piece
    public Board board {get; private set;}
    public TetrominoData data {get; private set;}
    public Vector3Int[] cells {get; private set;}
    public Vector3Int position {get; private set;}
    public int rotationIndex {get; private set;}

    public float stepDelay = 1f;
    public static float difficultyStep = 0.00005f;
    public float lockDelay = 0.5f;
    public float inputDelay = 0.2f;

    private float stepTime;
    private float lockTime;
    private float inputTime;

    public void Initialize(Board board, Vector3Int position, TetrominoData data) {
        this.board = board;
        this.position = position;
        this.data = data;
        this.rotationIndex = 0;
        this.stepTime = Time.time + this.stepDelay;
        this.lockTime = 0f;
        if(this.cells == null){
            this.cells = new Vector3Int[data.cells.Length];
        }
        for(int i = 0; i < data.cells.Length; i++){
            this.cells[i] = (Vector3Int)data.cells[i];
        }
    }
    private void Update(){
        if(PauseMenu.isPaused || Board.hasEnded) return;
        IncreaseDifficulty(difficultyStep);

        this.board.Clear(this);

        this.lockTime += Time.deltaTime;
        
        if(Time.time >= this.inputTime){
            Sensibility();

            if(Input.GetKey(KeyCode.Q))
                Rotate(-1);
            else if(Input.GetKey(KeyCode.E))
                Rotate(1);
            if(Input.GetKey(KeyCode.A))
                Move(Vector2Int.left);
            else if(Input.GetKey(KeyCode.D))
                Move(Vector2Int.right);
            if(Input.GetKey(KeyCode.S))
                Move(Vector2Int.down);
        }
        if(Input.GetKeyDown(KeyCode.Space)){
            HardDrop();
        }
        if(!(
            Input.GetKey(KeyCode.Q) ||
            Input.GetKey(KeyCode.E) ||
            Input.GetKey(KeyCode.A) ||
            Input.GetKey(KeyCode.D) ||
            Input.GetKey(KeyCode.S)
        )) this.inputTime = Time.time;

        if(Time.time >= this.stepTime){
            Step();
            Move(Vector2Int.down);
            if(this.lockTime >= this.lockDelay){
                Lock();
            }
        }

        this.board.Set(this);
    }
    private void IncreaseDifficulty(float step){
        this.stepDelay -= step;
        if(this.stepDelay < 0.05f) this.stepDelay = 0.05f;
    }
    private void Step(){
        this.stepTime = Time.time + this.stepDelay;
    }
    private void Sensibility(){
        this.inputTime = Time.time + this.inputDelay;
    }
    private void Lock(){
        this.board.Set(this);
        this.board.ClearLines();
        this.board.SpawnPiece();
    }
    private void HardDrop(){
        while(Move(Vector2Int.down)) Score.score++;
        Score.score++;
        Lock();
    }
    private bool Move(Vector2Int translation){
        Vector3Int newPosition = this.position;
        newPosition.x += translation.x;
        newPosition.y += translation.y;
        bool valid = this.board.IsValidPosition(this, newPosition);
        if(valid){
            this.position = newPosition;
            this.lockTime = 0f;
        }
        return valid;
    }
    public void Rotate(int direction){
        int originalRotation = this.rotationIndex;
        this.rotationIndex = Wrap(this.rotationIndex + direction, 0, 4);
        ApplyRotationMatrix(direction);
        if(!TestWallkicks(this.rotationIndex, direction)){
            this.rotationIndex = originalRotation;
            ApplyRotationMatrix(-direction);
        } 
    }

    private void ApplyRotationMatrix(int direction){
        for(int i = 0; i < this.cells.Length; i++){
            Vector3 cell = this.cells[i];
            int x, y;
            switch(this.data.tetromino){
                case Tetromino.I:
                case Tetromino.O:
                    cell.x -= 0.5f;
                    cell.y -= 0.5f;
                    x = Mathf.CeilToInt((cell.x * Data.RotationMatrix[0] * direction) + (cell.y * Data.RotationMatrix[1] * direction));
                    y = Mathf.CeilToInt((cell.x * Data.RotationMatrix[2] * direction) + (cell.y * Data.RotationMatrix[3] * direction));
                    break;
                default:
                    x = Mathf.RoundToInt((cell.x * Data.RotationMatrix[0] * direction) + (cell.y * Data.RotationMatrix[1] * direction));
                    y = Mathf.RoundToInt((cell.x * Data.RotationMatrix[2] * direction) + (cell.y * Data.RotationMatrix[3] * direction));
                    break;
            }
            this.cells[i] = new Vector3Int(x, y, 0);
        }
    }

    private bool TestWallkicks(int rotationIndex, int rotationDirection){
        int wallKickIndex = GetWallKickIndex(rotationIndex, rotationDirection);
        for(int i = 0; i < this.data.WallKicks.GetLength(1); i++){
            Vector2Int translation = this.data.WallKicks[wallKickIndex, i];
            if(Move(translation))
                return true;
        }
        return false;
    }

    private int GetWallKickIndex(int rotationIndex, int rotationDirection){
        int wallKickIndex = rotationIndex * 2;
        if(rotationDirection < 0){
            wallKickIndex--;
        }
        return Wrap(wallKickIndex, 0, this.data.WallKicks.GetLength(0));
    }

    private int Wrap(int input, int min, int max){
        if(input < min) return max - (min - input) % (max - min);
        else return min + (input - min) % (max - min);
    }
}
