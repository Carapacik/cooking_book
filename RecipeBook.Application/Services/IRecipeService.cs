using System.Collections.Generic;
using System.Threading.Tasks;
using RecipeBook.Application.Entities;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Application.Services
{
    public interface IRecipeService
    {
        Task<Recipe> AddRecipe( RecipeCommand command );
        Task DeleteRecipe( int id, string username );
        Task<Recipe> EditRecipe( RecipeCommand editCommand );
        Task<IReadOnlyList<Recipe>> GetFavoriteRecipes( int skip, int take, string username );
        Task<IReadOnlyList<Recipe>> GetUserOwnedRecipes( int skip, int take, string username );
    }
}
