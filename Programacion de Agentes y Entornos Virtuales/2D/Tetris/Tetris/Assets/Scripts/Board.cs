﻿using UnityEngine;
using UnityEngine.Tilemaps;
public class Board : MonoBehaviour
{
    //Bigger picture of the game
    public Tilemap tilemap {get; private set;}
    public Piece activePiece {get; private set;}

    public TetrominoData[] tetrominoes;
    public Vector3Int spawnPosition = new Vector3Int(-1, 8, 0);
    public Vector2Int boardSize = new Vector2Int(10, 20);

    public GameObject endMenu;
    public static bool hasEnded;
    
    public RectInt Bounds{
        get{
            Vector2Int position = new Vector2Int(-this.boardSize.x/2, -this.boardSize.y/2);
            return new RectInt(position, this.boardSize);
        }
    }

    private void Awake(){
        this.tilemap = GetComponentInChildren<Tilemap>();
        this.activePiece = GetComponentInChildren<Piece>();
        for(int i = 0; i < this.tetrominoes.Length; i++){
            this.tetrominoes[i].Initialize();
        }
    }

    private void Start(){
        Time.timeScale = 1f;
        PauseMenu.isPaused = false;
        endMenu.SetActive(false);
        hasEnded = false;
        SpawnPiece();
    }
    
    public void SpawnPiece(){
        int random = Random.Range(0, this.tetrominoes.Length);
        TetrominoData data = this.tetrominoes[random];

        this.activePiece.Initialize(this, this.spawnPosition, data);

        if(IsValidPosition(this.activePiece, this.spawnPosition)){
            Set(this.activePiece);
        }
        else {
            this.activePiece.stepDelay = 1f;
            endMenu.SetActive(true);
            Time.timeScale = 0f;
            PauseMenu.isPaused = true;
            hasEnded = true;
            return;
        }

        Set(this.activePiece);
    }

    private void GameOver(){
        this.tilemap.ClearAllTiles();
        this.activePiece.stepDelay = 1f;
    }

    public void Set(Piece piece){
        for(int i = 0; i < piece.cells.Length; i++){
            Vector3Int tilePosition = piece.cells[i] + piece.position;
            this.tilemap.SetTile(tilePosition, piece.data.tile);
        }
    }

    public void Clear(Piece piece){
        for(int i = 0; i < piece.cells.Length; i++){
            Vector3Int tilePosition = piece.cells[i] + piece.position;
            this.tilemap.SetTile(tilePosition, null);
        }
    }

    public bool IsValidPosition(Piece piece, Vector3Int position){
        RectInt bounds = this.Bounds;
        for(int i = 0; i < piece.cells.Length; i++){
            Vector3Int tilePosition = piece.cells[i] + position;
            if(!bounds.Contains((Vector2Int)tilePosition)){
                return false;
            }
            if(this.tilemap.HasTile(tilePosition)){
                return false;
            }
        }
        return true;
    }
    public void ClearLines(){
        RectInt bounds = this.Bounds;
        int row = bounds.yMin, clearedLines = 0;
        while(row < bounds.yMax){
            if(IsLineFull(row)){
                LineClear(row);
                clearedLines++;
            }
            else row++;
        }
        if(clearedLines == 1) Score.score += 40;
        if(clearedLines == 2) Score.score += 100;
        if(clearedLines == 3) Score.score += 300;
        if(clearedLines == 4) Score.score += 1200;
    }
    private bool IsLineFull(int row){
        RectInt bounds = this.Bounds;
        for(int col = bounds.xMin; col < bounds.xMax; col++){
            Vector3Int position = new Vector3Int(col, row, 0);
            if(!this.tilemap.HasTile(position)){
                return false;
            }
        }
        return true;
    }
    private void LineClear(int row){
        RectInt bounds = this.Bounds;
        for(int col = bounds.xMin; col < bounds.xMax; col++){
            Vector3Int position = new Vector3Int(col, row, 0);
            this.tilemap.SetTile(position, null);
        }
        while(row < bounds.yMax){
            for(int col = bounds.xMin; col < bounds.xMax; col++){
                Vector3Int position = new Vector3Int(col, row + 1, 0);
                TileBase above = this.tilemap.GetTile(position);
                position = new Vector3Int(col, row, 0);
                this.tilemap.SetTile(position, above);
            }
            row++;
        }
    }
}
