import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gastronomía de Quintana Roo',
        ),
        backgroundColor: Colors.brown.shade700,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: const Center(
        child: Text(
          'Aquí aparecerá el catálogo de recetas.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}