import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulima_quiz/componentes/resume_card.dart';
import 'package:ulima_quiz/models/entitties/quiz.dart';
import 'package:ulima_quiz/models/entitties/user.dart';
import 'my_record_controller.dart';

class MyRecordPage extends StatelessWidget {
  MyRecordController control = Get.put(MyRecordController());

  // Paleta de colores
  static const Color backgroundColor = Color(0xFFF1F1F1);
  static const Color containerColor = Color(0xFFE9E9E9);
  static const Color borderColor = Color(0xFFD2D2D2);
  static const Color textPrimary = Color(0xFF272727);
  static const Color textSecondary = Color(0xFF585858);
  static const Color buttonColor = Color(0xFF6E6E6E);
  static const Color buttonTextColor = Color(0xFFF1F1F1);

  MyRecordPage({super.key});

  Widget _myRecord(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  '22',
                  style: TextStyle(fontSize: 24, color: textPrimary),
                ),
                Text(
                  'Cuestionarios\nRealizados',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textSecondary),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '4%',
                  style: TextStyle(fontSize: 24, color: textPrimary),
                ),
                Text(
                  'Porcentaje\nde Aciertos',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textSecondary),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 15),
        Divider(
          color: borderColor,
          thickness: 1.0,
          indent: 20.0,
          endIndent: 20.0,
        ),
      ],
    );
  }

  Future _showFilterModal(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 200,
          color: containerColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Opciones de Filtro',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textPrimary,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.filter_alt, color: textSecondary),
                title: const Text('Filtro por fecha',
                    style: TextStyle(color: textSecondary)),
                onTap: () {
                  Navigator.pop(context);
                  // Acción: Filtrar por fecha
                },
              ),
              ListTile(
                leading: const Icon(Icons.score, color: textSecondary),
                title: const Text('Filtro por puntaje',
                    style: TextStyle(color: textSecondary)),
                onTap: () {
                  Navigator.pop(context);
                  // Acción: Filtrar por puntaje
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _myRecord(context),
            const SizedBox(height: 24),
            Obx(() {
              return Expanded(
                child: control.quizzes.isEmpty
                    ? const Center(
                        child: Text(
                          'No hay quizzes disponibles',
                          style: TextStyle(fontSize: 18, color: textSecondary),
                        ),
                      )
                    : ListView.builder(
                        itemCount: control.quizzes.length,
                        itemBuilder: (context, index) {
                          Quiz quiz = control.quizzes[index];
                          return ResumeCard(
                            success: quiz.points,
                            created: quiz.created,
                            description: quiz.statement,
                          );
                        },
                      ),
              );
            }),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: buttonTextColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  elevation: 0,
                ),
                onPressed: () => _showFilterModal(context),
                child: const Text('FILTROS'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    control.user = user;
    control.initialFetch(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: _buildBody(context),
    );
  }
}
