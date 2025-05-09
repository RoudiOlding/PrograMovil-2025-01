import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ulima_quiz/services/quiz_service.dart';

class HomeController extends GetxController {
  QuizService service = QuizService();

  void initialFetch(BuildContext context) {
    service.fetchAll();
  }
}
