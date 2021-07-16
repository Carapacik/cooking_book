using Microsoft.Extensions.DependencyInjection;
using RecipeBook.Application.Repositories;
using RecipeBook.Repositories;

namespace RecipeBook.Infrastructure
{
    public static class ServiceCollectionDependencies
    {
        public static IServiceCollection AddDependencies(this IServiceCollection services)
        {
            services.AddScoped<IRecipeRepository, RecipeRepository>();

            return services;
        }
    }
}