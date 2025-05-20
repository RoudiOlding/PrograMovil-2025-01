import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  SignInController control = Get.put(SignInController());

  SignInPage({super.key});

  // Paleta de colores
  static const Color backgroundColor = Color(0xFFF1F1F1);
  static const Color containerColor = Color(0xFFE9E9E9);
  static const Color borderColor = Color(0xFFD2D2D2);
  static const Color textPrimary = Color(0xFF272727);
  static const Color textSecondary = Color(0xFF585858);
  static const Color buttonColor = Color(0xFF6E6E6E);
  static const Color buttonTextColor = Color(0xFFF1F1F1);

  Widget _form(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: containerColor,
        border: Border.all(color: borderColor, width: 2.0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Text(
            'Ingresa Esta Información',
            style: TextStyle(
              fontSize: 18,
              color: textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          _customTextField(
            label: 'Usuario',
            icon: Icons.person,
            controller: control.txtUser,
          ),
          const SizedBox(height: 15),
          _customTextField(
            label: 'Contraseña',
            icon: Icons.lock,
            controller: control.txtPassword,
            obscureText: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              control.signIn(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 45),
              backgroundColor: buttonColor,
              foregroundColor: buttonTextColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              elevation: 0,
            ),
            child: const Text('INGRESAR'),
          ),
          const SizedBox(height: 15),
          Obx(() => control.message.value != ""
              ? Column(
                  children: [
                    Text(
                      control.message.value,
                      style: TextStyle(
                        color: control.messageColor.value,
                      ),
                    ),
                    const SizedBox(height: 8)
                  ],
                )
              : const SizedBox.shrink()),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'No tienes una cuenta, ',
                style: TextStyle(color: textSecondary),
              ),
              GestureDetector(
                onTap: () {
                  control.goToSignUp(context);
                },
                child: const Text(
                  'Créala aquí',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _customTextField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: label,
        labelStyle: const TextStyle(color: textSecondary),
        hintStyle: const TextStyle(color: textSecondary),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Icon(icon, color: textSecondary),
        filled: true,
        fillColor: backgroundColor,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: textPrimary, width: 1.5),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      style: const TextStyle(color: textPrimary),
    );
  }

  Widget _layer1(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: containerColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: borderColor, width: 6.0),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/ulises.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          _form(context),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: _layer1(context),
        ),
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '¿Olvidaste tu contraseña?, ',
                style: TextStyle(color: textSecondary),
              ),
              GestureDetector(
                onTap: () {
                  control.goToResetPassword(context);
                },
                child: const Text(
                  'recupérala aquí',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: _buildBody(context),
    );
  }
}
