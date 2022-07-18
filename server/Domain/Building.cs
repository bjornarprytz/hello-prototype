namespace Domain;

public class Building
{
    public Guid Id { get; set; }
    public string Name { get; set; }
    public string Art { get; set; }
    public int HitPoints { get; set; }
    public int Defense { get; set; }
    public ICollection<BuildingEffect> Effects { get; set; } = new List<BuildingEffect>();
}

public enum BuildingEffect
{
    Train,
    Mine
}