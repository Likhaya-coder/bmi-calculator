import 'package:flutter/material.dart';
import 'package:health_check/constants.dart';

class CardContent extends StatelessWidget {
  final IconData icon;
  final String label;

  const CardContent({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: kBlue,
          size: 60.0,
        ),
        const SizedBox(height: 20.0),
        Text(
          label,
          style: kBoxContentTitle,
        ),
      ],
    );
  }
}