class RecipeInfo {
  final String name;
  final String description;
  final String imageUrl;
  final int cookingTimeInMinutes;
  final int portionsCount;
  final int likesCount;
  final String username;

  RecipeInfo({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.cookingTimeInMinutes,
    required this.portionsCount,
    required this.likesCount,
    required this.username,
  });

  @override
  String toString() {
    return 'RecipeInfo{name: $name, description: $description, imageUrl: $imageUrl, cookingTimeInMinutes: $cookingTimeInMinutes, portionsCount: $portionsCount, likesCount: $likesCount, username: $username}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeInfo &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          imageUrl == other.imageUrl &&
          cookingTimeInMinutes == other.cookingTimeInMinutes &&
          portionsCount == other.portionsCount &&
          likesCount == other.likesCount &&
          username == other.username;

  @override
  int get hashCode =>
      name.hashCode ^
      description.hashCode ^
      imageUrl.hashCode ^
      cookingTimeInMinutes.hashCode ^
      portionsCount.hashCode ^
      likesCount.hashCode ^
      username.hashCode;
}
