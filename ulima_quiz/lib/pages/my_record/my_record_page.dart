import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulima_quiz/componentes/resume_card.dart';
import 'package:ulima_quiz/models/entitties/quiz.dart';
import 'package:ulima_quiz/models/entitties/user.dart';
import 'my_record_controller.dart';

class MyRecordPage extends StatelessWidget {
  MyRecordController control = Get.put(MyRecordController());

  Widget _myRercod(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                '22',
                style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onSecondary),
              ),
              Text(
                'Cuestionarios\nRealizados',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSecondary),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '4%',
                style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onSecondary),
              ),
              Text(
                'Porcentaje\nde Aciertos',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSecondary),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 15),
      Divider(
        color: Theme.of(context).colorScheme.onSecondary,
        thickness: 1.0,
        indent: 20.0,
        endIndent: 20.0,
      )
    ]);
  }

  Future _showFilterModal(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ), // Este paréntesis estaba faltando
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Opciones de Filtro',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSecondary),
              ),
              ListTile(
                leading: Icon(Icons.filter_alt,
                    color: Theme.of(context).colorScheme.onSecondary),
                title: Text(
                  'Filtro por fecha',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Acción: Filtrar por fecha
                },
              ),
              ListTile(
                leading: Icon(Icons.score,
                    color: Theme.of(context).colorScheme.onSecondary),
                title: Text(
                  'Filtro por puntaje',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryFixed,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _myRercod(context),
            const SizedBox(height: 24),
            Obx(() {
              return Expanded(
                child: control.quizzes == null || control.quizzes.isEmpty
                    ? Center(
                        child: Text(
                          'No hay quizzes disponibles',
                          style: TextStyle(fontSize: 18, color: Colors.red),
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
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
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
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: _buildBody(context),
    );
  }
}
