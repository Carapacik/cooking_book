using Microsoft.Extensions.DependencyInjection;
using RecipeBook.Api.Application.Repositories;
using RecipeBook.Api.Application.Services;
using RecipeBook.Api.Infrastructure.Repositories;

namespace RecipeBook.Api.Infrastructure
{
    public static class ServiceCollectionDependencies
    {
        public static void AddDependencies(this IServiceCollection services)
        {
            services.AddScoped<IRecipeRepository, RecipeRepository>();
            services.AddScoped<IUnitOfWork, UnitOfWork>();
            services.AddScoped<IRecipeService, RecipeService>();
            services.AddScoped<IStaticService, StaticService>();
        }
    }
}