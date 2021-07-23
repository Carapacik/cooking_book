using RecipeBook.Api.Application.Dtos;
using RecipeBook.Api.Application.Entities;

namespace RecipeBook.Api.Application.Converters
{
    public static class RecipeConverter
    {
        public static Recipe Convert(this AddRecipeDetailCommandDto value)
        {
            return new()
            {
                Title = value.Title,
                Description = value.Description,
                ImageUrl = value.ImageUrl,
                CookingTimeInMinutes = value.CookingTimeInMinutes,
                PortionsCount = value.PortionsCount
                // Tags = value.Tags,
                // Steps = value.Steps,
                // Ingredients = value.Ingredients
            };
        }
    }
}