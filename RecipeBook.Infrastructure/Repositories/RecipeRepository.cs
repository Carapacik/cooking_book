using System.Collections.Generic;
using System.Linq;
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

        public void Delete( int id )
        {
            Recipe recipe = GetById( id );
            _context.Set<Recipe>().Remove( recipe );
        }

        public void Edit( Recipe editedRecipe )
        {
            Recipe oldRecipe = GetById( editedRecipe.RecipeId );
            if ( editedRecipe.ImageUrl != "" )
            {
                oldRecipe.ImageUrl = editedRecipe.ImageUrl;
            }

            oldRecipe.Title = editedRecipe.Title;
            oldRecipe.Description = editedRecipe.Description;
            oldRecipe.CookingTimeInMinutes = editedRecipe.CookingTimeInMinutes;
            oldRecipe.PortionsCount = editedRecipe.PortionsCount;
            oldRecipe.Tags = editedRecipe.Tags;
            oldRecipe.Steps = editedRecipe.Steps;
            oldRecipe.Ingredients = editedRecipe.Ingredients;
        }

        public Recipe GetById( int id )
        {
            return GetQuery().FirstOrDefault( x => x.RecipeId == id );
        }

        public Recipe GetRecipeOfDay()
        {
            return GetQuery().OrderByDescending( x => x.LikesCount ).FirstOrDefault();
        }

        public IReadOnlyList<Recipe> Search( int skip, int take, string searchQuery )
        {
            IQueryable<Recipe> query = GetQuery();
            if ( !string.IsNullOrWhiteSpace( searchQuery ) )
            {
                string trimmedQuery = searchQuery.ToLower().Trim();
                query = query.Where( x =>
                    x.Title.ToLower().Contains( trimmedQuery )
                    || x.Tags.Any( y => y.Name.ToLower().Contains( trimmedQuery ) ) );
            }

            return query.OrderByDescending( x => x.LikesCount )
                .Skip( skip )
                .Take( take )
                .ToList();
        }

        private IQueryable<Recipe> GetQuery()
        {
            return _context.Set<Recipe>()
                .Include( x => x.Tags )
                .Include( x => x.Steps )
                .Include( x => x.Ingredients )
                .ThenInclude( y => y.IngredientItems )
                .AsQueryable();
        }
    }
}
