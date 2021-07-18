using Microsoft.EntityFrameworkCore;
using RecipeBook.Infrastructure.Configurations;

namespace RecipeBook.Infrastructure
{
    public class RecipeBookDbContext : DbContext
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
            modelBuilder.ApplyConfiguration(new IngredientConf());
            modelBuilder.ApplyConfiguration(new IngredientItemConf());
            modelBuilder.ApplyConfiguration(new LikeConf());
            modelBuilder.ApplyConfiguration(new RecipeConf());
            modelBuilder.ApplyConfiguration(new StepConf());
            modelBuilder.ApplyConfiguration(new TagConf());
            modelBuilder.ApplyConfiguration(new UserConf());
        }
    }
}