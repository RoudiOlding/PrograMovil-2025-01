import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulima_quiz/pages/my_record/my_record_page.dart';
import 'package:ulima_quiz/pages/new_quiz/new_quiz_page.dart';
import 'package:ulima_quiz/pages/ranking/ranking_page.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static HomeController control = Get.put(HomeController());
  int _selectedIndex = 0;
  final Color backgroundColor = const Color(0xFFF3E8FF); // Lila suave
  final Color textPrimary = Colors.black87;
  final Color accentColor = const Color(0xFFFFB085); // Naranja pastel
  final Color barColor = const Color(0xFFE1C9FF); // Lila más fuerte

  static final List<Widget> _widgetOptions = <Widget>[
    MyRecordPage(),
    MyNewQuizPage(),
    MyRankingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _settingOptions(BuildContext context) {
    return <Widget>[
      PopupMenuButton<String>(
        onSelected: (String value) {
          switch (value) {
            case 'Perfil':
              control.goEditProfile(context);
              break;
            case 'AcercaDe':
              control.goAboutUs(context);
              break;
            case 'Cerrar sesión':
              control.exit(context);
              break;
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'Perfil',
            child: Text('Perfil'),
          ),
          const PopupMenuItem<String>(
            value: 'AcercaDe',
            child: Text('click en AcercaDE'),
          ),
          const PopupMenuItem<String>(
            value: 'Cerrar sesión',
            child: Text('Cerrar sesión'),
          ),
        ],
        icon: const Icon(Icons.more_vert, color: Colors.black54),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: barColor,
        title: Text('Quiz ULima', style: TextStyle(color: textPrimary)),
        actions: _settingOptions(context),
        elevation: 0,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: barColor,
        selectedItemColor: accentColor,
        unselectedItemColor: Colors.black54,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
      ),
    );
  }
}
