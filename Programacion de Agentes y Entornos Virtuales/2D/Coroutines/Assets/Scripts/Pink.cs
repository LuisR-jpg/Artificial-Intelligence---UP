using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class Pink: MonoBehaviour {
    Rigidbody2D rb;
    SpriteRenderer sr;
    public float speed = 5f;
    void Start() {
        rb = GetComponent<Rigidbody2D>();
        sr = GetComponent<SpriteRenderer>();
        StartCoroutine(Walk());
    }
    IEnumerator Walk() {
        int sgn = 1;
        while(true) {
            //yield return new WaitForSeconds(2f);
            //sgn = -sgn; 
            sgn = 1;
            sr.flipX = false;
            rb.velocity = new Vector2(sgn*speed, 0);
            yield return new WaitUntil(() => transform.position.x > 6f);
            sgn = -1;
            sr.flipX = true;
            rb.velocity = new Vector2(sgn*speed, 0);
            yield return new WaitUntil(() => transform.position.x < -6f);
        }
    }
}