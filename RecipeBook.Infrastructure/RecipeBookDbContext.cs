using Microsoft.EntityFrameworkCore;
using RecipeBook.Infrastructure.Configurations;

namespace RecipeBook.Infrastructure
{
    public class RecipeBookDbContext : DbContext
    {
        public RecipeBookDbContext( DbContextOptions<RecipeBookDbContext> options ) : base( options )
        {
        }

        protected override void OnModelCreating( ModelBuilder modelBuilder )
        {
            modelBuilder.ApplyConfiguration( new IngredientConfiguration() );
            modelBuilder.ApplyConfiguration( new IngredientItemConfiguration() );
            modelBuilder.ApplyConfiguration( new RecipeConfiguration() );
            modelBuilder.ApplyConfiguration( new StepConfiguration() );
            modelBuilder.ApplyConfiguration( new TagConfiguration() );
            modelBuilder.ApplyConfiguration( new UserConfiguration() );
            modelBuilder.ApplyConfiguration( new UserRatingConfiguration() );
        }
    }
}
