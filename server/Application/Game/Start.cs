using Application.Core;
using Application.Payloads;
using LanguageExt;
using LanguageExt.Common;
using Microsoft.Extensions.Logging;

namespace Application.Game;

public class Start
{
    public record Command : IRequestWrapper<GameStatePayload>;
    
    public class Handler : IRequestHandlerWrapper<Command, GameStatePayload>
    {
        private readonly State _state;
        private readonly ILogger<Handler> _logger;

        public Handler(State state, ILogger<Handler> logger)
        {
            _state = state;
            _logger = logger;
        }
        
        public async Task<Either<Error, GameStatePayload>> Handle(Command request, CancellationToken cancellationToken)
        {
            _logger.LogInformation("Starting game!");
            
            return _state.GameState;
        }
    }
}