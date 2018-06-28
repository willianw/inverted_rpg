using System.Collections.Generic;

public interface IWeapon {
    IList<BaseStat> Stats { get; }
    void PerformAttack();
}
