using Application.Core;
using Application.Payloads;
using LanguageExt;
using LanguageExt.Common;

namespace Application.Game;

public class Fetch
{
    public record Query(Guid GameId) : IRequestWrapper<GameStatePayload>;
    
    public class Handler : IRequestHandlerWrapper<Query, GameStatePayload>
    {
        private readonly State _state;

        public Handler(State state)
        {
            _state = state;
        }
        
        public async Task<Either<Error, GameStatePayload>> Handle(Query request, CancellationToken cancellationToken)
        {
            return _state.GameState;
        }
    }
}