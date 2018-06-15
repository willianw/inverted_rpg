using UnityEngine;

public class Camera: MonoBehaviour{
    public GameObject player;
    private Vector3 offset, old_position, new_position, height;
    float weight = 0.5f, distance;

    void Start(){
         offset = transform.position - player.transform.position;
        distance = offset.magnitude;
        height = new Vector3(0.0f, 1.0f, 0.0f);
    
    }

    void LateUpdate(){
        old_position = transform.position;
        new_position = player.transform.position - (player.transform.forward * distance) + height;
        transform.position = weight*old_position + (1-weight)*(new_position);
        transform.rotation = player.transform.rotation;
    }
}