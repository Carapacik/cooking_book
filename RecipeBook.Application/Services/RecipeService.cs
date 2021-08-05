using RecipeBook.Application.Converters;
using RecipeBook.Application.Services.Entities;
using RecipeBook.Domain.Entities;
using RecipeBook.Domain.Repositories;

namespace RecipeBook.Application.Services
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



        public Recipe AddRecipe(AddRecipeCommand addCommand)
        {
            var filePath = _staticService.SaveFile(addCommand.FileAdapter, "images");
            var recipe = addCommand.Convert(filePath);
            _recipeRepository.Add(recipe);
            return recipe;
        }
        
        public void DeleteRecipe()
        {
        }
    }
}