using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OldController : MonoBehaviour
{
    public float a = 150f, force = 10f; 
    private Transform camT;
    private Rigidbody rb; 

    void Start()
    {
        camT = transform.GetChild(0); // transformada de la camara 
        rb = GetComponent<Rigidbody>(); 
    }
    void Update()
    {
        float vRot = Input.GetAxis("Mouse Y") * a;
        float hRot = Input.GetAxis("Mouse X") * a;
        print(vRot + "," + hRot);

        float vAx = Input.GetAxis("Vertical");
        float hAx = Input.GetAxis("Horizontal");


        
        transform.Rotate(0f, hRot * Time.deltaTime, 0f);
        camT.Rotate(vRot * Time.deltaTime, 0f, 0f);
        rb.AddForce(((transform.forward * vAx) + (transform.right * hAx)) * force);   
    }
}
