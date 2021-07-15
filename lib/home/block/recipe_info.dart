class RecipeInfo {
  final String name;
  final String description;
  final String imageUrl;
  final String author;
  final int likes;
  final int cookingTime;

  const RecipeInfo({
    required this.imageUrl,
    required this.author,
    required this.likes,
    required this.cookingTime,
    required this.name,
    required this.description,
  });
}
