using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RecipeBook.Application.Entities;

namespace RecipeBook.Infrastructure.Configurations
{
    public class RecipeConf : IEntityTypeConfiguration<Recipe>
    {
        public void Configure(EntityTypeBuilder<Recipe> builder)
        {
            builder.ToTable("Recipe").HasKey(item => item.RecipeId);
        }
    }
}