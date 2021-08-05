namespace RecipeBook.Infrastructure.Configurations
{
    public class IngredientConfiguration : IEntityTypeConfiguration<Ingredient>
    {
        public void Configure(EntityTypeBuilder<Ingredient> builder)
        {
            builder.ToTable("Ingredient").HasKey(item => item.IngredientId);
            builder.Property(x => x.Title).IsRequired();
        }
    }
}