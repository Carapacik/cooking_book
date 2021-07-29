using System.Linq;
using Microsoft.EntityFrameworkCore;
using RecipeBook.Api.Application.Entities;
using RecipeBook.Api.Application.Repositories;

namespace RecipeBook.Api.Infrastructure.Repositories
{
    public class RecipeRepository : IRecipeRepository
    {
        private readonly RecipeBookDbContext _context;

        public RecipeRepository(RecipeBookDbContext context)
        {
            _context = context;
        }

        public Recipe GetById(int id)
        {
            return _context.Set<Recipe>()
                .Include(x => x.Tags)
                .Include(x => x.Ingredients)
                    .ThenInclude(y => y.IngredientItems)
                .FirstOrDefault(x => x.RecipeId == id);
        }

        public void Add(Recipe newRecipe)
        {
            _context.Set<Recipe>().Add(newRecipe);
            _context.SaveChanges();
        }
    }
}