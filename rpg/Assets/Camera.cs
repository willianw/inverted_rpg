using UnityEngine;
using System.Collections;

public class Camera: MonoBehaviour{
    public GameObject player;
    private Vector3 offset, old_position, new_position, altura;
    float weight = 0.5f, distance;

    void Start(){
        player = GameObject.Find("Footman");
        offset = transform.position - player.transform.position;
        distance = offset.magnitude;
        altura = new Vector3(0.0f, 0.7f, 0.0f);
    }

    void LateUpdate(){
        old_position = transform.position;
        new_position = player.transform.position - (player.transform.forward * distance) + altura;
        transform.position = weight*old_position + (1-weight)*(new_position);
        transform.rotation = player.transform.rotation;
    }
}