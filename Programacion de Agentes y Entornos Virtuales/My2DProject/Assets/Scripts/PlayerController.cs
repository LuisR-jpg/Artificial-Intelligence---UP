using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerController : MonoBehaviour
{

    private Rigidbody2D rb;
    private float movementX;
    private float movementY;
    public float speed = 1;

    void Start(){
        rb = GetComponent<Rigidbody2D>();
    }
    
    private void OnMove(InputValue movementValue){
        Vector2 movementVector = movementValue.Get<Vector2>();
        movementX = movementVector.x;
        movementY = movementVector.y;
    }
    void FixedUpdate(){
        Vector2 movement = new Vector2(movementX, movementY);
        rb.velocity = movement*speed;
    }
}