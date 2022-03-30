using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class Devil: MonoBehaviour {
    Rigidbody2D rb;
    public static float speed = 3f;
    public static float wait = 1f;
    private Vector2[] arr = new Vector2[] {
        new Vector2(speed, 0), 
        new Vector2(0, speed), 
        new Vector2(-speed, 0), 
        new Vector2(0, -speed)
    };

    IEnumerator Start() {
        rb = GetComponent<Rigidbody2D>();
        StartCoroutine("Square");
        yield return new WaitForSeconds(8f);
        StopAllCoroutines();
        rb.velocity = Vector2.zero;
    }

    IEnumerator Square() {
        int i = 0;
        while(true) {
            rb.velocity = arr[i];
            yield return new WaitForSeconds(wait);
            i = (++i % arr.Length);
        }
    }
}