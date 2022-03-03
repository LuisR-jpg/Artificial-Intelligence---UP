using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class Score : MonoBehaviour
{
    public static int score = 0;
    [SerializeField] private TextMeshProUGUI text;
    void Start()
    {
        score = 0;
    }
    void Update()
    {
        text.text = "Score\n" + score.ToString();        
        if(PlayerPrefs.GetInt("Score") < score)
            PlayerPrefs.SetInt("Score", score);
        
    }
}
