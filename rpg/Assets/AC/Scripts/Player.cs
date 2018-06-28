using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class Player : MonoBehaviour {
    public ParticleSystem pSystem;
    public Text healthPointsText;
    public int healthPoints;
    public float baseSpeed = 0.1f, rotationSpeed;
    private float speed;
    private PlayerStats _playerStats;
    private Rigidbody rb;
    private Animator animator;
    private int HEALTH_POINTS_MULTIPLIER = 10;
    private float SPEED_MULTIPLIER = 1.5f;
   
    void Start() {
        _playerStats = new PlayerStats();
        animator = GetComponent<Animator>();
        rb = GetComponent<Rigidbody>();
        healthPoints = CalculateHealthPoints(_playerStats.Find<Vitality>().Value());
        speed = CalculateSpeed(_playerStats.Find<Agility>().Value());
        UpdateHealthPointsText(healthPoints);
        rotationSpeed = 1.0f;
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
    private void UpdateHealthPointsText(int updatedHealthPoints)
    {
        healthPointsText.text = "Health: " + updatedHealthPoints.ToString();
    }

    private float CalculateSpeed(int agilityAmount)
    {
        return baseSpeed + SPEED_MULTIPLIER * agilityAmount;
    }

    private int CalculateHealthPoints(int vitalityAmount)
    {
        return HEALTH_POINTS_MULTIPLIER * vitalityAmount;
    }

    private bool IsHealingPotion(Component component)
    {
        return component.CompareTag("HealingPotion");
    }

    private bool IsSpeedUpPotion(Component component)
    {
        return component.CompareTag("SpeedUpPotion");
    }

    private void IncreaseSpeed(float amount)
    {
        speed += amount;
    }
    private IEnumerator SpeedUp(float speedIncrease)
    {
        IncreaseSpeed(speedIncrease);
        yield return new WaitForSeconds(3);
        IncreaseSpeed(-speedIncrease);
    }
    private void emitParticles(ParticleSystem pSystem, Vector3 position)
    {
        var p = Instantiate<ParticleSystem>(pSystem, position, Quaternion.identity);
        Destroy(p.gameObject, p.main.startLifetime.constant);
    }

    private void OnTriggerEnter(Collider other)
    {
        if (IsHealingPotion(other))
        {
            deltaLife(20);
        } else if (IsSpeedUpPotion(other))
        {
            StartCoroutine(SpeedUp(50));
        }
        emitParticles(pSystem, transform.position);
        GameObject.Destroy(other.gameObject);
    }
    
    private void OnCollisionEnter(Collision collision)
    {
        if (collision.collider.CompareTag("Enemy"))
        {
            var devil = collision.collider.GetComponent<Devil>();
            devil.TakeDamage(30f);

            animator.SetTrigger("Damaged");
            deltaLife(-50);
        }
    }

    private void Die()
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
        healthPoints += delta;
        UpdateHealthPointsText(healthPoints);
       if (healthPoints <= 0)
        {
            Die();
        }
    }
}