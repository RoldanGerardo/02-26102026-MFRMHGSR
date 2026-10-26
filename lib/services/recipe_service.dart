import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe_model.dart';

class RecipeService {
  // URL de la API especificada en el requerimiento
  final String _url = 'https://dummyjson.com/recipes';

  Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // DummyJSON devuelve un mapa con una lista bajo la clave 'recipes'
      final List<dynamic> recipesJson = data['recipes'];
      
      return recipesJson.map((json) => Recipe.fromJson(json)).toList();
    } else {
      throw Exception('Fallo al cargar las recetas desde la API');
    }
  }
}