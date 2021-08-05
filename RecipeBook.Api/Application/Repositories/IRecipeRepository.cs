using System.Collections.Generic;
using RecipeBook.Api.Application.Entities;

namespace RecipeBook.Api.Application.Repositories
{
    public interface IRecipeRepository
    {
        void Add(Recipe recipe);
        Recipe GetById(int id);
        Recipe GetRecipeOfDay();
        IEnumerable<Recipe> Search(int skip, int take, string searchQuery);
    }
}