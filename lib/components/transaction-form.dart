import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleCtrl = TextEditingController();

  final valueCtrl = TextEditingController();

  _submitForm() {
    final title = titleCtrl.text;
    final value = double.tryParse(valueCtrl.text) ?? 0.0;

    if (title.isEmpty || value <= 0.0) {
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleCtrl,
              decoration: InputDecoration(labelText: 'Título'),
              onSubmitted: (_) => _submitForm(),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: valueCtrl,
              decoration: InputDecoration(labelText: 'Valor R\$'),
              onSubmitted: (_) => _submitForm(),
            ),
            FlatButton(
              onPressed: _submitForm,
              child: Text(
                'Nova Transação',
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
