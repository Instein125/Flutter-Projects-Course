import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionFile extends StatefulWidget {
  const TransactionFile({
    required Key key,
    required this.trans,
    required this.delete,
  }) : super(key: key);

  final Transaction trans;
  final Function delete;

  @override
  State<TransactionFile> createState() => _TransactionFileState();
}

class _TransactionFileState extends State<TransactionFile> {
  late Color _bgColor;
  @override
  void initState() {
    // TODO: implement initState
    const availableColor = [
      Colors.purple,
      Colors.blueGrey,
      Colors.yellow,
      Colors.orange,
    ];
    _bgColor = availableColor[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        color: Theme.of(context).canvasColor,
        child: ListTile(
          title: Text(
            widget.trans.title.toUpperCase(),
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(
            DateFormat.yMMMEd().format(widget.trans.date),
            style: const TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: _bgColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 4,
              ),
              child: FittedBox(
                child: Text(
                  'Rs. ${widget.trans.amt.toStringAsFixed(0)}',
                  style: const TextStyle(
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
                  onPressed: () => widget.delete(widget.trans.id),
                )
              // ignore: deprecated_member_use
              : FlatButton.icon(
                  onPressed: () => widget.delete(
                    widget.trans.id,
                  ),
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete'),
                  textColor: Theme.of(context).errorColor,
                ),
        ));
  }
}
