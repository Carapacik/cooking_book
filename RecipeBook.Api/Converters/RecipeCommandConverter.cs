﻿using System.Linq;
using RecipeBook.Api.Dtos;
using RecipeBook.Application.Services.Entities;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Api.Converters
{
    public static class RecipeCommandConverter
    {
        public static RecipeCommand ConvertToRecipeCommand( this RecipeCommandDto recipe, FormFileAdapter fileAdapter )
        {
            return new RecipeCommand( recipe.Title,
                recipe.Description,
                recipe.CookingTimeInMinutes,
                recipe.PortionsCount,
                recipe.Tags,
                recipe.Steps,
                recipe.Ingredients.Select( x => new Ingredient
                {
                    Title = x.Title, IngredientItems = x.IngredientNames.Select( y => new IngredientItem { Name = y } ).ToList()
                } ).ToList(),
                fileAdapter.ConvertToStorageFile()
            );
        }
    }
}
