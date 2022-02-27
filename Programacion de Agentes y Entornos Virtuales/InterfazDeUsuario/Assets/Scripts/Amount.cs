using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class Amount : MonoBehaviour
{
    private Slider sli;
    public TextMeshProUGUI amount;

    void Start()
    {
        sli = GetComponent<Slider>();
    }

    void Update()
    {
        amount.text = (sli.value).ToString();
    }
}
