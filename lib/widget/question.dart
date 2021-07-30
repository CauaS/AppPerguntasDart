import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({ required this.textQuestion, Key? key }) : super(key: key);

  final String textQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        textQuestion,
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      )
    );
  }
}