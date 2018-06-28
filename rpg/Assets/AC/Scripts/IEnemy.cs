public interface IEnemy {
    void Die();
    void TakeDamage(float damage);
    int Experience { get; }
}
