import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ulima_quiz/models/entitties/quiz.dart';
import 'package:ulima_quiz/models/service_http_response.dart';
import 'package:ulima_quiz/services/quiz_service.dart';
import '../../models/entitties/user.dart';

class HomeController extends GetxController {
  QuizService service = QuizService();
  var quizzes = <Quiz>[].obs;
  User? user = null;

  void initialFetch(BuildContext context) async {
    Future<ServiceHttpResponse?> response = service.fetchAll();
    ServiceHttpResponse? result = await response;
    if (result == null) {
      print('no hay respuesta del servidor');
    } else {
      if (result.status == 200) {
        quizzes.value = result.body;
      } else {
        print('error en la respuesta de servidor');
      }
    }
  }
}
