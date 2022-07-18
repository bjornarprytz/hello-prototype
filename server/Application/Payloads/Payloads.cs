namespace Application.Payloads;

public record GameStatePayload(Guid Id, Map Map, CrewDeck CrewDeck, BuildingDeck BuildingDeck, EnemyDeck EnemyDeck);
public record Map(IEnumerable<Node> Nodes);
public record Node(Building? Building, Crew? Crew, IEnumerable<Enemy> Enemies);
public record CrewDeck(IEnumerable<Crew> Cards);
public record BuildingDeck(IEnumerable<Building> Cards);
public record EnemyDeck(IEnumerable<Enemy> Cards);
public record Building(string Name, string Art, int Hp, int MaxHp, int Defense);
public record Enemy(string Name, string Art, int Fear,
    IEnumerable<string> Modifiers,
    IEnumerable<string> CreatureTypes);
public record Crew(
    string Class,
    string Name,
    string Art,
    int Resources,
    int Defense,
    IEnumerable<string> Vices,
    IEnumerable<string> Virtues);