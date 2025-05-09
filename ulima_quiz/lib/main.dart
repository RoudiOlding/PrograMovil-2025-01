import 'package:flutter/material.dart';
import 'package:ulima_quiz/configs/theme_1.dart';
import 'package:ulima_quiz/configs/util.dart';
import 'package:ulima_quiz/pages/sign_in/sign_in_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        createTextTheme(context, 'Abril Fatface', 'Allerta');
    final MaterialTheme materialTheme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Flutter Hello World',
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      themeMode: ThemeMode.system,
      home: SignInPage(),
    );
  }
}
