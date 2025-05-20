import 'package:flutter/material.dart';

class ResumeCard extends StatelessWidget {
  final int success;
  final DateTime created;
  final String description;

  const ResumeCard({
    super.key,
    required this.success,
    required this.created,
    required this.description,
  });

  String _formatDate(DateTime date) {
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();
    return "$day/$month/$year";
  }

  @override
  Widget build(BuildContext context) {
    // Nueva paleta de colores
    const Color cardBgColor = Color(0xFFF1F1F1); // Fondo claro
    const Color cardBorderColor = Color(0xFFD2D2D2); // Borde medio
    const Color textPrimary = Color(0xFF272727); // Texto oscuro
    const Color textSecondary = Color(0xFF585858); // Texto medio
    const Color chipColor = Color(0xFFE9E9E9); // Fondo chips
    const Color buttonColor = Color(0xFF6E6E6E); // Botón gris oscuro
    const Color buttonTextColor = Color(0xFFF1F1F1); // Texto botón claro

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBgColor,
        border: Border.all(color: cardBorderColor, width: 1.5),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_formatDate(created)}    Aciertos $success%',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: textPrimary,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          const Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              Chip(
                label: Text("Fútbol", style: TextStyle(color: textPrimary)),
                backgroundColor: chipColor,
                side: BorderSide.none,
              ),
              Chip(
                label: Text("Álgebra", style: TextStyle(color: textPrimary)),
                backgroundColor: chipColor,
                side: BorderSide.none,
              ),
              Chip(
                label:
                    Text("Trigonometría", style: TextStyle(color: textPrimary)),
                backgroundColor: chipColor,
                side: BorderSide.none,
              ),
              Chip(
                label: Text("Vóley", style: TextStyle(color: textPrimary)),
                backgroundColor: chipColor,
                side: BorderSide.none,
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: buttonTextColor,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              onPressed: () {},
              child: const Text('VER QUIZ'),
            ),
          ),
        ],
      ),
    );
  }
}
