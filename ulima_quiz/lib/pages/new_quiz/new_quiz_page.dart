import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'new_quiz_controller.dart';

class MyNewQuizPage extends StatelessWidget {
  MyNewQuizController control = Get.put(MyNewQuizController());

  Widget _buildBody(BuildContext context) {
    return const SafeArea(child: Text('New quiz'));
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
