import 'package:flutter/material.dart';

class AcercaScreen extends StatelessWidget {
  const AcercaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: const [
              Icon(
                Icons.restaurant_menu,
                size: 90,
                color: Colors.brown,
              ),

              SizedBox(height: 20),

              Text(
                'Platillos Ancestrales de Quintana Roo',
                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 16),

              Text(
                'Proyecto académico para conocer recetas '
                'y promover la riqueza gastronómica de '
                'Quintana Roo.',

                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              SizedBox(height: 20),

              Text(
                'Desarrollado por el equipo de estudiantes: Valeria Ramírez, Hector Lugo, Gerardo Roldán, Adán Hernández, Ricardo Gónzales, Angela Ferraez y Santamaría Ozuna ',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}