using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class PlayerStats : MonoBehaviour {

    public IList<BaseStat> Stats { get; private set; }
    public BaseStat FindByName(string name)
    {
        return Stats.Where(stat => stat.name == name).FirstOrDefault();
    }
    public T Find<T>() where T : BaseStat
    {
        var found = Stats.Where(stat => stat.GetType() == typeof(T)).FirstOrDefault();
        return found != null ? (T)found : null;
    }
    void Start () {
        Stats = new List<BaseStat>{ new Vitality(), new Agility()};
	}
}
