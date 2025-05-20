import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulima_quiz/pages/my_record/my_record_page.dart';
import 'package:ulima_quiz/pages/new_quiz/new_quiz_page.dart';
import 'package:ulima_quiz/pages/ranking/ranking_page.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static HomeController control = Get.put(HomeController());
  int _selectedIndex = 0;

  final Color backgroundColor = const Color(0xFFF1F1F1); // Fondo principal
  final Color barColor = const Color(0xFFE9E9E9); // AppBar y BottomNav
  final Color accentColor = const Color(0xFFD2D2D2); // Color seleccionado
  final Color textPrimary = const Color(0xFF6E6E6E); // Texto principal
  final Color textSecondary = const Color(0xFF585858); // Texto no seleccionado

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
        icon: const Icon(Icons.more_vert, color: Color(0xFF585858)),
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
        itemBuilder: (BuildContext context) => const [
          PopupMenuItem<String>(
            value: 'Perfil',
            child: Text('Perfil'),
          ),
          PopupMenuItem<String>(
            value: 'AcercaDe',
            child: Text('Acerca de'),
          ),
          PopupMenuItem<String>(
            value: 'Cerrar sesión',
            child: Text('Cerrar sesión'),
          ),
        ],
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
        unselectedItemColor: textSecondary,
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
