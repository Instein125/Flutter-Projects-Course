// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String ques;
  // ignore: use_key_in_widget_constructors
  Question(this.ques);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(255, 0, 140, 255),
      margin: const EdgeInsets.all(10),
      child: Text(
        ques,
        // ignore: prefer_const_constructors
        style: TextStyle(fontSize: 25, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
