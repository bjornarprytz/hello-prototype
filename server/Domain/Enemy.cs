namespace Domain;

public class Enemy
{
    public Guid Id { get; set; }
    public string Name { get; set; }
    public string Art { get; set; }
    public int Fear { get; set; }
    public ICollection<EnemyModifier> Modifiers { get; set; } = new List<EnemyModifier>();
    public ICollection<CreatureType> CreatureTypes { get; set; } = new List<CreatureType>();
}

public enum EnemyModifier
{
    Undead,
    Large
}

public enum CreatureType
{
    Zombie,
    Troll
}