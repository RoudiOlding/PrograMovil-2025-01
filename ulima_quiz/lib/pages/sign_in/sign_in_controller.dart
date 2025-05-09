import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulima_quiz/models/service_http_response.dart';
import 'package:ulima_quiz/services/user_service.dart';
import '../../models/entitties/user.dart';

class SignInController extends GetxController {
  TextEditingController txtUser = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  RxString message = ''.obs; // elementos observables, RX
  Rx<MaterialColor> messageColor = Colors.red.obs;
  UserService service = UserService();

  void signIn(BuildContext context) async {
    String user = txtUser.text;
    String password = txtPassword.text;
    User u = User(username: user, password: password);
    ServiceHttpResponse? response = await service.signIn(u);
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
