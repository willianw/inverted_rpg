using UnityEngine;

public class Devil : MonoBehaviour {
    public float alpha;
    private GameObject hero;
    private float x, y, z;


	void Start () {
        hero = GameObject.FindGameObjectWithTag("Player");
	}

    void Update()
    {
        x = (alpha) * transform.position.x + (1 - alpha) * hero.transform.position.x;
        y = 0.7f + 0.3f * Mathf.Sin(2.0f * Time.time);
        z = (alpha) * transform.position.z + (1 - alpha) * hero.transform.position.z;

        transform.position = new Vector3(x, y, z);
        transform.LookAt(hero.transform);
	}
}
