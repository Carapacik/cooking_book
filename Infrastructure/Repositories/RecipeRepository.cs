using System.Linq;
using RecipeBook.Application.Entities;
using RecipeBook.Application.Repositories;
using RecipeBook.Infrastructure;

namespace RecipeBook.Repositories
{
    public class RecipeRepository : IRecipeRepository
    {
        private readonly RecipeBookDbContext _context;

        public RecipeRepository(RecipeBookDbContext context)
        {
            _context = context;
        }

        public Recipe GetById(long id)
        {
            return _context.Set<Recipe>().FirstOrDefault(x => x.RecipeId == id);
        }

        public void Add(Recipe newRecipe)
        {
            _context.Set<Recipe>().Add(newRecipe);
        }
    }
}