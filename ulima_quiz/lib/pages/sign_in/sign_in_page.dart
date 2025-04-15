import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  SignInController control = Get.put(SignInController());

  Widget _buildBody(BuildContext context) {
    return SafeArea(
        child: ClipOval(
      child: Image.asset('assets/images/zapatillas_correr.jpg', fit: BoxFit.cover),
    ));
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
