using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using TMPro;

public class PlayerControl : MonoBehaviour
{
    private Rigidbody rb;
    private float movementX, movementY;
    public float speed = 0;
    public int count = 0;
    public TextMeshProUGUI countText;
    public GameObject winTextObject;

    void SetCountText()
    {
        countText.text = "Count: " + count.ToString();
    }

    void Start()
    {
        winTextObject.SetActive(false);
        rb = GetComponent<Rigidbody>();
        SetCountText();
    }
    void OnMove(InputValue movementValue){
        Vector2 movementVector = movementValue.Get<Vector2>();
        movementX = movementVector.x;
        movementY = movementVector.y;
    }
    void FixedUpdate(){
        Vector3 movement = new Vector3(movementX, 0.0f, movementY);
        rb.AddForce(movement*speed);
    }
    void OnTriggerEnter(Collider other){
        other.gameObject.SetActive(false);
        count++;
        SetCountText();
        if(count >= 12)
            winTextObject.SetActive(true);
    }
}
