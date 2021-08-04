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

        public void Add(Recipe newRecipe)
        {
            _context.Set<Recipe>().Add(newRecipe);
        }

        public Recipe GetById(int id)
        {
            return GetQuery().FirstOrDefault(x => x.RecipeId == id);
        }

        public Recipe GetRecipeOfDay()
        {
            return GetQuery().OrderBy(x => x.LikesCount).LastOrDefault();
        }


        public IEnumerable<Recipe> Search(int skip, int take, string searchQuery)
        {
            var query = GetQuery();
            if (!string.IsNullOrWhiteSpace(searchQuery))
            {
                var trimmedQuery = searchQuery.ToLower().Trim();
                query = query.Where(x =>
                    x.Title.ToLower().Contains(trimmedQuery)
                    || x.Tags.Any(y => y.Name.ToLower().Contains(trimmedQuery)));
            }

            return query.OrderByDescending(x => x.LikesCount)
                .Skip(skip)
                .Take(take)
                .ToList();
        }

        private IQueryable<Recipe> GetQuery()
        {
            return _context.Set<Recipe>()
                .Include(x => x.Tags)
                .Include(x => x.Steps)
                .Include(x => x.Ingredients)
                    .ThenInclude(y => y.IngredientItems)
                .AsQueryable();
        }
    }
}