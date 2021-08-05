using RecipeBook.Application.Services.Entities;

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

        public void DeleteRecipe()
        {
        }

        public Recipe AddRecipe(AddRecipeCommand addCommand)
        {
            var filePath = _staticService.SaveFile(addCommand.FileAdapter, "images");
            var recipe = addCommand.Convert(filePath);
            _recipeRepository.Add(recipe);
            return recipe;
        }
    }
}