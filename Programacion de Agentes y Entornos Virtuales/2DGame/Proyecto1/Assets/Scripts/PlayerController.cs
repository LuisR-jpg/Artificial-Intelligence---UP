using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem; 

public class PlayerController : MonoBehaviour
{
    private Rigidbody2D rb;
    private Animator anim;
    private float movX, movY;
    public float speed = 1; 

    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        anim = GetComponent<Animator>(); 
    }

    private void OnMove(InputValue movValue)
    {
        Vector2 movVect = movValue.Get<Vector2>();
        movX = movVect.x;
        movY = movVect.y;
        bool mov = true;

        if (movX > 0) anim.SetInteger("direction", 1);
        if (movX < 0) anim.SetInteger("direction", 3);
        if (movY > 0) anim.SetInteger("direction", 2);
        if (movY < 0) anim.SetInteger("direction", 0);

        if (!Keyboard.current.wKey.isPressed &&
            !Keyboard.current.aKey.isPressed &&
            !Keyboard.current.sKey.isPressed &&
            !Keyboard.current.dKey.isPressed) mov = false;

        anim.SetBool("walking", mov);

    }

    void FixedUpdate()
    {
        Vector2 mov = new Vector2(movX, movY);
        rb.velocity = mov * speed;
    }
}
