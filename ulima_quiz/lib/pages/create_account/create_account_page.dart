import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'create_account_controller.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountController control = Get.put(CreateAccountController());

  CreateAccountPage({super.key});

  Widget _form(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryFixed,
          border: Border.all(
              color: Theme.of(context).colorScheme.onSecondaryFixedVariant,
              width: 2.0)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 0, // Padding superior
              bottom: 0, // Padding inferior
              left: 25, // Padding izquierdo
              right: 25, // Padding derecho
            ),
            child: Column(
              children: [
                const Text('¡Creemos una cuenta!'),
                const SizedBox(
                  height: 15,
                ),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Nombre Completo',
                    hintText: 'Nombre Completo',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: Icon(Icons.person), // Ícono de candado
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Correo',
                    hintText: 'Correo',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: Icon(Icons.mail_outline), // Ícono de candado
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Usuario',
                    hintText: 'Usuario',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon:
                        Icon(Icons.nest_cam_wired_stand), // Ícono de candado
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    hintText: 'Contraseña',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon:
                        Icon(Icons.password_outlined), // Ícono de candado
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Acción del botón
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        const Size(double.infinity, 40), // 100% del ancho
                    backgroundColor:
                        const Color(0xFFFF7F2A), // Color de fondo personalizado
                    foregroundColor: Colors.white, // Color del texto blanco
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.zero, // Sin redondeo en las esquinas
                    ),
                  ),
                  child: const Text('Crear cuenta'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _layer1(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryFixed,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primaryFixed,
                        width: 10.0)),
                child: ClipOval(
                  child: Image.asset('assets/images/zapatillas_correr.jpg',
                      fit: BoxFit.cover),
                )),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        _form(context)
      ],
    ));
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 0, // Coloca el widget en la parte inferior
            left: 0, // Alinea al inicio del eje horizontal
            right: 0, // Alinea al final del eje horizontal
            child: _layer1(context)),
        Positioned(
          top: 0,
          left: 0,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            iconSize: 50.0, // Tamaño del icono
            color: Colors.blue, // Color del icono
            onPressed: () {
              // Acción cuando se presiona el botón
              print('Botón con ícono "Agregar" presionado');
            },
          ),
        )
      ],
    );
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
