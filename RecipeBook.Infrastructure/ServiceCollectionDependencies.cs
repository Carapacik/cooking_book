using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using RecipeBook.Application;
using RecipeBook.Application.Services;
using RecipeBook.Domain.Repositories;
using RecipeBook.Infrastructure.Repositories;

namespace RecipeBook.Infrastructure
{
    public static class ServiceCollectionDependencies
    {
        public static void AddDependencies( this IServiceCollection services )
        {
            services.AddScoped<IRecipeRepository, RecipeRepository>();
            services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<IUnitOfWork, UnitOfWork>();
            services.AddScoped<IRecipeService, RecipeService>();
            services.AddScoped<IUserService, UserService>();
            services.AddScoped<IFileStorageService, FileStorageService>();
        }

        public static void ConfigureDatabase( this DbContextOptionsBuilder dbOptions, string connectionString )
        {
            dbOptions.UseNpgsql( connectionString, b => b.MigrationsAssembly( "RecipeBook.Migrations" ) );
        }
    }
}
