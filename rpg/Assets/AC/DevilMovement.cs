using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DevilMovement : MonoBehaviour {
    private GameObject hero;
    private float x, y, z, alpha;


	void Start () {
        alpha = 0.975f;
        hero = GameObject.Find("Footman");
	}

    void Update()
    {
        x = (alpha) * transform.position.x + (1 - alpha) * hero.transform.position.x;
        y = 0.7f + 0.3f * Mathf.Sin(2.0f * Time.time);
        z = (alpha) * transform.position.z + (1 - alpha) * hero.transform.position.z;

        transform.position = new Vector3(x, y, z);
        transform.LookAt(hero.transform);
        Animator animator = GetComponent<Animator>();
        animator.setTrigger();
	}
}
