using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Sword : MonoBehaviour, IWeapon {
    
    public IList<BaseStat> Stats
    {
        get
        {
        return null;
           // Stats = new List<BaseStat> { new Strength() };
        }
    }

    public void PerformAttack()
    {
        throw new System.NotImplementedException();
    }

    // Use this for initialization
    void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
