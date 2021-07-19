using RecipeBook.Api.Application.Entities;

namespace RecipeBook.Api.Application.Repositories
{
    public interface IRecipeRepository
    {
        Recipe GetById(int id);
        void Add(Recipe recipe);
    }
}