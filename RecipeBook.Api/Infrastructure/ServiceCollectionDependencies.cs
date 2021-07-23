using Microsoft.Extensions.DependencyInjection;
using RecipeBook.Api.Application.Repositories;
using RecipeBook.Api.Infrastructure.Repositories;

namespace RecipeBook.Api.Infrastructure
{
    public static class ServiceCollectionDependencies
    {
        public static IServiceCollection AddDependencies(this IServiceCollection services)
        {
            services.AddScoped<IRecipeRepository, RecipeRepository>();
            services.AddScoped<IUnitOfWork, RecipeBookDbContext>();

            return services;
        }
    }
}