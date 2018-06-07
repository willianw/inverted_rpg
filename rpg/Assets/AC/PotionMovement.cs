using System.Collections;
using System.ComponentModel;
using System.Collections.Generic;
using UnityEngine;

public class PotionMovement : MonoBehaviour {

    public GameObject hero;
    float distance;

    void Start(){}

    void Update(){
        transform.position = new Vector3(transform.position.x, 1.0f + 0.5f*Mathf.Sin(5.0f*Time.time), transform.position.z);

    }
}
