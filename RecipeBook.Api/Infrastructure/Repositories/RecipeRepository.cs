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

        private List<Recipe> GetAll()
        {
            return _context.Set<Recipe>()
                .Include(x => x.Tags)
                .Include(x => x.Steps)
                .Include(x => x.Ingredients)
                    .ThenInclude(y => y.IngredientItems)
                .ToList();
        }
        public Recipe GetById(int id)
        {
            return GetAll().FirstOrDefault(x => x.RecipeId == id);
        }

        public List<Recipe> Search(int skip, int take, string searchQuery)
        {
            if (string.IsNullOrWhiteSpace(searchQuery))
                return GetAll().OrderByDescending(x => x.LikesCount).Skip(skip).Take(take).ToList();
            return GetAll().OrderByDescending(x => x.LikesCount)
                .Where(x => x.Title.ToLower().Contains(searchQuery))
                .Skip(skip).Take(take).ToList();
        }

        public void Add(Recipe newRecipe)
        {
            _context.Set<Recipe>().Add(newRecipe);
        }
    }
}