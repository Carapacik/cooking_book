using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RecipeBook.Entities;

namespace RecipeBook.Infrastructure.Configurations
{
    public class RecipeConfiguration : IEntityTypeConfiguration<RecipeEntity>
    {
        public void Configure(EntityTypeBuilder<RecipeEntity> builder)
        {
            builder.ToTable("Recipe").HasKey(item => item.Id);
            builder.Property(item => item.Id).HasColumnName("Recipe");
        }
    }
}