namespace RecipeBook.Infrastructure.Configurations
{
    public class IngredientItemConfiguration : IEntityTypeConfiguration<IngredientItem>
    {
        public void Configure(EntityTypeBuilder<IngredientItem> builder)
        {
            builder.ToTable("IngredientItem").HasKey(item => item.IngredientItemId);
            builder.Property(x => x.Name).IsRequired();
        }
    }
}