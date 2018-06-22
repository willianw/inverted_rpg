using UnityEngine;
using UnityEngine.UI;

public class Player : MonoBehaviour {
    public Text lifeText;
    public int life;
    public float speed = 0.1f, rotationSpeed;
    private Rigidbody rb;
    private Animator animator;

    void Start() {
        life = 100;
        lifeText.text = "Vida: " + life.ToString();
        rotationSpeed = 1.0f;
        animator = GetComponent<Animator>();
        rb = GetComponent<Rigidbody>();
    }


    void FixedUpdate()
    {
        bool fire = Input.GetButtonDown("Fire1");
        if (fire) {
            animator.SetTrigger("Attack!");
        }
        float moveHorizontal = Input.GetAxis("Horizontal");
        float moveVertical = Input.GetAxis("Vertical");
        animator.SetBool("Walking", moveVertical != 0.0f);

        Vector3 translation = transform.forward * moveVertical;
        Vector3 rotation = new Vector3(0.0f, moveHorizontal, 0.0f);
        Quaternion deltaRotation = Quaternion.Euler(rotation * 400f * Time.deltaTime * rotationSpeed);
        rb.MoveRotation(rb.rotation * deltaRotation);
        rb.AddForce(translation * speed);
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("PickUp"))
        {
            deltaLife(20);
            GameObject.Destroy(other.gameObject);
        }
    }
    private void OnCollisionEnter(Collision collision)
    {
        if (collision.collider.CompareTag("Enemy"))
        {
            animator.SetTrigger("Damaged");
            deltaLife(-50);
        }
    }

    private void triggerDeath()
    {
        animator.SetTrigger("Death");
        if (((animator.GetCurrentAnimatorStateInfo(0).length >
            animator.GetCurrentAnimatorStateInfo(0).normalizedTime)
            && animator.GetCurrentAnimatorStateInfo(0).IsName("Dead")))
        {
            Application.Quit();
        }
        speed = 0.0f;
        rotationSpeed = 0.0f;
        //TODO- mostrar tela de morte e score
    }
    public void deltaLife(int delta){
        life += delta;
        lifeText.text = "Vida: " + life.ToString();
       if (life <= 0)
        {
            triggerDeath();
        }
    }
}