import 'package:flutter/material.dart';

class BoxCard extends StatelessWidget {
  final Widget cardChild;
  final Color colour;

  const BoxCard({super.key, required this.cardChild, required this.colour});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      color: colour,
      child: cardChild,
    );
  }
}