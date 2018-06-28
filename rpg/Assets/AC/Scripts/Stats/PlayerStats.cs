using System.Collections.Generic;
using System.Linq;

public class PlayerStats {
    public PlayerStats()
    {
        Stats = new List<BaseStat> { new Vitality(), new Agility(), new Strength()};
    }
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
}
