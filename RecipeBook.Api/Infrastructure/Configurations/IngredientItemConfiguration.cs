using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RecipeBook.Api.Application.Entities;

namespace RecipeBook.Api.Infrastructure.Configurations
{
    public class IngredientItemConfiguration : IEntityTypeConfiguration<IngredientItem>
    {
        public void Configure(EntityTypeBuilder<IngredientItem> builder)
        {
            builder.ToTable("IngredientItem").HasKey(item => item.IngredientItemId);
            builder.Property(x => x.Name).IsRequired();
        }
    }
}