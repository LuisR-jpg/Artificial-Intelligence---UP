using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class ToggleManager : MonoBehaviour
{
    [SerializeField] private Toggle toggle;
    void Start()
    {
        setGhost(PlayerPrefs.GetInt("hasGhost") == 1);
        toggle.onValueChanged.AddListener((v) => {
            setGhost(v);
        });
    }
    void setGhost(bool v){
        PlayerPrefs.SetInt("hasGhost", (v? 1: 0));
        toggle.isOn = PlayerPrefs.GetInt("hasGhost") == 1;
    }
}
