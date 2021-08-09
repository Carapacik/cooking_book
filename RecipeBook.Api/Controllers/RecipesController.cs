﻿using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using RecipeBook.Api.Converters;
using RecipeBook.Api.Dtos;
using RecipeBook.Application;
using RecipeBook.Application.Services;
using RecipeBook.Domain.Repositories;

namespace RecipeBook.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RecipesController : ControllerBase
    {
        private readonly IRecipeRepository _recipeRepository;
        private readonly IRecipeService _recipeService;
        private readonly IUnitOfWork _unitOfWork;

        public RecipesController(IRecipeRepository recipeRepository, IUnitOfWork unitOfWork, IRecipeService recipeService)
        {
            _recipeRepository = recipeRepository;
            _unitOfWork = unitOfWork;
            _recipeService = recipeService;
        }

        [HttpPost]
        [DisableRequestSizeLimit]
        public int AddRecipe()
        {
            var recipeData = JsonConvert.DeserializeObject<AddRecipeCommandDto>(Request.Form["recipe"]);
            var formFile = Request.Form.Files[0];
            var newRecipe = _recipeService.AddRecipe(recipeData.Convert(FormFileAdapter.Create(formFile)));
            _unitOfWork.Commit();
            return newRecipe.RecipeId;
        }

        [HttpPatch("{id:int}/edit")]
        [DisableRequestSizeLimit]
        public int EditRecipe(int id)
        {
            var recipeData = JsonConvert.DeserializeObject<AddRecipeCommandDto>(Request.Form["recipe"]);
            IFormFile formFile;
            if (Request.Form.Files.Count > 0) formFile = Request.Form.Files[0];
            // потом дополню
            return id;
        }

        [HttpGet("{id:int}")]
        public RecipeDetailDto GetDetailRecipe(int id)
        {
            var recipe = _recipeRepository.GetById(id);
            return recipe.ConvertToRecipeDetailDto();
        }

        [HttpGet("recipe-of-day")]
        public RecipeOfDayDto GetRecipeOfDay()
        {
            var recipe = _recipeRepository.GetRecipeOfDay();
            return recipe.ConvertToRecipeOfDayDto();
        }

        [HttpGet]
        public List<RecipeDto> GetRecipes(
            [FromQuery] int skip,
            [FromQuery] int take,
            [FromQuery] string searchQuery)
        {
            var searchResult = _recipeRepository.Search(skip, take, searchQuery);
            return searchResult.Select(x => x.ConvertToRecipeDto()).ToList();
        }
    }
}