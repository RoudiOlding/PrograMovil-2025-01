import 'package:flutter/material.dart';

class ResumeCard extends StatelessWidget {
  final int success;
  final String created;
  final String description;

  const ResumeCard({
    Key? key,
    required this.success,
    required this.created,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color cardBorderColor = const Color(0xFFE6D6FF); // Lila suave
    final Color textPrimary = Colors.black87;
    final Color textSecondary = Colors.black54;
    final Color chipColor = Color(0xFFD1BAFF); // Chip lila pastel
    final Color buttonColor = Color(0xFFFFB085); // Naranja pastel

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: cardBorderColor),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$created    Aciertos $success%',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textPrimary,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: const [
              Chip(
                label: Text("Fútbol"),
                backgroundColor: Color(0xFFD1BAFF),
              ),
              Chip(
                label: Text("Álgebra"),
                backgroundColor: Color(0xFFD1BAFF),
              ),
              Chip(
                label: Text("Trigonometría"),
                backgroundColor: Color(0xFFD1BAFF),
              ),
              Chip(
                label: Text("Vóley"),
                backgroundColor: Color(0xFFD1BAFF),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
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
