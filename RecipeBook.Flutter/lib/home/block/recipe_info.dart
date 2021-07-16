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


  @override
  String toString() {
    return 'RecipeInfo{name: $name, description: $description, imageUrl: $imageUrl, author: $author, likes: $likes, cookingTime: $cookingTime}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeInfo &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          imageUrl == other.imageUrl &&
          author == other.author &&
          likes == other.likes &&
          cookingTime == other.cookingTime;

  @override
  int get hashCode =>
      name.hashCode ^
      description.hashCode ^
      imageUrl.hashCode ^
      author.hashCode ^
      likes.hashCode ^
      cookingTime.hashCode;
}
