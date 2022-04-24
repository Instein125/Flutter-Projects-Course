import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List questions;
  final int index;
  final Function answerQues;

  Quiz(
      {required this.questions, required this.index, required this.answerQues});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[index]['question'] as String,
        ),
        ...(questions[index]['answer'] as List).map((ans) {
          return Answer(() => answerQues(ans['score']), ans['text']);
        }).toList()
        // This create a separate widget for each answer and store it in a list.
        //(...) Triple dot is used to separate widgets from the list into single element.
      ],
    );
  }
}
