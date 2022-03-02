using UnityEngine;
using UnityEngine.SceneManagement;

public class Menu : MonoBehaviour
{
    public void toScene(string scene){
        SceneManager.LoadScene(scene);
    }
}
