import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomeController control = Get.put(HomeController());

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B1F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A2E28),
        title: const Text('Quiz ULima'),
        actions: const [Icon(Icons.more_vert)],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF2B1F1A),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Column(
                  children: [
                    Text(
                      '22',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    Text(
                      'Cuestionarios\nRealizados',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '4%',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    Text(
                      'Porcentaje\nde Aciertos',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white30),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "22/07/2025     Aciertos 4%",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    children: const [
                      Chip(
                        label: Text("Futbol"),
                        backgroundColor: Color(0xFFE0C84B),
                      ),
                      Chip(
                        label: Text("Álgebra"),
                        backgroundColor: Color(0xFFE0C84B),
                      ),
                      Chip(
                        label: Text("Trigonometría"),
                        backgroundColor: Color(0xFFE0C84B),
                      ),
                      Chip(
                        label: Text("Voley"),
                        backgroundColor: Color(0xFFE0C84B),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF6E1B),
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
                  backgroundColor: Color(0xFFFF6E1B),
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
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: null,
            body: _buildBody(context)));
  }
}
