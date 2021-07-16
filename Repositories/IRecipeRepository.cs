using RecipeBook.Entities;

namespace RecipeBook.Repositories
{
    public interface IRecipeRepository
    {
        RecipeEntity GetById(string id);
    }
}