using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using UnityEngine.EventSystems;


public class HowToPlay : MonoBehaviour, IPointerDownHandler, IPointerUpHandler {
    public GameObject HowToPlayMenu;

    public void Start(){
        HowToPlayMenu.SetActive(false);
    }
    public void OnPointerDown(PointerEventData eventData)
    {
        HowToPlayMenu.SetActive(true);
    }
    
    public void OnPointerUp(PointerEventData eventData)
    {
        HowToPlayMenu.SetActive(false);
    }
}
