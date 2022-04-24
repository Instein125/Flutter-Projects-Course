// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback select; // we can use void function() select also
  final String ans;
  // ignore: prefer_const_constructors_in_immutables
  Answer(this.select, this.ans);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Container can also be used insted of SizedBox
      width: double.infinity,
      child: RaisedButton(
        color: Colors.deepPurpleAccent,
        child: Text(ans),
        onPressed: select,
      ),
    );
  }
}
