import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ranking_controller.dart';

class MyRankingPage extends StatelessWidget {
  MyRankingController control = Get.put(MyRankingController());

  Widget _buildBody(BuildContext context) {
    return const SafeArea(child: Text('Ranking page'));
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
