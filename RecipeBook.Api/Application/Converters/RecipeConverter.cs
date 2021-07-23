using System.Linq;
using RecipeBook.Api.Application.Dtos;
using RecipeBook.Api.Application.Entities;

namespace RecipeBook.Api.Application.Converters
{
    public static class RecipeConverter
    {
        public static Recipe Convert(this AddRecipeCommandDto addRecipeCommandDto)
        {
            return new()
            {
                Title = addRecipeCommandDto.Title,
                Description = addRecipeCommandDto.Description,
                ImageUrl = addRecipeCommandDto.ImageUrl,
                CookingTimeInMinutes = addRecipeCommandDto.CookingTimeInMinutes,
                PortionsCount = addRecipeCommandDto.PortionsCount,
                Tags = addRecipeCommandDto.Tags.Select(x => new Tag
                {
                    Name = x
                }).ToList(),
                Steps = addRecipeCommandDto.Steps.Select(x => new Step
                {
                    Description = x
                }).ToList(),
                Ingredients = addRecipeCommandDto.Ingredients.Select(x => new Ingredient
                {
                    Title = x.Title,
                    IngredientItems = x.IngredientNames.Select(y => new IngredientItem
                    {
                        Name = y
                    }).ToList()
                }).ToList()
            };
        }
    }
}