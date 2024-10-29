import 'package:expenses_control/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;
  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  main() => runApp(ExpensesApp());

  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate!);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Valor (R\$)"),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: _valueController,
              onSubmitted: (_) => _submitForm(),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(_selectedDate == null
                      ? "Nenhuma data selecionada"
                      : 'Data Selecionada: ${DateFormat('d/M/y').format(_selectedDate!)}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: _showDatePicker,
                    child: Text(
                      "Selecionar data",
                      style: TextStyle(color: Color(0xFF003049)),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Color(0xFF003049)),
                    ),
                    onPressed: () {
                      _submitForm();
                    },
                    child: Text("Nova transação",
                        style: TextStyle(color: Colors.white)),
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
