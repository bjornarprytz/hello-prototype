using Application.Payloads;
using Bogus;

namespace Application;

public class State
{
    public State()
    {
        GameState = new GameStatePayload(Guid.NewGuid(), "Placeholder for persistent game state");
    }
    
    public GameStatePayload GameState { get; }
}