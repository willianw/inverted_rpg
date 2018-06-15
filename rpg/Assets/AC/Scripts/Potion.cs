using UnityEngine;

public class Potion : MonoBehaviour {
    void Update(){
        transform.position = new Vector3(transform.position.x, 1.0f + 0.5f*Mathf.Sin(5.0f*Time.time), transform.position.z);

    }
}
