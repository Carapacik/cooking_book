namespace RecipeBook.Infrastructure.Configurations
{
    public class RecipeConfiguration : IEntityTypeConfiguration<Recipe>
    {
        public void Configure(EntityTypeBuilder<Recipe> builder)
        {
            builder.ToTable("Recipe").HasKey(x => x.RecipeId);
            builder.Property(x => x.Title).IsRequired();
            builder.Property(x => x.Description).IsRequired().HasMaxLength(150);
            builder.Property(x => x.ImageUrl).IsRequired();
            builder.Property(x => x.CookingTimeInMinutes).IsRequired();
            builder.Property(x => x.PortionsCount).IsRequired();
        }
    }
}