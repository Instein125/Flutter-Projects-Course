// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:expense/widgets/chart.dart';
import 'package:expense/widgets/new_transaction.dart';
import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Color(0x00264E70),
        accentColor: Color.fromARGB(255, 3, 73, 51),
        backgroundColor: Color.fromARGB(184, 38, 78, 68),
        canvasColor: Color.fromARGB(255, 199, 226, 184),
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
        // appBarTheme: AppBarTheme(
        //     textTheme: ThemeData.light().textTheme.copyWith(
        //           headline6: TextStyle(
        //             fontFamily: 'OpenSans',
        //             fontSize: 40,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         )),
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void _startNew(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap:
                () {}, //this two is used so that whem tapped on new widget it is not closed
            behavior: HitTestBehavior
                .opaque, //But when tapped outside it is closed. This is default behaviour.
            child: NewTransaction(_addTransaction),
          );
        });
  }

  final List<Transaction> _transactions = [
    // Transaction(
    //   title: 'shoes',
    //   amt: 2000,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   title: 'shirt',
    //   amt: 1600,
    //   date: DateTime.now(),
    // ),
  ];

  void _addTransaction(String txtitle, double txamt, DateTime date) {
    final newtx = Transaction(
        title: txtitle, amt: txamt, date: date, id: DateTime.now().toString());

    setState(() {
      _transactions.add(newtx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  List<Transaction> get _recentTrans {
    return _transactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset:
      //     false, //this is done to avoid bottom overflow when keyboard pops up.
      appBar: AppBar(
        // backgroundColor: Theme.of(context).backgroundColor,
        title: const Text(
          'Expense Report',
        ),
        actions: [
          IconButton(
            onPressed: () => _startNew(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              child: Chart(_recentTrans),
            ),
            Transactions(_transactions, _deleteTransaction),
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startNew(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
