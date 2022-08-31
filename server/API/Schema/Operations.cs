using Application.Game;
using Application.Payloads;
using LanguageExt.UnsafeValueAccess;
using MediatR;

namespace API.Schema;

public class Query
{
    public async Task<GameStatePayload> FetchGame(
        Fetch.Query query,
        IMediator mediator,
        CancellationToken cancellationToken)
    {
        var gameState = await mediator.Send(query, cancellationToken);

        return gameState.ValueUnsafe();
    }
}

public class Mutation
{
    public async Task<GameStatePayload> StartGame(
        IMediator mediator,
        CancellationToken cancellationToken)
    {
        if (await mediator.Send(new Start.Command(), cancellationToken)
                is not { IsRight: true } result
            ||
            result.ValueUnsafe() is not { } gameState)
        {
            throw new Exception("Failed to start game");
        }

        return gameState;
    }
}

public class Subscription
{
    [Subscribe]
    [Topic]
    public GameStatePayload OnGameStarted([EventMessage] GameStatePayload gameState) => gameState;

}
