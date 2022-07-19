import 'package:flutter/material.dart';
import 'package:mocha/main.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // The _ defines MyAppState as a private class
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Answer chosen');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'Whats your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'Whats your favorite animal?',
        'answers': ['Cat', 'Dog', 'Rabbit', 'Fish'],
      },
      {
        'questionText': 'Whats your favorite phone?',
        'answers': ['iPhone', 'Android', 'Oppo', 'Huawei'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mocha'),
        ),
        body: Column(
          children: [
            Question(
              questionText: questions[_questionIndex]['questionText'],
            ),
            Answer(
              selectHandler: _answerQuestion,
            ),
            Answer(
              selectHandler: _answerQuestion,
            ),
            Answer(
              selectHandler: _answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
