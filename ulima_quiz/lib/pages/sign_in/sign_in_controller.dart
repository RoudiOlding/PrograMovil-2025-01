import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  TextEditingController txtUser = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  void signIn(BuildContext context) {
    // esto te manda a otra página, una redirección, navegación. Para eso usamos el context
    print('Hola desde controller');
    print(txtUser.text);
    print(txtPassword.text);
  }
}
