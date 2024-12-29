import 'package:flutter/material.dart';
import 'package:student_portal_app2/ui/utils/app_colors.dart';

class CardContainer extends StatelessWidget {
  final List<Widget> children;

  const CardContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}