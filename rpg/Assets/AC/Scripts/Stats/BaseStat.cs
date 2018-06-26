using System.Collections.Generic;
using System.Linq;

public class BaseStat
{
    protected BaseStat(string name, string description, int baseValue)
    {
        this.name = name;
        this.description = description;
        this.baseValue = baseValue;
        bonuses = new List<StatBonus>();
    }
    public void AddStatBonus(StatBonus bonus)
    {
        bonuses.Add(bonus);
    }
    public void RemoveStatBonus(StatBonus bonus)
    {
        bonuses.Remove(bonus);
    }

    public int Value()
    {
        return baseValue + bonuses.Aggregate<StatBonus, int>(0,
             (acc, v) =>
             {
                 return acc += v.value;
             }
        );
    }
    public override string ToString()
    {
        return "<" + name + ">" + " : " + description;
    }

    public IList<StatBonus> bonuses { get; set; }
    public string name { get; set; }
    public string description { get; set; }
    public int baseValue { get; set; }
}
