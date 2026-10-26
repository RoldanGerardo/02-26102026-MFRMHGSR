import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const AppGastronomica());
}

class AppGastronomica extends StatelessWidget {
  const AppGastronomica({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gastronomía de Quintana Roo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 192, 139, 61),
      ),
      home: const MainScreen(),
    );
  }
}