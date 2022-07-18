using Application.Game;
using Application.Payloads;
using LanguageExt.UnsafeValueAccess;
using MediatR;

namespace API.Schema;

public class Query
{
    public async Task<GameStatePayload> FetchGame(
        Fetch.Query query,
        [Service] IMediator mediator,
        CancellationToken cancellationToken)
    {
        var gameState = await mediator.Send(query, cancellationToken);

        return gameState.ValueUnsafe();
    }
}