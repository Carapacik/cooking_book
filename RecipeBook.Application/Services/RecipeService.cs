using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using RecipeBook.Application.Entities;
using RecipeBook.Domain.Entities;
using RecipeBook.Domain.Repositories;

namespace RecipeBook.Application.Services
{
    public class RecipeService : IRecipeService
    {
        private readonly IFileStorageService _fileStorageService;
        private readonly IRatingRepository _ratingRepository;
        private readonly IRecipeRepository _recipeRepository;
        private readonly IUserRepository _userRepository;

        public RecipeService(
            IRecipeRepository recipeRepository,
            IFileStorageService fileStorageService,
            IUserRepository userRepository,
            IRatingRepository ratingRepository )
        {
            _recipeRepository = recipeRepository;
            _fileStorageService = fileStorageService;
            _userRepository = userRepository;
            _ratingRepository = ratingRepository;
        }

        public Recipe AddRecipe( RecipeCommand command )
        {
            SaveFileResult filePath = _fileStorageService.SaveFile( command.StorageFile, "images" );
            int userId = _userRepository.GetByLogin( command.UserName ).UserId;
            Recipe recipe = ConvertToRecipe( command, filePath, userId );
            _recipeRepository.Add( recipe );
            return recipe;
        }

        public void DeleteRecipe( int id, string username )
        {
            Recipe recipe = _recipeRepository.GetById( id );
            if ( recipe == null )
            {
                throw new ValidationException( $"Recipe with id:{id} does not exist" );
            }

            User user = _userRepository.GetByLogin( username );
            if ( user.UserId != recipe.UserId )
            {
                throw new ValidationException( "Incorrect user" );
            }

            _fileStorageService.RemoveFile( "images", recipe.ImageUrl );
            _recipeRepository.Delete( id );
        }

        public Recipe EditRecipe( RecipeCommand editCommand )
        {
            Recipe existingRecipe = _recipeRepository.GetById( editCommand.RecipeId );
            if ( existingRecipe == null )
            {
                throw new ValidationException( $"Recipe with id:{editCommand.RecipeId} does not exist" );
            }

            User user = _userRepository.GetByLogin( editCommand.UserName );
            if ( user.UserId != existingRecipe.UserId )
            {
                throw new ValidationException( "Incorrect user" );
            }

            SaveFileResult filePath = null;
            if ( editCommand.StorageFile != null )
            {
                filePath = _fileStorageService.SaveFile( editCommand.StorageFile, "images" );
            }

            int userId = _userRepository.GetByLogin( editCommand.UserName ).UserId;
            Recipe recipe = ConvertToRecipe( editCommand, filePath, userId );
            if ( filePath != null )
            {
                _fileStorageService.RemoveFile( "images", existingRecipe.ImageUrl );
            }

            _recipeRepository.Edit( existingRecipe, recipe );
            return recipe;
        }

        public IReadOnlyList<Recipe> GetFavoriteRecipes( int skip, int take, string username )
        {
            User user = _userRepository.GetByLogin( username );
            IEnumerable<Rating> ratings = _ratingRepository.GetInFavoriteByUserId( user.UserId );
            List<int> recipeIds = ratings.Select( x => x.RecipeId ).ToList();
            return _recipeRepository.Search( skip, take, recipeIds );
        }

        public IReadOnlyList<Recipe> GetUserOwnedRecipes( int skip, int take, string username )
        {
            User user = _userRepository.GetByLogin( username );
            IEnumerable<Rating> ratings = _ratingRepository.GetInUserOwnedByUserId( user.UserId );
            List<int> recipeIds = ratings.Select( x => x.RecipeId ).ToList();
            return _recipeRepository.Search( skip, take, recipeIds );
        }

        private static Recipe ConvertToRecipe( RecipeCommand recipeCommand, SaveFileResult saveFileResult, int userId )
        {
            return new Recipe
            {
                ImageUrl = saveFileResult?.RelativeUri ?? "",
                RecipeId = recipeCommand.RecipeId,
                Title = recipeCommand.Title,
                Description = recipeCommand.Description,
                CookingTimeInMinutes = recipeCommand.CookingTimeInMinutes,
                PortionsCount = recipeCommand.PortionsCount,
                UserId = userId,
                Tags = recipeCommand.Tags.Select( x => new Tag { Name = x } ).ToList(),
                Steps = recipeCommand.Steps.Select( x => new Step { Description = x } ).ToList(),
                Ingredients = recipeCommand.Ingredients
            };
        }
    }
}
