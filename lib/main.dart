import 'package:expenses_control/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
        id: "t1", title: "Tenis de corrida", value: 310, date: DateTime.now()),
    Transaction(id: 't2', title: "Comida", value: 589, date: DateTime.now()),
    Transaction(id: 't3', title: "Gasolina", value: 400, date: DateTime.now()),
    Transaction(id: 't4', title: "Lazer", value: 112.75, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exepenses Control"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                width: double.infinity,
                child: Card(
                    color: Colors.blue, child: Text("Grafico"), elevation: 5)),
            Column(children: [
              ..._transactions.map((tr) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        tr.value.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      children: [Text(tr.title), Text(tr.date.toString())],
                    )
                  ],
                ));
              }).toList(),
            ]),
          ]),
    );
  }
}
