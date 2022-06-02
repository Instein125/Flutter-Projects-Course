// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTrans;
  Chart(this.recentTrans);

  List<Map<String, Object>> get groupTrans {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (int i = 0; i < recentTrans.length; i++) {
        if (recentTrans[i].date.day == weekday.day &&
            recentTrans[i].date.year == weekday.year &&
            recentTrans[i].date.month == weekday.month) {
          totalSum += recentTrans[i].amt;
        }
      }
      return {'day': DateFormat.E().format(weekday), 'amt': totalSum};
    }).reversed.toList();
  }

  double get total {
    return groupTrans.fold(0.0, (previousValue, element) {
      return previousValue + (element['amt'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTrans);
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTrans.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: Bar(
                  label: (data['day'] as String),
                  spendAmt: (data['amt'] as double),
                  perSpendAmt:
                      total == 0 ? 0 : (data['amt'] as double) / total),
            );
          }).toList(),
        ),
      ),
    );
  }
}
