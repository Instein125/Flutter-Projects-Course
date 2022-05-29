// ignore_for_file: deprecated_member_use, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function update;

  NewTransaction(this.update);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  //late String titleInput;
  final amtController = TextEditingController();
  DateTime? _pickedDate;

  void _submit() {
    double amt = double.parse(amtController.text);

    if (titleController.text.isEmpty || amt <= 0 || _pickedDate == null) {
      return;
    }
    Navigator.of(context).pop();
    widget.update(
        titleController.text, double.parse(amtController.text), _pickedDate);
  }

  void _datepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _pickedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 4,
          child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 50,
                left: 10,
                right: 10,
                top: 10,
              ),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleController, //onChanged: (val) {
                  //  titleInput = val;
                  //},
                  onSubmitted: (_) =>
                      _submit(), // here on submitted takes a string argument so (_) is used to create a function that takes argument.
                  //Here _ is used to show we dont care what argument the function takes.
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amtController, //onChanged: (val) {
                  //  amtInput = val;
                  //},
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _submit(),
                ),
                Container(
                  height: 65,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _pickedDate == null
                              ? 'No date chosen!'
                              : 'picked date: ${DateFormat.yMd().format(_pickedDate!)}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      FlatButton(
                        onPressed: _datepicker,
                        child: Text(
                          'Choose Date',
                          style: TextStyle(
                              fontFamily: 'Quicksans',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 55, 0, 255)),
                        ),
                      )
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: _submit,
                  child: Text(
                    'Add transaction',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  color: Colors.blue,
                )
              ]))),
    );
  }
}
