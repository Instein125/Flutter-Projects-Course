// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Result extends StatelessWidget {
  final int score;
  final VoidCallback reset;
  Result(this.score, this.reset);

  String get pharase {
    String text;
    if (score <= 10) {
      text = '''Your have bad movie choice. Score: $score''';
    } else if (score <= 20) {
      text = '''Your have average movie choice. Score: $score''';
    } else {
      text = '''Your have nice movie choice. Score: $score''';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            pharase,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 0, 13, 252),
                fontSize: 30,
                fontStyle: FontStyle.normal),
          ),
          FlatButton(
            color: Color.fromARGB(255, 71, 181, 63),
            child: Text(
              'RESTART QUIZ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 246, 5, 5),
                  fontSize: 30,
                  fontStyle: FontStyle.normal),
            ),
            onPressed: reset,
          )
        ],
      ),
    );
  }
}
