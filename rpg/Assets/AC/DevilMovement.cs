using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DevilMovement : MonoBehaviour {
    public GameObject hero;
    Vector3 deltaP;

	void Start () {
        hero = GameObject.Find("Footman");
	}
	
    void FixedUpdate() {
        transform.position = new Vector3(transform.position.x, Mathf.Sin(0.5f+Time.deltaTime), transform.position.z);
        transform.LookAt(hero.transform);
	}
}
