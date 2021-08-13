using System.Linq;
using RecipeBook.Application.Services.Entities;
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

        public Recipe AddRecipe( RecipeCommand command, string identityName )
        {
            SaveFileResult filePath = _fileStorageService.SaveFile( command.StorageFile, "images" );
            Recipe recipe = ConvertToRecipe( command, filePath, identityName );
            _recipeRepository.Add( recipe );
            return recipe;
        }

        public Recipe EditRecipe( RecipeCommand command, string identityName )
        {
            SaveFileResult filePath = null;
            if ( command.StorageFile != null )
            {
                filePath = _fileStorageService.SaveFile( command.StorageFile, "images" );
            }

            Recipe recipe = ConvertToRecipe( command, filePath, identityName );
            Recipe existingRecipe = _recipeRepository.GetById( command.RecipeId );
            if ( filePath != null )
            {
                _fileStorageService.RemoveFile( "images", existingRecipe.ImageUrl );
            }

            _recipeRepository.Edit( existingRecipe, recipe );

            return recipe;
        }

        public void DeleteRecipe( int id )
        {
            string imagePath = _recipeRepository.GetById( id ).ImageUrl;
            _fileStorageService.RemoveFile( "images", imagePath );
            _recipeRepository.Delete( id );
        }

        private static Recipe ConvertToRecipe( RecipeCommand recipeCommandDto, SaveFileResult saveFileResult, string identityName )
        {
            return new Recipe
            {
                ImageUrl = saveFileResult != null ? saveFileResult.RelativeUri : "",
                RecipeId = recipeCommandDto.RecipeId,
                Title = recipeCommandDto.Title,
                Description = recipeCommandDto.Description,
                CookingTimeInMinutes = recipeCommandDto.CookingTimeInMinutes,
                PortionsCount = recipeCommandDto.PortionsCount,
                Tags = recipeCommandDto.Tags.Select( x => new Tag { Name = x } ).ToList(),
                Steps = recipeCommandDto.Steps.Select( x => new Step { Description = x } ).ToList(),
                Ingredients = recipeCommandDto.Ingredients
            };
        }
    }
}
