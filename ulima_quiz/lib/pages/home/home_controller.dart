import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ulima_quiz/models/entitties/quiz.dart';
import 'package:ulima_quiz/models/service_http_response.dart';
import 'package:ulima_quiz/services/quiz_service.dart';
import '../../models/entitties/user.dart';

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
