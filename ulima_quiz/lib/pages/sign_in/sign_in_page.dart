import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  SignInController control = Get.put(SignInController());

  Widget _form(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryFixed,
          border: Border.all(
              color: Theme.of(context).colorScheme.onSecondaryFixedVariant,
              width: 2.0)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Column(children: [
              Text('Ingresa tu información'),
              SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: true, // Esto oculta el texto ingresado
                decoration: InputDecoration(
                  hintText: 'Usuario',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIcon:
                      Icon(Icons.person), // Aquí agregamos el ícono de usuario
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: true, // Esto oculta el texto ingresado
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIcon: Icon(Icons.lock), // Ícono de candado
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  // Acción del botón
                },
                child: Text('INGRESAR'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 40), // 100% del ancho
                  backgroundColor:
                      Color(0xFFFF7F2A), // Color de fondo personalizado
                  foregroundColor: Colors.white, // Color del texto blanco
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.zero, // Sin redondeo en las esquinas
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text('No tienes una cuenta, '),
                  Text(
                    'creala aquí',
                    style: TextStyle(
                      fontWeight: FontWeight
                          .bold, // Esto hace que el texto sea en negrita
                    ),
                  )
                ],
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget _layer1(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        SizedBox(
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
                  child: Image.asset(
                      'assets/images/zapatillas_correr.jpg', // usamos la definifica en el .yaml
                      fit: BoxFit.cover),
                )),
          ],
        ),
        SizedBox(
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
          top: 0,
          left: 0,
          right: 0,
          child: _layer1(context),
        ),
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
