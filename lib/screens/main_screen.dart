import 'package:flutter/material.dart';

import '../models/recipe_model.dart';
import 'home_screen.dart';
import 'favoritos_screen.dart';
import 'acerca_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _indiceActual = 0;
  final List<Recipe> _favoritos = [];

  void _cambiarPantalla(int indice) {
    setState(() {
      _indiceActual = indice;
    });
  }

  void _alternarFavorito(Recipe recipe) {
    setState(() {
      final yaEsFavorito = _favoritos.any(
        (favorito) => favorito.id == recipe.id,
      );

      if (yaEsFavorito) {
        _favoritos.removeWhere(
          (favorito) => favorito.id == recipe.id,
        );
      } else {
        _favoritos.add(recipe);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pantallas = [
      HomeScreen(
        favoritos: _favoritos,
        onAlternarFavorito: _alternarFavorito,
      ),
      FavoritosScreen(
        favoritos: _favoritos,
        onAlternarFavorito: _alternarFavorito,
      ),
      const AcercaScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _indiceActual,
        children: pantallas,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceActual,
        onTap: _cambiarPantalla,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.brown.shade700,
        unselectedItemColor: Colors.grey.shade500,
        selectedFontSize: 13,
        unselectedFontSize: 12,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            activeIcon: Icon(Icons.info),
            label: 'Acerca de',
          ),
        ],
      ),
    );
  }
}