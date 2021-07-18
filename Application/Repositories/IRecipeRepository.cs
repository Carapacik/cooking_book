using RecipeBook.Application.Entities;

namespace RecipeBook.Application.Repositories
{
    public interface IRecipeRepository
    {
        Recipe GetById(int id);
        void Add(Recipe recipe);
    }
}