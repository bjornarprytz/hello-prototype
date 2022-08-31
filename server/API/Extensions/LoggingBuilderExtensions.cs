using Serilog;
using Serilog.Sinks.Elasticsearch;

namespace API.Extensions;

public static class LoggingBuilderExtensions
{
    public static ILoggingBuilder ConfigureSerilog(this ILoggingBuilder loggingBuilder, IConfiguration config, IWebHostEnvironment environment)
    {
        var logger = new LoggerConfiguration()
            .Enrich.FromLogContext()
            .WriteTo.Console()
            .WriteTo.Elasticsearch(new ElasticsearchSinkOptions(
                new Uri(config["ElasticConfiguration:Uri"]))
                {
                    IndexFormat = $"{config["ApplicationName"]}-logs-{environment.EnvironmentName?.ToLower().Replace(".", "-")}-{DateTime.UtcNow:yyyy-MM}",
                    AutoRegisterTemplate = true,
                    NumberOfShards = 2,
                    NumberOfReplicas = 1
                }
            )
            .Enrich.WithProperty("Environment", environment.EnvironmentName ?? "Undefined env")
            .ReadFrom.Configuration(config)
            .CreateLogger();
        
        loggingBuilder.AddSerilog(logger);
        
        return loggingBuilder;
    }
}