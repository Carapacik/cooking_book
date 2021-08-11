﻿using System.Linq;
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


        public Recipe AddRecipe( RecipeCommand command )
        {
            SaveFileResult filePath = _fileStorageService.SaveFile( command.StorageFile, "images" );
            Recipe recipe = ConvertToRecipe( command, filePath );
            _recipeRepository.Add( recipe );
            return recipe;
        }

        public Recipe EditRecipe( RecipeCommand command )
        {
            SaveFileResult filePath = null;
            if ( command.StorageFile != null )
            {
                filePath = _fileStorageService.SaveFile( command.StorageFile, "images" );
            }
            Recipe recipe = ConvertToRecipe( command, filePath );
            _recipeRepository.Edit( recipe );
            return recipe;
        }

        public void DeleteRecipe( int id )
        {
            string imagePath = _recipeRepository.GetById( id ).ImageUrl;
            _fileStorageService.RemoveFile( "images", imagePath );
            _recipeRepository.Delete( id );
        }

        private static Recipe ConvertToRecipe( RecipeCommand recipeCommandDto, SaveFileResult saveFileResult )
        {
            return new Recipe
            {
                ImageUrl = saveFileResult.RelativeUri,
                Title = recipeCommandDto.Title,
                Description = recipeCommandDto.Description,
                CookingTimeInMinutes = recipeCommandDto.CookingTimeInMinutes,
                PortionsCount = recipeCommandDto.PortionsCount,
                Tags = recipeCommandDto.Tags.Select( x => new Tag { Name = x } ).ToList(),
                Steps = recipeCommandDto.Steps.Select( x => new Step { Description = x } ).ToList(),
                Ingredients = recipeCommandDto.Ingredients.ToList()
            };
        }
    }
}
