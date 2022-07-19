import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String
      questionText; // Final means the variable can't be changed after its initialised

  Question({required this.questionText}); //Constructor
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        questionText,
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
    );
  }
}
