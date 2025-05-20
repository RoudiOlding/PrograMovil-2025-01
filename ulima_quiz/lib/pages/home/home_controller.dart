import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  void goEditProfile(BuildContext context) {
    Navigator.pushNamed(context, '/edit-profile');
  }

  void goAboutUs(BuildContext context) {
    Navigator.pushNamed(context, '/about-us');
  }

  void exit(BuildContext context) {
    SystemNavigator.pop();
  }
}
