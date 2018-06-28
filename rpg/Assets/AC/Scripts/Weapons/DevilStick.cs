using System.Collections.Generic;
using UnityEngine;

public class DevilStick :  MonoBehaviour, IWeapon
{
    public Animator Animator { get; private set; }
 
    private void Start()
    {
        Animator = GetComponentInParent<Animator>();
        Stats = new List<BaseStat> { new Strength() };
    }

    public IList<BaseStat> Stats { get; private set; }

    public void PerformAttack()
    {
        Animator.SetTrigger("Attack");
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            other.GetComponent<Player>().TakeDamage(Stats[0].Value());
        }
    }
}
