using System.Collections;
using System.ComponentModel;
using System.Collections.Generic;
using UnityEngine;

public class PotionMovement : MonoBehaviour {

    public GameObject hero;
    float distance;

    void Start(){
        hero = GameObject.Find("Footman");
    }

    void Update(){
        distance = Vector3.Distance(transform.position, hero.transform.position);
        if (distance < 0.7f){
            hero.GetComponent<Animation>().SendMessage("deltaLife", 20);
        }
    }
}
