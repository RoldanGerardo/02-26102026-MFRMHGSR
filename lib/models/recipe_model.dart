class Recipe {
  final int id;
  final String name;
  final String image;

  Recipe({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }
}