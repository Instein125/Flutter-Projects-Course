// ignore_for_file: deprecated_member_use, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:quizapp/quiz.dart';
import 'package:quizapp/result.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // _ is used to make class or any other variables private.
  int _totalScore = 0;
  var _questionIndex = 0;

  void _restart() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  final _questions = const [
    {
      'question': 'What\'s your name?',
      'answer': [
        {'text': 'Shyam', 'score': 10},
        {'text': 'Samman', 'score': 15},
        {'text': 'Raju', 'score': 12},
        {'text': 'Babulal', 'score': 5},
      ]
    }, //{} is used for mapping. We can also use Map()
    {
      'question': 'What\'s your favourite movie?',
      'answer': [
        {'text': 'Shutter Island', 'score': 10},
        {'text': 'Shawshank Redemption', 'score': 15},
        {'text': 'The Green mile', 'score': 5},
      ]
    },
    {
      'question': 'What\'s your favourite character?',
      'answer': [
        {'text': 'Ironman', 'score': 10},
        {'text': 'Batman', 'score': 15},
        {'text': 'Joker', 'score': 12},
        {'text': 'Black Widow', 'score': 5},
      ]
    },
  ];
  void _answerQues(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_totalScore);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('This is my app'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQues: _answerQues,
              index: _questionIndex,
              questions: _questions,
            )
          : Result(_totalScore, _restart),
    ));
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
