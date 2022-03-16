using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FPSController : MonoBehaviour
{
    FPSActions control;
    FPSActions.FPSMapActions actions;
    private Vector2 mouseVector;

    private void Awake()
    {
        control = new FPSActions();
        actions = control.FPSMap;
        actions.MoveCamera.performed += ctx => mouseVector = ctx.ReadValue<Vector2>();
    }

    private void OnEnable()
    {
        control.Enable();
    }

    private void OnDestroy()
    {
        control.Disable();
    }

    void Update()
    {
        print(mouseVector);
    }
}
