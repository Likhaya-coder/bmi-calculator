import 'package:flutter/material.dart';
import 'package:health_check/constants.dart';

class CustomisedButtons extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomisedButtons(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
      fillColor: kActiveBoxCardColour,
      shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1.0, color: kBlue),
          borderRadius: BorderRadius.circular(50.0)),
      constraints: const BoxConstraints(minWidth: 50.0, minHeight: 50.0),
      child: Text(label),
    );
  }
}