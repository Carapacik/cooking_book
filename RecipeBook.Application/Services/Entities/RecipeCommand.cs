using System.Collections.Generic;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Application.Services.Entities
{
    public class RecipeCommand
    {
        public RecipeCommand( int id,
            string title,
            string description,
            int cookingTimeInMinutes,
            int portionsCount,
            List<string> tags,
            List<string> steps,
            List<Ingredient> ingredients,
            StorageFile storageFile )
        {
            RecipeId = id;
            Title = title;
            Description = description;
            CookingTimeInMinutes = cookingTimeInMinutes;
            PortionsCount = portionsCount;
            Tags = tags;
            Steps = steps;
            Ingredients = ingredients;
            StorageFile = storageFile;
        }

        public int RecipeId { get; init; }
        public string Title { get; init; }
        public string Description { get; init; }
        public int CookingTimeInMinutes { get; init; }
        public int PortionsCount { get; init; }
        public List<string> Tags { get; init; }
        public List<string> Steps { get; init; }
        public List<Ingredient> Ingredients { get; init; }
        public StorageFile StorageFile { get; init; }
    }
}
