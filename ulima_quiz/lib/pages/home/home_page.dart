import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController control = Get.put(HomeController());

  const HomePage({super.key});

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        'Quiz ULima',
        style: TextStyle(color: Colors.black),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: const [Icon(Icons.more_vert, color: Colors.black)],
      elevation: 1,
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
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

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(context),
      bottomNavigationBar: _bottomNavigationBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Estadísticas
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      '22',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                    Text(
                      'Cuestionarios\nRealizados',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '4%',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                    Text(
                      'Porcentaje\nde Aciertos',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Último quiz
            FractionallySizedBox(
              widthFactor: 0.75,
              child: Container(
                height: 1,
                color: Colors.black26,
              ),
            ),
            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "22/07/2025     Aciertos 4%",
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                    style: TextStyle(color: Colors.black87),
                  ),
                  const SizedBox(height: 12),
                  const Wrap(
                    spacing: 8,
                    children: [
                      Chip(
                        label: Text("Futbol"),
                        backgroundColor: Color.fromARGB(255, 241, 239, 239),
                      ),
                      Chip(
                        label: Text("Álgebra"),
                        backgroundColor: Color.fromARGB(255, 241, 239, 239),
                      ),
                      Chip(
                        label: Text("Trigonometría"),
                        backgroundColor: Color.fromARGB(255, 241, 239, 239),
                      ),
                      Chip(
                        label: Text("Voley"),
                        backgroundColor: Color.fromARGB(255, 241, 239, 239),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text('VER QUIZ'),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text('FILTROS'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _buildBody(context),
      debugShowCheckedModeBanner: false,
    );
  }
}
