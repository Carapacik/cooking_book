using System.Collections.Generic;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Domain.Repositories
{
    public interface IRecipeRepository
    {
        void Add(Recipe recipe);
        void Edit(Recipe recipe);
        Recipe GetById(int id);
        Recipe GetRecipeOfDay();
        IEnumerable<Recipe> Search(int skip, int take, string searchQuery);
    }
}