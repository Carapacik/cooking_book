using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using RecipeBook.Api.Application.Entities;
using RecipeBook.Api.Application.Repositories;

namespace RecipeBook.Api.Controllers
{
    [ApiController]
    [Route("api/recipe")]
    public class RecipesController : ControllerBase
    {
        private readonly IRecipeRepository _recipeRepository;

        public RecipesController(IRecipeRepository recipeRepository)
        {
            _recipeRepository = recipeRepository;
        }

        [HttpGet]
        public Recipe Get(int id)
        {
            return new()
            {
                RecipeId = 1,
                Name = "Тыква",
                Description = "Зеленая",
                ImageUrl = "http//bobo",
                CookingTimeInMinutes = 20,
                PortionsCount = 2,
                LikesCount = 322,
                FavoritesCount = 22,
                UserId = 1,
                Tags = new List<Tag>
                {
                    new()
                    {
                        TagId = 1,
                        Name = "loh"
                    }
                }
            };
        }
    }
}