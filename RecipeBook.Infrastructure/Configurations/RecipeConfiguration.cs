using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Infrastructure.Configurations
{
    public class RecipeConfiguration : IEntityTypeConfiguration<Recipe>
    {
        public void Configure( EntityTypeBuilder<Recipe> builder )
        {
            builder.ToTable( nameof( Recipe ) ).HasKey( x => x.RecipeId );
            builder.Property( x => x.Title ).IsRequired();
            builder.Property( x => x.Description ).IsRequired().HasMaxLength( 150 );
            builder.Property( x => x.ImageUrl ).IsRequired();
            builder.Property( x => x.CookingTimeInMinutes ).IsRequired();
            builder.Property( x => x.PortionsCount ).IsRequired();
            builder.Property( x => x.CreationDateTime ).IsRequired();
        }
    }
}
