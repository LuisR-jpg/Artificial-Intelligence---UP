using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class Settings : MonoBehaviour
{
    [SerializeField] private Slider slider;
    [SerializeField] private TextMeshProUGUI sliderText;
    void Start()
    {
        setDifficulty(PlayerPrefs.GetFloat("Difficulty"));
        slider.onValueChanged.AddListener((v) => {
            setDifficulty(v);
        });
    }
    void setDifficulty(float v)
    {
        slider.value = v;
        PlayerPrefs.SetFloat("Difficulty", v);
        string level = "Difficulty: ";
        if(v == 0){
            level += "Boring";
            Piece.difficultyStep = 0;
        } 
        if(v == 1){
            level += "Easy";
            Piece.difficultyStep = 0.00005f; 
        }
        if(v == 2){
            level += "Not bad";
            Piece.difficultyStep = 0.0005f;
        }
        if(v == 3){
            level += "r u insane?";
            Piece.difficultyStep = 0.005f;
        }
        sliderText.text = level;
    }
}
