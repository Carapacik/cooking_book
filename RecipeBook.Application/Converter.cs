using System.Linq;
using RecipeBook.Application.Services.Entities;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Application
{
    public static class Converter
    {
        public static Recipe Convert(this AddRecipeCommand addRecipeCommandDto, SaveFileResult saveFileResult)
        {
            return new Recipe
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
                Ingredients = addRecipeCommandDto.Ingredients.ToList()
            };
        }
    }
}