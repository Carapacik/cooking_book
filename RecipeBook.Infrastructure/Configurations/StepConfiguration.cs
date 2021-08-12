using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Infrastructure.Configurations
{
    public class StepConfiguration : IEntityTypeConfiguration<Step>
    {
        public void Configure( EntityTypeBuilder<Step> builder )
        {
            builder.ToTable( "Step" ).HasKey( item => item.StepId );
            builder.Property( x => x.Description ).IsRequired();
        }
    }
}
