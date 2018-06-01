using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class HeroMovement : MonoBehaviour{
    public static Text lifeText;
    public static int life;
    public float speed = 0.1f;
    private Rigidbody rb;
    private Animator animator;

    void Start(){
        life = 100;
        lifeText = GameObject.Find("lifeText").GetComponent<Text>(); 
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
        Quaternion deltaRotation = Quaternion.Euler(rotation * 0.9f);
        rb.MoveRotation(rb.rotation * deltaRotation);
        rb.AddForce(translation * speed);
    }

    public void deltaLife(int delta){
        life += delta;
        lifeText.text = "Life: " + life.ToString();
    }
}