using System.Collections.Generic;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Application.Services.Entities
{
    public class AddRecipeCommand
    {
        public AddRecipeCommand(string title,
            string description,
            int cookingTimeInMinutes,
            int portionsCount,
            List<string> tags,
            List<string> steps,
            List<Ingredient> ingredients,
            RecipeFile file)
        {
            Title = title;
            Description = description;
            CookingTimeInMinutes = cookingTimeInMinutes;
            PortionsCount = portionsCount;
            Tags = tags;
            Steps = steps;
            Ingredients = ingredients;
            File = file;
        }

        public string Title { get; init; }
        public string Description { get; init; }
        public int CookingTimeInMinutes { get; init; }
        public int PortionsCount { get; init; }
        public List<string> Tags { get; init; }
        public List<string> Steps { get; init; }
        public List<Ingredient> Ingredients { get; }
        public RecipeFile File { get; }
    }
}