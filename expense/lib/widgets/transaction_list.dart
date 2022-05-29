// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, prefer_const_constructors, deprecated_member_use

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
        ? LayoutBuilder(
            builder: ((context, constraints) => Column(
                  children: [
                    Text(
                      'No transaction yet...',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
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
        : ListView.builder(
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
                    trailing: MediaQuery.of(context).size.width < 500
                        ? IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Theme.of(context).errorColor,
                            ),
                            onPressed: () => delete(trans[index].id),
                          )
                        : FlatButton.icon(
                            onPressed: () => delete(
                              trans[index].id,
                            ),
                            icon: Icon(Icons.delete),
                            label: Text('Delete'),
                            textColor: Theme.of(context).errorColor,
                          ),
                  ));
            },
            itemCount: trans.length,
          );
  }
}
