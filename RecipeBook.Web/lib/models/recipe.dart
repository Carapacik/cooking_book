//Тут будет модель для Recipe и функции сериализации и десериализации

// class Recipe {
//   int? recipeId;
//   String name;
//   String description;
//   String imageUrl;
//   int cookingTimeInMinutes;
//   int portionsCount;
//   int userId;
//   List<Likes> likes;
//   List<Tags> tags;
//   List<Steps> steps;
//   List<Ingredients> ingredients;
//
//   Recipe(
//       {this.recipeId,
//         this.name,
//         this.description,
//         this.imageUrl,
//         this.cookingTimeInMinutes,
//         this.portionsCount,
//         this.userId,
//         this.likes,
//         this.tags,
//         this.steps,
//         this.ingredients});
//
//   Recipe.fromJson(Map<String, dynamic> json) {
//     recipeId = json['recipeId'];
//     name = json['name'];
//     description = json['description'];
//     imageUrl = json['imageUrl'];
//     cookingTimeInMinutes = json['cookingTimeInMinutes'];
//     portionsCount = json['portionsCount'];
//     userId = json['userId'];
//     if (json['likes'] != null) {
//       likes = new List<Likes>();
//       json['likes'].forEach((v) {
//         likes.add(new Likes.fromJson(v));
//       });
//     }
//     if (json['tags'] != null) {
//       tags = new List<Tags>();
//       json['tags'].forEach((v) {
//         tags.add(new Tags.fromJson(v));
//       });
//     }
//     if (json['steps'] != null) {
//       steps = new List<Steps>();
//       json['steps'].forEach((v) {
//         steps.add(new Steps.fromJson(v));
//       });
//     }
//     if (json['ingredients'] != null) {
//       ingredients = new List<Ingredients>();
//       json['ingredients'].forEach((v) {
//         ingredients.add(new Ingredients.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['recipeId'] = this.recipeId;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['imageUrl'] = this.imageUrl;
//     data['cookingTimeInMinutes'] = this.cookingTimeInMinutes;
//     data['portionsCount'] = this.portionsCount;
//     data['userId'] = this.userId;
//     if (this.likes != null) {
//       data['likes'] = this.likes.map((v) => v.toJson()).toList();
//     }
//     if (this.tags != null) {
//       data['tags'] = this.tags.map((v) => v.toJson()).toList();
//     }
//     if (this.steps != null) {
//       data['steps'] = this.steps.map((v) => v.toJson()).toList();
//     }
//     if (this.ingredients != null) {
//       data['ingredients'] = this.ingredients.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Likes {
//   int likeId;
//   int recipeId;
//   int userId;
//
//   Likes({this.likeId, this.recipeId, this.userId});
//
//   Likes.fromJson(Map<String, dynamic> json) {
//     likeId = json['likeId'];
//     recipeId = json['recipeId'];
//     userId = json['userId'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['likeId'] = this.likeId;
//     data['recipeId'] = this.recipeId;
//     data['userId'] = this.userId;
//     return data;
//   }
// }
//
// class Tags {
//   int tagId;
//   String name;
//
//   Tags({this.tagId, this.name});
//
//   Tags.fromJson(Map<String, dynamic> json) {
//     tagId = json['tagId'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['tagId'] = this.tagId;
//     data['name'] = this.name;
//     return data;
//   }
// }
//
// class Steps {
//   int stepId;
//   String description;
//   int recipeId;
//
//   Steps({this.stepId, this.description, this.recipeId});
//
//   Steps.fromJson(Map<String, dynamic> json) {
//     stepId = json['stepId'];
//     description = json['description'];
//     recipeId = json['recipeId'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['stepId'] = this.stepId;
//     data['description'] = this.description;
//     data['recipeId'] = this.recipeId;
//     return data;
//   }
// }
//
// class Ingredients {
//   int ingredientId;
//   String title;
//   int recipeId;
//   List<IngredientItems> ingredientItems;
//
//   Ingredients(
//       {this.ingredientId, this.title, this.recipeId, this.ingredientItems});
//
//   Ingredients.fromJson(Map<String, dynamic> json) {
//     ingredientId = json['ingredientId'];
//     title = json['title'];
//     recipeId = json['recipeId'];
//     if (json['ingredientItems'] != null) {
//       ingredientItems = new List<IngredientItems>();
//       json['ingredientItems'].forEach((v) {
//         ingredientItems.add(new IngredientItems.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ingredientId'] = this.ingredientId;
//     data['title'] = this.title;
//     data['recipeId'] = this.recipeId;
//     if (this.ingredientItems != null) {
//       data['ingredientItems'] =
//           this.ingredientItems.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class IngredientItems {
//   int ingredientItemId;
//   String name;
//   int ingredientId;
//
//   IngredientItems({this.ingredientItemId, this.name, this.ingredientId});
//
//   IngredientItems.fromJson(Map<String, dynamic> json) {
//     ingredientItemId = json['ingredientItemId'];
//     name = json['name'];
//     ingredientId = json['ingredientId'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ingredientItemId'] = this.ingredientItemId;
//     data['name'] = this.name;
//     data['ingredientId'] = this.ingredientId;
//     return data;
//   }
// }