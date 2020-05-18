import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleCtrl = TextEditingController();
  final valueCtrl = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

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
            ),
            TextField(
              controller: valueCtrl,
              decoration: InputDecoration(labelText: 'Valor R\$'),
            ),
            FlatButton(
              onPressed: () {
                final title = titleCtrl.text;
                final value = double.tryParse(valueCtrl.text) ?? 0.0;
                onSubmit(title, value);
              },
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
