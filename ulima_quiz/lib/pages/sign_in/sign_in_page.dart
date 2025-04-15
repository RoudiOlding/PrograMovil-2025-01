import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  SignInController control = Get.put(SignInController()); // Como si fuera un constructor, un componente con sus funciones y vistas
  Widget _buildBody(BuildContext context) {
    return SafeArea(child: Text('Login'));
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
