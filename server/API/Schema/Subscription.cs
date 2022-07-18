using Application.Payloads;

namespace API.Schema;

public class Subscription
{
    [Subscribe]
    [Topic]
    public GameStatePayload OnGameStarted([EventMessage] GameStatePayload gameState) => gameState;
}