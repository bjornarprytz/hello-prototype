using Application.Core;
using Application.Payloads;
using Bogus;
using LanguageExt;
using LanguageExt.Common;

namespace Application.Game;

public class Start
{
    public record Command : IRequestWrapper<GameStatePayload>;
    
    public class Handler : IRequestHandlerWrapper<Command, GameStatePayload>
    {
        private readonly State _state;

        public Handler(State state)
        {
            _state = state;
        }
        
        public async Task<Either<Error, GameStatePayload>> Handle(Command request, CancellationToken cancellationToken)
        {
            return _state.GameState;
        }
    }
}