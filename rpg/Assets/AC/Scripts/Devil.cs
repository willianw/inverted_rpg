using UnityEngine;

public class Devil : MonoBehaviour {
    public float alpha;
    public float aggroTriggerDistance;
    private GameObject hero;
    public Animator animator;
    private float x, y, z;

    private void Start()
    {
        hero = GameObject.FindWithTag("Player");
    }
    void Update()
    {
        if (animator.GetCurrentAnimatorStateInfo(0).IsName("Flying"))
        {
            x = (alpha) * transform.position.x + (1 - alpha) * hero.transform.position.x;
            y = 0.7f + 0.3f * Mathf.Sin(2.0f * Time.time);
            z = (alpha) * transform.position.z + (1 - alpha) * hero.transform.position.z;

            transform.position = new Vector3(x, y, z);
        }
        transform.LookAt(hero.transform);
    }
    private void FixedUpdate()
    {
        var currentDistance = (hero.transform.position - this.transform.position).magnitude;
        if (currentDistance <= aggroTriggerDistance)
        {
            animator.SetTrigger("Flying");
        } else if (currentDistance >= 2*aggroTriggerDistance)
        {
            animator.SetTrigger("Idle");
        }
    }

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.collider.CompareTag("Player"))
            {
                animator.SetTrigger("Attack");
            }
        
    }


}
