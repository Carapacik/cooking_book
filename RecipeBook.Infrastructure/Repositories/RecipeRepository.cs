using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using RecipeBook.Domain.Entities;
using RecipeBook.Domain.Repositories;

namespace RecipeBook.Infrastructure.Repositories
{
    public class RecipeRepository : IRecipeRepository
    {
        private readonly RecipeBookDbContext _context;

        public RecipeRepository( RecipeBookDbContext context )
        {
            _context = context;
        }

        public void Add( Recipe newRecipe )
        {
            _context.Set<Recipe>().Add( newRecipe );
        }

        public async Task Delete( int id )
        {
            Recipe recipe = await GetById( id );
            _context.Set<Recipe>().Remove( recipe );
        }

        public void Edit( Recipe existingRecipe, Recipe editedRecipe )
        {
            if ( editedRecipe.ImageUrl != "" ) existingRecipe.ImageUrl = editedRecipe.ImageUrl;

            existingRecipe.Title = editedRecipe.Title;
            existingRecipe.Description = editedRecipe.Description;
            existingRecipe.CookingTimeInMinutes = editedRecipe.CookingTimeInMinutes;
            existingRecipe.PortionsCount = editedRecipe.PortionsCount;
            existingRecipe.Tags = editedRecipe.Tags;
            existingRecipe.Steps = editedRecipe.Steps;
            existingRecipe.Ingredients = editedRecipe.Ingredients;
        }

        public async Task<Recipe> GetById( int id )
        {
            return await GetQuery().FirstOrDefaultAsync( x => x.RecipeId == id );
        }

        public async Task<Recipe> GetRecipeOfDay()
        {
            DateTime window = DateTime.Now.AddDays( -1 );
            Recipe recipeOfDay = await GetQuery()
                .Where( x => x.CreationDateTime > window )
                .OrderByDescending( x => x.LikesCount )
                .FirstOrDefaultAsync() ?? await GetQuery().OrderByDescending( x => x.LikesCount )
                .FirstOrDefaultAsync();

            return recipeOfDay;
        }

        public async Task<IReadOnlyList<Recipe>> Search( int skip, int take, IEnumerable<int> recipeIds )
        {
            IEnumerable<int> uniqueRecipeIds = recipeIds.Distinct();
            IQueryable<Recipe> query = GetQuery().Where( x => uniqueRecipeIds.Contains( x.RecipeId ) );
            return await query.OrderByDescending( x => x.CreationDateTime )
                .Skip( skip )
                .Take( take )
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Recipe>> Search( int skip, int take, string searchQuery )
        {
            IQueryable<Recipe> query = GetQuery();
            if ( !string.IsNullOrWhiteSpace( searchQuery ) )
            {
                string trimmedQuery = searchQuery.ToLower().Trim();
                query = query.Where( x =>
                    x.Title.ToLower().Contains( trimmedQuery )
                    || x.Tags.Any( y => y.Name.ToLower().Contains( trimmedQuery ) ) );
            }

            return await query.OrderByDescending( x => x.CreationDateTime )
                .Skip( skip )
                .Take( take )
                .ToListAsync();
        }

        public async Task<int> GetUserRecipesCountByUserId( int userId )
        {
            return await _context.Set<Recipe>().CountAsync( x => x.UserId == userId );
        }

        public async Task<IReadOnlyList<Recipe>> GetInUserOwnedByUserId( int userId )
        {
            return await _context.Set<Recipe>()
                .Where( x => x.UserId == userId )
                .OrderByDescending( x => x.CreationDateTime )
                .ToListAsync();
        }

        private IQueryable<Recipe> GetQuery()
        {
            return _context.Set<Recipe>()
                .Include( x => x.Tags )
                .Include( x => x.Steps )
                .Include( x => x.Ingredients )
                .ThenInclude( y => y.IngredientItems )
                .AsSplitQuery();
        }
    }
}
