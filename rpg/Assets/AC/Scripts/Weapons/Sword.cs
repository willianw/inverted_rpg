using System.Collections.Generic;
using UnityEngine;

public class Sword : MonoBehaviour, IWeapon {

    public Animator Animator { get; private set; }
    public IList<BaseStat> Stats { get; private set; }

    private void Start()
    {
        Animator = GetComponentInParent<Animator>();
        Stats = new List<BaseStat> { new Strength() };
    }    

    public void PerformAttack()
    {
        Animator.SetTrigger("Attack");
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Enemy"))
        {
            other.GetComponent<Devil>().TakeDamage(Stats[0].Value());
        }
    }
}

