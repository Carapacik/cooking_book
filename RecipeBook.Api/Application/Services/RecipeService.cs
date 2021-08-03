using RecipeBook.Api.Application.Converters;
using RecipeBook.Api.Application.Entities;
using RecipeBook.Api.Application.Repositories;
using RecipeBook.Api.Application.Services.Entities;

namespace RecipeBook.Api.Application.Services
{
    public class RecipeService : IRecipeService
    {
        private readonly IRecipeRepository _recipeRepository;
        private readonly IStaticService _staticService;

        public RecipeService(IRecipeRepository recipeRepository, IStaticService staticService)
        {
            _recipeRepository = recipeRepository;
            _staticService = staticService;
        }

        public void DeleteRecipe()
        {
        }

        public Recipe AddRecipe(AddRecipeCommand addCommand)
        {
            var imageResult = _staticService.SaveFile(addCommand.FileAdapter);
            var recipe = addCommand.Convert(imageResult);
            _recipeRepository.Add(recipe);

            return recipe;
        }
    }
}