﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Magic : MonoBehaviour
{
    public GameObject cosa;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void OnTriggerEnter2D(Collider2D other)
    {
        cosa.SetActive(false); 
    }

    void OnTriggerExit2D(Collider2D other)
    {
        cosa.SetActive(true);
    }
}
