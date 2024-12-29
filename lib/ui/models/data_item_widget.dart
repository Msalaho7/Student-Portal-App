import 'package:flutter/material.dart';

//label and value Parameters and ui

class DataItemWidget extends StatelessWidget {
  final String label;
  final String value;

  const DataItemWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(value),
        const SizedBox(height:20),
      ],
    );
  }
}