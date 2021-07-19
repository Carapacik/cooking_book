using Microsoft.EntityFrameworkCore;
using RecipeBook.Api.Infrastructure.Configurations;

namespace RecipeBook.Api.Infrastructure
{
    public class RecipeBookDbContext : DbContext, IUnitOfWork
    {
        public RecipeBookDbContext(DbContextOptions<RecipeBookDbContext> options) : base(options)
        {
        }

        public void Commit()
        {
            SaveChanges();
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new IngredientConfiguration());
            modelBuilder.ApplyConfiguration(new IngredientItemConfiguration());
            modelBuilder.ApplyConfiguration(new UserRatingConfiguration());
            modelBuilder.ApplyConfiguration(new RecipeConfiguration());
            modelBuilder.ApplyConfiguration(new StepConfiguration());
            modelBuilder.ApplyConfiguration(new TagConfiguration());
            modelBuilder.ApplyConfiguration(new UserConfiguration());
        }
    }
}