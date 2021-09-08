using Microsoft.Extensions.DependencyInjection;
using RecipeBook.Api.Builder;
using RecipeBook.Application.Services;
using RecipeBook.Domain;
using RecipeBook.Domain.Repositories;
using RecipeBook.Infrastructure;
using RecipeBook.Infrastructure.Repositories;

namespace RecipeBook.Api
{
    public static class ServiceCollectionDependencies
    {
        public static void AddDependencies( this IServiceCollection services )
        {
            services.AddScoped<IRatingRepository, RatingRepository>();
            services.AddScoped<IRecipeRepository, RecipeRepository>();
            services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<IUnitOfWork, UnitOfWork>();
            services.AddScoped<IRatingService, RatingService>();
            services.AddScoped<IRecipeService, RecipeService>();
            services.AddScoped<IUserService, UserService>();
            services.AddScoped<IFileStorageService, FileStorageService>();
            services.AddScoped<RecipeBuilder>();
        }
    }
}
