import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  TextEditingController txtUser = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  RxString message = ''.obs; // elementos observables, RX
  Rx<MaterialColor> messageColor = Colors.red.obs;

  void signIn(BuildContext context) {
    // esto te manda a otra página, una redirección, navegación. Para eso usamos el context
    print('Hola desde controller');
    String user = txtUser.text;
    String password = txtPassword.text;
    if (user == 'admin' && password == '123') {
      print('Ir a home');
      message.value = "Usuario válido";
      messageColor.value = Colors.green;
    } else {
      print('error');
      message.value = "Usuario y/o contraseña no es válidos";
      messageColor.value = Colors.red;
    }
    Future.delayed(const Duration(seconds: 5), () {
      message.value = "";
    });
  }

  void goToSignUp(BuildContext context) {
    print('TODO: irnos SignUp');
  }

  void goToResetPassword(BuildContext context) {
    print('TODO: irnos ResetPassword');
  }
}
