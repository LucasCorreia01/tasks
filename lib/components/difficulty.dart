import 'package:flutter/material.dart';
class Difficulty extends StatelessWidget {
  const Difficulty({required this.dificuldade, super.key});
  final int dificuldade;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 18,
          color: (dificuldade >= 1) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 18,
          color: (dificuldade >= 2) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 18,
          color: (dificuldade >= 3) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 18,
          color: (dificuldade >= 4) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 18,
          color: (dificuldade >= 5) ? Colors.blue : Colors.blue[100],
        ),
      ],
    );
  }
}