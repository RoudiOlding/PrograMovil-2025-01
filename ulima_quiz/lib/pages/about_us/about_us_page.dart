import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'about_us_controller.dart';

class AboutUsPage extends StatelessWidget {
  AboutUsController control = Get.put(AboutUsController());

  Widget _buildBody(BuildContext context) {
    return const SafeArea(child: Text('About us'));
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
