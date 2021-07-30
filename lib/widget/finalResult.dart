import 'package:flutter/material.dart';

class FinalResult extends StatelessWidget {
  const FinalResult({ required this.pontuacaoFinal, required this.rebootSurvey, Key? key }) : super(key: key);
  final int pontuacaoFinal;
  final Function() rebootSurvey;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Parabéns, sua pontuação foi $pontuacaoFinal !",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green[700])
          )
        ),
        TextButton(onPressed: rebootSurvey, child: const Text("Reinicar?", style: TextStyle( fontSize: 18 )))
      ],
    );
  }
}