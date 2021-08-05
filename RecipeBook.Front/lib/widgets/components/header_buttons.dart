class HeaderButtons {
  final String name;
  final int index;
  final String route;

  const HeaderButtons._(this.name, this.index, this.route);

  static const home = HeaderButtons._("Главная", 0, '/');
  static const recipes = HeaderButtons._("Рецепты", 1, "/recipes");
  static const favorite = HeaderButtons._("Избранное", 2, "/favorite");

  static const values = [home, recipes, favorite];

  static HeaderButtons getById(final int id) {
    return values.firstWhere((button) => button.index == id);
  }
}
