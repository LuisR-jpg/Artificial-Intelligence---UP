using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro;

public class Menu : MonoBehaviour
{
    [SerializeField] private TextMeshProUGUI text;
    public void Start(){
        text.text = "Best Score\n" + PlayerPrefs.GetInt("Score").ToString();
    }
    public void toScene(string scene){
        SceneManager.LoadScene(scene);
    }
}
