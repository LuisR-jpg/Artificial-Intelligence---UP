using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class Fly: MonoBehaviour {
    Rigidbody2D rb;
    public float phi = 10f;
    public float speed = 5f;
    void Start() {
        rb = GetComponent<Rigidbody2D>();
    }
    void FixedUpdate() {
        rb.velocity = new Vector2(speed*Mathf.Cos(phi*Time.time), speed*Mathf.Sin(phi*Time.time));
    }
}