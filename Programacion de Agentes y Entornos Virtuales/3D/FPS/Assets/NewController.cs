using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NewController : MonoBehaviour
{
    FPSInputActions control;
    FPSInputActions.FPSMapActions actions;
    private Vector2 mouseVector, horVector;
    private Rigidbody rb; 
    private Transform camT;
    public float sens = 0.1f, force = 10f, jmpForce = 500f;
    private bool jmp;
       

    private void Awake()
    {
        control = new FPSInputActions();
        actions = control.FPSMap;
        actions.MoveCamera.performed += (ctx => mouseVector = ctx.ReadValue<Vector2>()); 
        camT = transform.GetChild(0); 
        rb = GetComponent<Rigidbody>();
	actions.MoveHorizontal.performed += (ctx => horVector = ctx.ReadValue<Vector2>()); 
        actions.Jump.performed += (ctx => jmp = true); 
    }

    private void OnEnable()
    {
        control.Enable(); 
    }

    private void OnDestroy()
    {
        control.Disable(); 
    }

    // Update is called once per frame
    void Update()
    {
        print(mouseVector);
        print(mouseVector);
        transform.Rotate(0f, mouseVector.x * sens, 0f);
        camT.Rotate(-mouseVector.y * sens, 0f, 0f); 

	rb.AddForce((transform.forward * horVector.y + transform.right * horVector.x) * force);  

	if(jmp && rb.velocity.y == 0) rb.AddForce(transform.up * jmpForce);
        jmp = false;  
    }
}
