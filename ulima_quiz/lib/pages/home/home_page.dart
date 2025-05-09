import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../componentes/resume_card.dart';
import '../home/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController control = Get.put(HomeController());

  final Color backgroundColor = const Color(0xFFF3E8FF); // Lila suave
  final Color cardColor = Colors.white;
  final Color textPrimary = Colors.black87;
  final Color textSecondary = Colors.black54;
  final Color accentColor = Color(0xFFFFB085); // Naranja pastel
  final Color barColor = Color(0xFFE1C9FF);

  HomePage({super.key}); // Lila más fuerte

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: barColor,
      title: Text('Quiz ULima', style: TextStyle(color: textPrimary)),
      actions: const [Icon(Icons.more_vert, color: Colors.black54)],
      elevation: 0,
    );
  }

  Widget _buttonNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: barColor,
      selectedItemColor: accentColor,
      unselectedItemColor: textSecondary,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Mi Record',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_arrow),
          label: 'Nuevo Quiz',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard),
          label: 'Ranking',
        ),
      ],
    );
  }

  Widget _myRecord(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text('22', style: TextStyle(fontSize: 24, color: textPrimary)),
              Text(
                'Cuestionarios\nRealizados',
                textAlign: TextAlign.center,
                style: TextStyle(color: textSecondary),
              ),
            ],
          ),
          Column(
            children: [
              Text('4%', style: TextStyle(fontSize: 24, color: textPrimary)),
              Text(
                'Porcentaje\nde Aciertos',
                textAlign: TextAlign.center,
                style: TextStyle(color: textSecondary),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 15),
      Divider(
        color: textSecondary,
        thickness: 1.0,
        indent: 20.0,
        endIndent: 20.0,
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    control.initialFetch(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: _appBar(context),
      bottomNavigationBar: _buttonNavigationBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _myRecord(context),
              const SizedBox(height: 24),
              const ResumeCard(
                success: 60,
                created: "22/07/2025",
                description: "Descripción detallada del quiz realizado.",
              ),
              const ResumeCard(
                success: 55,
                created: "22/07/1988",
                description: "Otra descripción más larga con detalles.",
              ),
              const ResumeCard(
                success: 4,
                created: "Hoy",
                description: "Intento con bajo rendimiento.",
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    // Acción al presionar "FILTROS"
                  },
                  child: const Text('FILTROS'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
