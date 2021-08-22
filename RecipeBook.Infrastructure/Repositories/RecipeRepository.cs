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
        private readonly IUserRepository _userRepository;

        public RecipeRepository( RecipeBookDbContext context, IUserRepository userRepository )
        {
            _context = context;
            _userRepository = userRepository;
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

        public void Edit( Recipe existingRecipe, Recipe editedRecipe )
        {
            if ( editedRecipe.ImageUrl != "" )
            {
                existingRecipe.ImageUrl = editedRecipe.ImageUrl;
            }

            existingRecipe.Title = editedRecipe.Title;
            existingRecipe.Description = editedRecipe.Description;
            existingRecipe.CookingTimeInMinutes = editedRecipe.CookingTimeInMinutes;
            existingRecipe.PortionsCount = editedRecipe.PortionsCount;
            existingRecipe.Tags = editedRecipe.Tags;
            existingRecipe.Steps = editedRecipe.Steps;
            existingRecipe.Ingredients = editedRecipe.Ingredients;
        }

        public Recipe GetById( int id )
        {
            return GetQuery().FirstOrDefault( x => x.RecipeId == id );
        }

        public IReadOnlyList<Recipe> GetFavoriteRecipes( int skip, int take, string username )
        {
            // ага, как вынести
            User user = _userRepository.GetByLogin( username );
            var allUserFavorites = _context.Set<Rating>()
                .Where( x => x.UserId == user.UserId && x.InFavorite )
                .Select( x => x.RecipeId );
            IQueryable<Recipe> query = GetQuery().Where( x => allUserFavorites.Contains( x.RecipeId ) );
            return query.OrderByDescending( x => x.FavoritesCount )
                .Skip( skip )
                .Take( take )
                .ToList();
        }
        
        public IReadOnlyList<Recipe> GetUserOwnedRecipes( int skip, int take, string username )
        {
            // это будет в профиле
            User user = _userRepository.GetByLogin( username );
            var allUserOwnedRecipes = _context.Set<Rating>()
                .Where( x => x.UserId == user.UserId)
                .Select( x => x.RecipeId );
            IQueryable<Recipe> query = GetQuery().Where( x => allUserOwnedRecipes.Contains( x.RecipeId ) );
            return query.OrderByDescending( x => x.FavoritesCount )
                .Skip( skip )
                .Take( take )
                .ToList();
        }

        public Recipe GetRecipeOfDay()
        {
            return GetQuery().TakeLast(10).OrderByDescending( x => x.LikesCount ).FirstOrDefault();
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
