import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final _transaction = [
    Transaction(
      id: 't1',
      title: 'Novo tenis de corrida',
      value: 310.76,
      dateTime: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 211.13,
      dateTime: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Gráfico'),
                elevation: 5.0,
              ),
            ),
            Column(
              children: <Widget>[
                ..._transaction.map((tr) {
                  return Card(
                    child: Text(tr.title),
                  );
                }).toList(),
              ],
            )
          ],
        ));
  }
}
