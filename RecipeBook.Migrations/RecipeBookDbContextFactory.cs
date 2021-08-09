using System.IO;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using RecipeBook.Infrastructure;

namespace RecipeBook.Migrations
{
    public class RecipeBookDbContextFactory : IDesignTimeDbContextFactory<RecipeBookDbContext>
    {
        public RecipeBookDbContext CreateDbContext(string[] args)
        {
            var configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", true)
                .AddEnvironmentVariables()
                .Build();

            var builder = new DbContextOptionsBuilder<RecipeBookDbContext>();
            var connectionString = configuration.GetConnectionString("ConnectionString");
            builder.ConfigureDatabase(connectionString);
            
            return new RecipeBookDbContext(builder.Options);
        }
    }
}