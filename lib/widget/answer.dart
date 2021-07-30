import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({ required this.buttonText, required this.callBackFunction, Key? key }) : super(key: key);

  final String buttonText;
  final void Function() callBackFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22
          ),
        ),
        onPressed: callBackFunction, 
        child: Text(buttonText),
      ),
    );
  }
}