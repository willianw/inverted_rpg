using UnityEngine;

public class Potion : MonoBehaviour {
    public float speed;
    void Update(){
        transform.position = new Vector3(transform.position.x, 1.0f + 0.3f*Mathf.Sin(speed*Time.time), transform.position.z);

    }
}
