using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Infrastructure.Configurations
{
    public class IngredientItemConfiguration : IEntityTypeConfiguration<IngredientItem>
    {
        public void Configure( EntityTypeBuilder<IngredientItem> builder )
        {
            builder.ToTable( nameof( IngredientItem ) ).HasKey( item => item.IngredientItemId );
            builder.Property( x => x.Name ).IsRequired();
        }
    }
}
