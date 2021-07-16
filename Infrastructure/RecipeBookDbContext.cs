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
            modelBuilder.ApplyConfiguration(new RecipeConfiguration());
        }
    }
}