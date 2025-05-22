import 'package:flutter/material.dart';
import 'package:ulima_quiz/configs/theme_1.dart';
import 'package:ulima_quiz/configs/util.dart';
import 'package:ulima_quiz/pages/about_us/about_us_page.dart';
import 'package:ulima_quiz/pages/create_account/create_account_page.dart';
import 'package:ulima_quiz/pages/edit_profile/edit_profile_page.dart';
import 'package:ulima_quiz/pages/home/home_page.dart';
import 'package:ulima_quiz/pages/recover_password/recover_password_page.dart';
import 'package:ulima_quiz/pages/sign_in/sign_in_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      initialRoute: '/sign-in',
      debugShowCheckedModeBanner: false,
      routes: {
        '/sign-in': (context) => SignInPage(),
        '/create-account': (context) => CreateAccountPage(),
        '/recover-password': (context) => RecoverPasswordPage(),
        '/home': (context) => const HomePage(),
        '/about-us': (context) => AboutUsPage(),
        '/edit-profile': (context) => EditProfilePage(),
      },
    );
  }
}
