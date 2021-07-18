using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RecipeBook.Application.Entities;

namespace RecipeBook.Infrastructure.Configurations
{
    public class IngredientConf : IEntityTypeConfiguration<Ingredient>
    {
        public void Configure(EntityTypeBuilder<Ingredient> builder)
        {
            builder.ToTable("Ingredient").HasKey(item => item.IngredientId);
        }
    }
}