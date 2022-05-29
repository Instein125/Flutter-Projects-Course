// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final String label;
  final double spendAmt;
  final double perSpendAmt;

  Bar({required this.label, required this.spendAmt, required this.perSpendAmt});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, contraints) {
      return Column(
        children: [
          Container(
            height: contraints.maxHeight * 0.15,
            child: FittedBox(child: Text(spendAmt.toStringAsFixed(0))),
          ),
          SizedBox(
            height: contraints.maxHeight * 0.05,
          ),
          Container(
            height: contraints.maxHeight * 0.6,
            width: contraints.maxWidth * 0.25,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    color: Color.fromRGBO(220, 220, 220, 1),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: perSpendAmt,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColorDark),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: contraints.maxHeight * 0.05,
          ),
          Container(
            height: contraints.maxHeight * 0.15,
            child: FittedBox(child: Text(label)),
          ),
        ],
      );
    });
  }
}
