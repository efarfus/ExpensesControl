import 'package:expenses_control/main.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;
  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  main() => runApp(ExpensesApp());

  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Título"),
              controller: titleController,
              onSubmitted: (_) => _submitForm,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Valor (R\$)"),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: valueController,
              onSubmitted: (_) => _submitForm,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextButton(
                    onPressed: () {
                      _submitForm();
                    },
                    child: Text("Nova transação",
                        style: TextStyle(color: Colors.purple)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
