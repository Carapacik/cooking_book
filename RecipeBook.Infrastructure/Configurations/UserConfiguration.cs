using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Infrastructure.Configurations
{
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure( EntityTypeBuilder<User> builder )
        {
            builder.ToTable( "User" ).HasKey( item => item.UserId );
            builder.Property( x => x.Name ).IsRequired();
            builder.Property( x => x.Description ).HasMaxLength( 150 );
            builder.Property( x => x.Login ).IsRequired().HasMaxLength( 20 );
            builder.Property( x => x.Password ).IsRequired(); // Максимальная длина нужна для hash?
        }
    }
}
