using UnityEngine;
using UnityEngine.UI;

public class CharacterPanel : MonoBehaviour {

    [SerializeField]
    private Text HPText;
    [SerializeField]
    private Text LevelText;
    [SerializeField]
    private Text StrengthText;
    [SerializeField]
    private Text VitalityText;
    [SerializeField]
    private Text AgilityText;

    public bool IsActive { get; private set; }
    void Start()
    {
        IsActive = true;
        UIController.OnPlayerHealthChanged += UpdateHealth;
        UIController.OnPlayerLevelChanged += UpdateLevel;
        UIController.OnPlayerAgilityChanged += UpdateAgility;
        UIController.OnPlayerStrengthChanged += UpdateStrength;
        UIController.OnPlayerVitalityChanged += UpdateVitality;
    }
    void FixedUpdate()
    {
        if (Input.GetKeyDown(KeyCode.F1))
        {
            Debug.Log("active : " + gameObject.activeSelf);
            if (IsActive)
            {
                gameObject.SetActive(false);
                IsActive = false;
            }
            else
            {
                gameObject.SetActive(true);
                IsActive = true;
            }
        }    
    }
    void UpdateStrength(int strength)
    {
        StrengthText.text = "Strength : " + strength.ToString(); 
    }
    void UpdateAgility(int agility)
    {
        AgilityText.text = "Agility : " + agility.ToString();
    }
    void UpdateVitality(int vitality)
    {
        VitalityText.text = "Vitality : " + vitality.ToString();
    }
    void UpdateHealth(int health)
    {
        HPText.text = health.ToString();
    }
    void UpdateLevel(int level)
    {
        LevelText.text = level.ToString();
    }
}
