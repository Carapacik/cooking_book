using System.Linq;
using RecipeBook.Api.Application.Dtos;
using RecipeBook.Api.Application.Entities;
using RecipeBook.Api.Application.Services.Entities;

namespace RecipeBook.Api.Application.Converters
{
    public static class RecipeConverter
    {
        public static Recipe Convert(this AddRecipeCommand addRecipeCommandDto, SaveFileResult saveFileResult)
        {
            return new()
            {
                ImageUrl = saveFileResult.RelativeUri,
                Title = addRecipeCommandDto.Title,
                Description = addRecipeCommandDto.Description,
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

        public static RecipeOfDayDto ConvertToRecipeOfDayDto(this Recipe recipe)
        {
            return new()
            {
                RecipeId = recipe.RecipeId,
                Title = recipe.Title,
                Description = recipe.Description,
                ImageUrl = recipe.ImageUrl,
                CookingTimeInMinutes = recipe.CookingTimeInMinutes,
                LikesCount = recipe.LikesCount,
                Username = recipe.UserId + " name"
            };
        }

        public static RecipeDto ConvertToRecipeDto(this Recipe recipe)
        {
            return new()
            {
                RecipeId = recipe.RecipeId,
                Title = recipe.Title,
                Description = recipe.Description,
                ImageUrl = recipe.ImageUrl,
                CookingTimeInMinutes = recipe.CookingTimeInMinutes,
                PortionsCount = recipe.PortionsCount,
                LikesCount = recipe.LikesCount,
                FavoritesCount = recipe.FavoritesCount,
                Username = recipe.UserId + " name",
                Tags = recipe.Tags.Select(x => x.Name).ToList()
            };
        }
    }
}