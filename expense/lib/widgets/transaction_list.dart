// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/transaction_file.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> trans;
  final Function delete;

  Transactions(this.trans, this.delete);

  @override
  Widget build(BuildContext context) {
    return trans.isEmpty
        ? LayoutBuilder(
            builder: ((context, constraints) => Column(
                  children: [
                    Text(
                      'No transaction yet...',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.7,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                )))
        : ListView(
            children: trans
                .map((tx) => TransactionFile(
                    key: ValueKey(tx.id), trans: tx, delete: delete))
                .toList(),
          );
  }
}
