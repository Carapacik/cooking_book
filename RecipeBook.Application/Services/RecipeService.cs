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

        public RecipeService( IRecipeRepository recipeRepository, IFileStorageService fileStorageService )
        {
            _recipeRepository = recipeRepository;
            _fileStorageService = fileStorageService;
        }


        public Recipe AddRecipe( AddRecipeCommand addCommand )
        {
            SaveFileResult filePath = _fileStorageService.SaveFile( addCommand.StorageFile, "images" );
            Recipe recipe = ConvertToRecipe( addCommand, filePath );
            _recipeRepository.Add( recipe );
            return recipe;
        }

        public Recipe EditRecipe( EditRecipeCommand editCommand )
        {
            SaveFileResult filePath = null;
            if ( editCommand.StorageFile == null ) filePath = _fileStorageService.SaveFile( editCommand.StorageFile, "images" );
            Recipe recipe = ConvertToRecipe( editCommand, filePath );
            _recipeRepository.Edit( recipe );
            return recipe;
        }

        public void DeleteRecipe( int id )
        {
            string imagePath = _recipeRepository.GetById( id ).ImageUrl;
            _fileStorageService.RemoveFile( "images", imagePath );
            _recipeRepository.Delete( id );
        }

        private static Recipe ConvertToRecipe( AddRecipeCommand addRecipeCommandDto, SaveFileResult saveFileResult )
        {
            return new Recipe
            {
                ImageUrl = saveFileResult.RelativeUri,
                Title = addRecipeCommandDto.Title,
                Description = addRecipeCommandDto.Description,
                CookingTimeInMinutes = addRecipeCommandDto.CookingTimeInMinutes,
                PortionsCount = addRecipeCommandDto.PortionsCount,
                Tags = addRecipeCommandDto.Tags.Select( x => new Tag { Name = x } ).ToList(),
                Steps = addRecipeCommandDto.Steps.Select( x => new Step { Description = x } ).ToList(),
                Ingredients = addRecipeCommandDto.Ingredients.ToList()
            };
        }

        private static Recipe ConvertToRecipe( EditRecipeCommand editRecipeCommandDto, SaveFileResult saveFileResult )
        {
            return new Recipe
            {
                ImageUrl = saveFileResult.RelativeUri,
                Title = editRecipeCommandDto.Title,
                Description = editRecipeCommandDto.Description,
                CookingTimeInMinutes = editRecipeCommandDto.CookingTimeInMinutes,
                PortionsCount = editRecipeCommandDto.PortionsCount,
                Tags = editRecipeCommandDto.Tags.Select( x => new Tag { Name = x } ).ToList(),
                Steps = editRecipeCommandDto.Steps.Select( x => new Step { Description = x } ).ToList(),
                Ingredients = editRecipeCommandDto.Ingredients.ToList()
            };
        }
    }
}
