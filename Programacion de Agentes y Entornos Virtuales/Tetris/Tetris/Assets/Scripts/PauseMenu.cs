﻿using UnityEngine;

public class PauseMenu : MonoBehaviour
{
    public GameObject pauseMenu;
    public static bool isPaused;
    void Start(){
        pauseMenu.SetActive(false);
    }
    void Update(){
        if(Input.GetKeyDown(KeyCode.Escape) && !Board.hasEnded){
            if(isPaused) ResumeGame();
            else PauseGame();
        }
    }
    public void PauseGame(){
        pauseMenu.SetActive(true);
        Time.timeScale = 0f;
        isPaused = true;
    }
    public void ResumeGame(){
        pauseMenu.SetActive(false);
        Time.timeScale = 1f;
        isPaused = false;
    }
}
