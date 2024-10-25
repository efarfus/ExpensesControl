import 'package:expenses_control/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/transaction_list.dart';
import './models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transactions = [
    Transaction(
        id: "t1", title: "Tenis de corrida", value: 310, date: DateTime.now()),
    Transaction(id: 't2', title: "Comida", value: 589, date: DateTime.now()),
    Transaction(id: 't3', title: "Gasolina", value: 400, date: DateTime.now()),
    Transaction(id: 't4', title: "Lazer", value: 112.75, date: DateTime.now())
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  _openTransactionFormModal() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses Control"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () => _openTransactionFormModal(),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                  width: double.infinity,
                  child: Card(
                      color: Colors.blue,
                      child: Text("Grafico"),
                      elevation: 5)),
              TransactionList(_transactions),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(),
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[600],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
