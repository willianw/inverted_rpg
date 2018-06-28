using UnityEngine;

public class UIController : MonoBehaviour {

    public delegate void PlayerHealthChangedHandler(int health);
    public static event PlayerHealthChangedHandler OnPlayerHealthChanged;

    public delegate void PlayerLevelChangedHandler(int level);
    public static event PlayerLevelChangedHandler OnPlayerLevelChanged;

    public delegate void PlayerStrengthChangedHandler(int strength);
    public static event PlayerStrengthChangedHandler OnPlayerStrengthChanged;

    public delegate void PlayerAgilityChangedHandler(int agility);
    public static event PlayerAgilityChangedHandler OnPlayerAgilityChanged;

    public delegate void PlayerVitalityChangedHandler(int vitality);
    public static event PlayerVitalityChangedHandler OnPlayerVitalityChanged;

    public static void PlayerVitalityChanged(int vitality)
    {
        if (OnPlayerVitalityChanged != null)
        {
            OnPlayerVitalityChanged(vitality);
        }
    }

    public static void PlayerAgilityChanged(int agility)
    {
        if (OnPlayerAgilityChanged != null)
        {
            OnPlayerAgilityChanged(agility);
        }
    }

    public static void PlayerStrengthChanged(int strength)
    {
        if (OnPlayerStrengthChanged != null)
        {
            OnPlayerStrengthChanged(strength);
        }
    }

    public static void PlayerHealthChanged(int health)
    {
        if (OnPlayerHealthChanged != null)
        {
            OnPlayerHealthChanged(health);
        }
    }
    public static void PlayerLevelChanged(int level)
    {
        if (OnPlayerLevelChanged != null)
        {
            OnPlayerLevelChanged(level);
        }
    }

}
