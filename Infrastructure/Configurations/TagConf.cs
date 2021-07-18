using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RecipeBook.Application.Entities;

namespace RecipeBook.Infrastructure.Configurations
{
    public class TagConf : IEntityTypeConfiguration<Tag>
    {
        public void Configure(EntityTypeBuilder<Tag> builder)
        {
            builder.ToTable("Tag").HasKey(item => item.TagId);
        }
    }
}