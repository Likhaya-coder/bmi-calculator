import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CalculateButton(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xBBFFFFFF),
        minimumSize: const Size(double.infinity, 80.0),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}