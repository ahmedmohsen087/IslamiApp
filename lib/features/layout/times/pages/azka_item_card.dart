import 'package:flutter/material.dart';
import '../../../../models/azkar_model.dart';

class AzkarItemCard extends StatelessWidget {
  final AzkarModel azkar;

  const AzkarItemCard({required this.azkar, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              azkar.content,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Text(
              "عدد التكرار: ${azkar.count}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}