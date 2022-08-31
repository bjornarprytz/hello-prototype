using API.Extensions;

var builder = WebApplication.CreateBuilder(args);

builder.Logging.ConfigureSerilog(builder.Configuration, builder.Environment);
builder.Services.AddApplicationServices(builder.Configuration);

var app = builder.Build();

app.UseWebSockets();
app.MapGraphQL();

app.Logger.LogInformation("Starting Server!");

app.Run();
