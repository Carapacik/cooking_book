using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RecipeBook.Application.Entities;

namespace RecipeBook.Infrastructure.Configurations
{
    public class StepConf : IEntityTypeConfiguration<Step>
    {
        public void Configure(EntityTypeBuilder<Step> builder)
        {
            builder.ToTable("Step").HasKey(item => item.StepId);
        }
    }
}