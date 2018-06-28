using UnityEngine;

public class PlayerLevel : MonoBehaviour {

	public int Level { get; private set; }
    public int CurrentExperience { get; set; }
    public int RequiredExperience { get { return Level * 10; } }
    void Start()
    {
        Level = 10;
        UIController.PlayerLevelChanged(Level);
    }

    public void GrantExperience(int amount)
    {
        CurrentExperience += amount;
        while(CurrentExperience >= RequiredExperience)
        {
            CurrentExperience -= RequiredExperience;
            Level--;
        }
        UIController.PlayerLevelChanged(Level);
    }
}
