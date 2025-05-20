import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'edit_profile_controller.dart';

class EditProfilePage extends StatelessWidget {
  EditProfileController control = Get.put(EditProfileController());

  EditProfilePage({super.key});

  Widget _buildBody(BuildContext context) {
    return const SafeArea(child: Text('Edit profile'));
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
