import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

/* void main() {
  runApp(MyApp());
} */

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what\'s your favorite colour?',
      'answers': [
        {'text': 'Blue', 'score': 10},
        {'text': 'Black', 'score': 6},
        {'text': 'Red', 'score': 3},
        {'text': 'Yellow', 'score': 1}
      ],
    },
    {
      'questionText': 'what\'s your favorite movie?',
      'answers': [
        {'text': 'Black Axe', 'score': 10},
        {'text': 'Black Panther', 'score': 7},
        {'text': 'The Flash', 'score': 3},
        {'text': '24 Yellow', 'score': 1},
      ],
    },
    {
      'questionText': 'what\'s your favorite food?',
      'answers': [
        {'text': 'Rice', 'score': 10},
        {'text': 'Stew', 'score': 6},
        {'text': 'Garri', 'score': 4},
        {'text': 'Borenkool', 'score': 2},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(
      () {
        _questionIndex = _questionIndex + 1;
      },
    );
    // var aBool = true;
    // aBool = false;
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('no more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'My First App',
            ),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
