import 'package:expenses_control/main.dart';
import 'package:expenses_control/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(ExpensesApp());

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Nenhuma transação cadastrada",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
                Container(
                  margin: EdgeInsets.all(40),
                  height: 200,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 20,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(child: Text('R\$${tr.value}')),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat('d/M/y').format(tr.date),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        onRemove(tr.id);
                      },
                      icon: Icon(Icons.delete),
                      color: Colors.red[400],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
