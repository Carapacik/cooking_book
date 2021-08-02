using System.Collections.Generic;
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
        
        public List<Recipe> Search(int take, int skip, string searchQuery)
        {
            if (string.IsNullOrEmpty(searchQuery))
            {
               return  _context.Set<Recipe>().Take(take).Skip(skip).ToList();
            }
            return _context.Set<Recipe>()
                .Include(x => x.Tags)
                .Include(x => x.Ingredients)
                    .ThenInclude(y => y.IngredientItems)
                .Where(x => x.Title.ToLower().Contains(searchQuery)).Skip(skip).Take(take).ToList();
        }

        public void Add(Recipe newRecipe)
        {
            _context.Set<Recipe>().Add(newRecipe);
        }
    }
}