﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerController : MonoBehaviour
{

    private Rigidbody2D rb;
    private Animator animator;
    private float movementX;
    private float movementY;
    public float speed = 1;

    void Start(){
        rb = GetComponent<Rigidbody2D>();
        animator = GetComponent<Animator>();
    }
    
    private void OnMove(InputValue movementValue){
        Vector2 movementVector = movementValue.Get<Vector2>();
        movementX = movementVector.x;
        movementY = movementVector.y;
        if(movementX > 0) animator.SetInteger("direction", 1);
        if(movementX < 0) animator.SetInteger("direction", 3);
        if(movementY > 0) animator.SetInteger("direction", 2);
        if(movementY < 0) animator.SetInteger("direction", 0);
    }
    void FixedUpdate(){
        Vector2 movement = new Vector2(movementX, movementY);
        rb.velocity = movement*speed;
    }
}