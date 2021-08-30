using System.Linq;
using RecipeBook.Api.Dtos;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Api.Converters
{
    public static class RecipeConverter
    {
        public static RecipeDetailDto ConvertToRecipeDetailDto( this Recipe recipe, string username, Rating rating )
        {
            return new RecipeDetailDto
            {
                RecipeId = recipe.RecipeId,
                Title = recipe.Title,
                Description = recipe.Description,
                ImageUrl = recipe.ImageUrl,
                CookingTimeInMinutes = recipe.CookingTimeInMinutes,
                PortionsCount = recipe.PortionsCount,
                LikesCount = recipe.LikesCount,
                FavoritesCount = recipe.FavoritesCount,
                Username = username,
                IsLiked = rating?.IsLiked ?? false,
                IsFavorite = rating?.InFavorite ?? false,
                Tags = recipe.Tags.Select( x => x.Name ).ToList(),
                Steps = recipe.Steps.OrderBy( x => x.Number ).Select( x => x.Description ).ToList(),
                Ingredients = recipe.Ingredients.Select( x => new IngredientDto
                {
                    Title = x.Title, IngredientNames = x.IngredientItems.Select( y => y.Name ).ToList()
                } ).ToList()
            };
        }

        public static RecipeDto ConvertToRecipeDto( this Recipe recipe, string username, Rating rating )
        {
            return new RecipeDto
            {
                RecipeId = recipe.RecipeId,
                Title = recipe.Title,
                Description = recipe.Description,
                ImageUrl = recipe.ImageUrl,
                CookingTimeInMinutes = recipe.CookingTimeInMinutes,
                PortionsCount = recipe.PortionsCount,
                LikesCount = recipe.LikesCount,
                FavoritesCount = recipe.FavoritesCount,
                Username = username,
                IsLiked = rating?.IsLiked ?? false,
                IsFavorite = rating?.InFavorite ?? false,
                Tags = recipe.Tags.Select( x => x.Name ).ToList()
            };
        }

        public static RecipeOfDayDto ConvertToRecipeOfDayDto( this Recipe recipe, string username )
        {
            return new RecipeOfDayDto
            {
                RecipeId = recipe.RecipeId,
                Title = recipe.Title,
                Description = recipe.Description,
                ImageUrl = recipe.ImageUrl,
                CookingTimeInMinutes = recipe.CookingTimeInMinutes,
                LikesCount = recipe.LikesCount,
                Username = username
            };
        }
    }
}
