import 'package:flutter/material.dart';

import '../models/recipe_model.dart';

class FavoritosScreen extends StatelessWidget {
  final List<Recipe> favoritos;
  final ValueChanged<Recipe> onAlternarFavorito;

  const FavoritosScreen({
    super.key,
    required this.favoritos,
    required this.onAlternarFavorito,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis favoritos'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: favoritos.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.brown,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Aquí verás tus recetas favoritas.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: favoritos.length,
              itemBuilder: (context, index) {
                final recipe = favoritos[index];

                return ListTile(
                  leading: recipe.image.isEmpty
                      ? const SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(Icons.restaurant, color: Colors.brown),
                        )
                      : Image.network(
                          recipe.image,
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(Icons.restaurant, color: Colors.brown),
                            );
                          },
                        ),
                  title: Text(recipe.name),
                  trailing: IconButton(
                    tooltip: 'Quitar de favoritos',
                    icon: const Icon(Icons.favorite, color: Colors.brown),
                    onPressed: () => onAlternarFavorito(recipe),
                  ),
                );
              },
            ),
    );
  }
}