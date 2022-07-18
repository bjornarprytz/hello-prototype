using Application.Game;
using Application.Payloads;
using HotChocolate.Subscriptions;
using LanguageExt.UnsafeValueAccess;
using MediatR;

namespace API.Schema;

public class Mutation
{
    public async Task<GameStatePayload> StartGame(
        [Service] IMediator mediator,
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