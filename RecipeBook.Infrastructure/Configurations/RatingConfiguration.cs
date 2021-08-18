using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Infrastructure.Configurations
{
    public class RatingConfiguration : IEntityTypeConfiguration<Rating>
    {
        public void Configure( EntityTypeBuilder<Rating> builder )
        {
            builder.ToTable( nameof( Rating ) ).HasKey( x => new { x.RecipeId, x.UserId } );
        }
    }
}
