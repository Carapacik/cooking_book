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

        public RecipeService(IRecipeRepository recipeRepository, IFileStorageService fileStorageService)
        {
            _recipeRepository = recipeRepository;
            _fileStorageService = fileStorageService;
        }


        public Recipe AddRecipe(AddRecipeCommand addCommand)
        {
            var filePath = _fileStorageService.SaveFile(addCommand.StorageFile, "images");
            var recipe = ConvertToRecipe(addCommand, filePath);
            _recipeRepository.Add(recipe);
            return recipe;
        }

        public void DeleteRecipe()
        {
        }

        private static Recipe ConvertToRecipe(AddRecipeCommand addRecipeCommandDto, SaveFileResult saveFileResult)
        {
            return new Recipe
            {
                ImageUrl = saveFileResult.RelativeUri,
                Title = addRecipeCommandDto.Title,
                Description = addRecipeCommandDto.Description,
                CookingTimeInMinutes = addRecipeCommandDto.CookingTimeInMinutes,
                PortionsCount = addRecipeCommandDto.PortionsCount,
                Tags = addRecipeCommandDto.Tags.Select(x => new Tag
                {
                    Name = x
                }).ToList(),
                Steps = addRecipeCommandDto.Steps.Select(x => new Step
                {
                    Description = x
                }).ToList(),
                Ingredients = addRecipeCommandDto.Ingredients.ToList()
            };
        }
    }
}