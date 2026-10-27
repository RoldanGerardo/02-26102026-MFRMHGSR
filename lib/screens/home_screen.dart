import 'package:flutter/material.dart';

import '../models/recipe_model.dart';
import '../services/recipe_service.dart';
import '../widgets/recipiente_card.dart';

class HomeScreen extends StatefulWidget {
  final List<Recipe> favoritos;
  final ValueChanged<Recipe> onAlternarFavorito;

  const HomeScreen({
    super.key,
    required this.favoritos,
    required this.onAlternarFavorito,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Recipe>> _futureRecipes;

  @override
  void initState() {
    super.initState();
    _futureRecipes = RecipeService().fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gastronomía de Quintana Roo'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Platillos Ancestrales de Quintana Roo',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Descubre los sabores tradicionales de la región, '
              'preparados con ingredientes locales y recetas '
              'heredadas por generaciones.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<Recipe>>(
                future: _futureRecipes,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: 48,
                            color: Colors.red,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'No se pudieron cargar las recetas.',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _futureRecipes =
                                    RecipeService().fetchRecipes();
                              });
                            },
                            child: const Text('Reintentar'),
                          ),
                        ],
                      ),
                    );
                  }

                  final recipes = snapshot.data ?? [];

                  if (recipes.isEmpty) {
                    return const Center(
                      child: Text('No hay recetas disponibles.'),
                    );
                  }

                  return ListView.builder(
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = recipes[index];
                      final esFavorito = widget.favoritos.any(
                        (favorito) => favorito.id == recipe.id,
                      );

                      return Stack(
                        children: [
                          RecipeCard(recipe: recipe),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: Material(
                              color: Colors.white,
                              shape: const CircleBorder(),
                              child: IconButton(
                                tooltip: esFavorito
                                    ? 'Quitar de favoritos'
                                    : 'Agregar a favoritos',
                                onPressed: () {
                                  widget.onAlternarFavorito(recipe);
                                },
                                icon: Icon(
                                  esFavorito
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: esFavorito
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'El mapa de los pueblos originarios se está abriendo...',
              ),
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: const Icon(Icons.map),
      ),
    );
  }
}