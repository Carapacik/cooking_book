using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RecipeBook.Api.Application.Entities;

namespace RecipeBook.Api.Infrastructure.Configurations
{
    public class UserRatingConfiguration : IEntityTypeConfiguration<UserRating>
    {
        public void Configure(EntityTypeBuilder<UserRating> builder)
        {
            builder.ToTable("UserRating").HasKey(x => new {x.RecipeId, x.UserId});
        }
    }
}