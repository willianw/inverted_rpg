using UnityEngine;
using UnityEngine.UI;

public class Player : MonoBehaviour{
    public Text lifeText;
    public int life;
    public float speed = 0.1f;
    private Rigidbody rb;
    private Animator animator;

    void Start(){
        life = 100;
        lifeText.text = "Vida: " + life.ToString();
        animator = GetComponent<Animator>();
        rb = GetComponent<Rigidbody>();
    }

   
    void FixedUpdate()
    {
        bool fire = Input.GetButtonDown("Fire1");
        if (fire){
            animator.SetTrigger("Attack!");
        }
        float moveHorizontal = Input.GetAxis("Horizontal");
        float moveVertical = Input.GetAxis("Vertical");
        animator.SetBool("Walking", moveVertical != 0.0f);

        Vector3 translation = transform.forward * moveVertical;
        Vector3 rotation = new Vector3(0.0f, moveHorizontal, 0.0f);
        Quaternion deltaRotation = Quaternion.Euler(rotation * 400f* Time.deltaTime);
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

    public void deltaLife(int delta){
        life += delta;
        lifeText.text = "Vida: " + life.ToString();
    }
}