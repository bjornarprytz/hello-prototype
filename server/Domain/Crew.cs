namespace Domain;

public class Crew
{
    public Guid Id { get; set; }
    public string Class { get; set; }
    public string Name { get; set; }
    public string Art { get; set; }
    public int Resources { get; set; }
    public int Defense { get; set; }
    public ICollection<Vice> Vices { get; set; } = new List<Vice>();
    public ICollection<Virtue> Virtues { get; set; } = new List<Virtue>();
}

public enum Vice
{
    Greedy
}

public enum Virtue
{
    Brave
}