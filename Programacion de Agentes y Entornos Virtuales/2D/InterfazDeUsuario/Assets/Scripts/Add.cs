using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class Add : MonoBehaviour
{
    private int var = 0;
    public TextMeshProUGUI count;
    public TextMeshProUGUI amount;

    void Start()
    {
        Button a = GetComponent<Button>();
        a.onClick.AddListener(TaskOnClick);
    }

    void TaskOnClick()
    {
        var += int.Parse(amount.text);
        count.text = var.ToString();
    }
}
