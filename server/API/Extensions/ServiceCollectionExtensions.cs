using System.Text;
using API.Schema;
using API.Services;
using Application;
using Application.Game;
using Domain;
using HotChocolate.Subscriptions;
using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Persistence;

namespace API.Extensions;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddApplicationServices(this IServiceCollection services, IConfiguration config)
    {
        services.AddMediatR(typeof(Fetch.Handler).Assembly);
        services.AddDbContext<DataContext>(opt =>
            opt.UseSqlite(config.GetConnectionString("DefaultConnection")));
        services.AddSingleton<State>();

        services
            .AddGraphQLServer()
            .AddQueryType<Query>()
            .AddMutationType<Mutation>()
            .AddSubscriptionType<Subscription>()

            .RegisterService<IMediator>()
            .RegisterService<ITopicEventSender>()
            .AddInMemorySubscriptions()
            ;
        
        return services;
    }

    private static IServiceCollection AddIdentityServices(this IServiceCollection services, IConfiguration config)
    {
        services.AddIdentityCore<AppUser>(opt =>
            {
                opt.Password.RequireNonAlphanumeric = false;
                opt.User.RequireUniqueEmail = true;
            })
            .AddEntityFrameworkStores<DataContext>()
            .AddSignInManager<SignInManager<AppUser>>();

        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(config["TokenKey"]));

        services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(opt =>
            {
                opt.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = key,
                    ValidateIssuer = false,
                    ValidateAudience = false
                };
            });

        services.AddScoped<TokenService>();

        return services;
    }
}