// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> trans;
  final Function delete;

  Transactions(this.trans, this.delete);

  @override
  Widget build(BuildContext context) {
    return trans.isEmpty
        ? Column(
            children: [
              Text(
                'No transaction yet...',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        : Container(
            height: 356,
            child: ListView.builder(
              itemBuilder: (bct, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  color: Theme.of(context).canvasColor,
                  child: ListTile(
                    title: Text(
                      trans[index].title.toUpperCase(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMEd().format(trans[index].date),
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).primaryColorDark,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        child: FittedBox(
                          child: Text(
                            'Rs. ${trans[index].amt.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).errorColor,
                      ),
                      onPressed: () => delete(trans[index].id),
                    ),
                  ),
                );
              },
              itemCount: trans.length,
            ));
  }
}
