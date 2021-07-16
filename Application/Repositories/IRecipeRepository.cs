using RecipeBook.Application.Entities;

namespace RecipeBook.Application.Repositories
{
    public interface IRecipeRepository
    {
        Recipe GetById(long id);
        void Add(Recipe recipe);
    }
}