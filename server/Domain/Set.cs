namespace Domain;

public class Set
{
    public Guid Id { get; set; }
    public string Name { get; set; }
    public string Art { get; set; }
    public ICollection<Crew> Crews { get; set; }
    public ICollection<Enemy> Enemies { get; set; }
    public ICollection<Building> Buildings { get; set; }
}