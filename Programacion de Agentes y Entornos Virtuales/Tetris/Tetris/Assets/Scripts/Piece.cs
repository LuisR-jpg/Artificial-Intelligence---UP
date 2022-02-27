using UnityEngine;

public class Piece : MonoBehaviour {
    //Specific piece
    public Board board {get; private set;}
    public TetrominoData data {get; private set;}
    public Vector3Int[] cells {get; private set;}
    public Vector3Int position {get; private set;}
    public int rotationIndex {get; private set;}

    public void Initialize(Board board, Vector3Int position, TetrominoData data) {
        this.board = board;
        this.position = position;
        this.data = data;
        this.rotationIndex = 0;
        if(this.cells == null){
            this.cells = new Vector3Int[data.cells.Length];
        }
        for(int i = 0; i < data.cells.Length; i++){
            this.cells[i] = (Vector3Int)data.cells[i];
        }
    }
    private void Update(){
        this.board.Clear(this);
        if(Input.GetKeyDown(KeyCode.Q)){
            Rotate(-1);
        }
        else if(Input.GetKeyDown(KeyCode.E)){
            Rotate(1);
        }
        if(Input.GetKeyDown(KeyCode.A)){
            Move(Vector2Int.left);
        }
        else if(Input.GetKeyDown(KeyCode.D)){
            Move(Vector2Int.right);
        }
        if(Input.GetKeyDown(KeyCode.S)){
            Move(Vector2Int.down);
        }
        if(Input.GetKeyDown(KeyCode.Space)){
            HardDrop();
        }
        this.board.Set(this);
    }
    private void HardDrop(){
        while(Move(Vector2Int.down));
    }
    private bool Move(Vector2Int translation){
        Vector3Int newPosition = this.position;
        newPosition.x += translation.x;
        newPosition.y += translation.y;
        bool valid = this.board.IsValidPosition(this, newPosition);
        if(valid){
            this.position = newPosition;
        }
        return valid;
    }
    public void Rotate(int direction){
        this.rotationIndex = Wrap(this.rotationIndex + direction, 0, 4);
        for(int i = 0; i < this.cells.Lenght; i++){
            Vector3 cell = this.cells[i];
            int x, y;
            
        }
    }
    private int Wrap(int input, int min, int max){
        if(input < min) return max - (min - input) % (max - min);
        else return min + (input - min) % (max - min);
    }
}
