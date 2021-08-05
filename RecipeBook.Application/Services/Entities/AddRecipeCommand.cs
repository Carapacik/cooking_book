using System.Collections.Generic;
using RecipeBook.Application.Converters;
using RecipeBook.Application.Dtos;

namespace RecipeBook.Application.Services.Entities
{
    public class AddRecipeCommand
    {
        public AddRecipeCommand(FormFileAdapter formFileAdapter, AddRecipeCommandDto addRecipeCommandDto)
        {
            FileAdapter = formFileAdapter;
            Title = addRecipeCommandDto.Title;
            Description = addRecipeCommandDto.Description;
            CookingTimeInMinutes = addRecipeCommandDto.CookingTimeInMinutes;
            PortionsCount = addRecipeCommandDto.PortionsCount;
            Tags = addRecipeCommandDto.Tags;
            Steps = addRecipeCommandDto.Steps;
            Ingredients = addRecipeCommandDto.Ingredients;
        }

        public string Title { get; set; }
        public string Description { get; set; }
        public int CookingTimeInMinutes { get; set; }
        public int PortionsCount { get; set; }
        public List<string> Tags { get; set; }
        public List<string> Steps { get; set; }
        public List<IngredientDto> Ingredients { get; set; }
        public FormFileAdapter FileAdapter { get; set; }
    }
}