using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RecipeBook.Application.Entities;

namespace RecipeBook.Infrastructure.Configurations
{
    public class IngredientItemConf : IEntityTypeConfiguration<IngredientItem>
    {
        public void Configure(EntityTypeBuilder<IngredientItem> builder)
        {
            builder.ToTable("IngredientItem").HasKey(item => item.IngredientItemId);
        }
    }
}