using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FPSController : MonoBehaviour
{
    Action control;
    Action.FpsMapActions actions;
    private Vector2 mouseVector;

    private void Awake(){
        control = new Action();
        actions = control.fpsMap;
        actions.MoveCamera.performed += ctx => mouseVector = ctx.ReadValue<Vector2>();
    }

    private void OnEnable(){
        control.Enable();
    }

    private void OnDestroy(){ 
        control.Disable();
    }

    void Update()
    {
        print(mouseVector);
    }
}
