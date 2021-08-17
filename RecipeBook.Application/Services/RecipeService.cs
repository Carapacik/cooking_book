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
        private readonly IRecipeRepository _recipeRepository;
        private readonly IUserRepository _userRepository;

        public RecipeService( IRecipeRepository recipeRepository, IFileStorageService fileStorageService, IUserRepository userRepository )
        {
            _recipeRepository = recipeRepository;
            _fileStorageService = fileStorageService;
            _userRepository = userRepository;
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
            if ( recipe == null ) throw new ValidationException( "Recipe does not exist" );
            User user = _userRepository.GetByLogin( username );
            if ( user.UserId != recipe.UserId ) throw new ValidationException( "Incorrect user" );
            _fileStorageService.RemoveFile( "images", recipe.ImageUrl );
            _recipeRepository.Delete( id );
        }

        public Recipe EditRecipe( RecipeCommand command )
        {
            Recipe existingRecipe = _recipeRepository.GetById( command.RecipeId );
            if ( existingRecipe == null ) throw new ValidationException( "Recipe does not exist" );
            User user = _userRepository.GetByLogin( command.UserName );
            if ( user.UserId != existingRecipe.UserId ) throw new ValidationException( "Incorrect user" );
            SaveFileResult filePath = null;
            if ( command.StorageFile != null ) filePath = _fileStorageService.SaveFile( command.StorageFile, "images" );
            int userId = _userRepository.GetByLogin( command.UserName ).UserId;
            Recipe recipe = ConvertToRecipe( command, filePath, userId );
            if ( filePath != null ) _fileStorageService.RemoveFile( "images", existingRecipe.ImageUrl );
            _recipeRepository.Edit( existingRecipe, recipe );
            return recipe;
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
