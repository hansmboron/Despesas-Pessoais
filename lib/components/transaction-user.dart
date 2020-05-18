import 'dart:math';

import 'package:despesas_pessoais/components/transaction-form.dart';
import 'package:despesas_pessoais/components/transaction-list.dart';
import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
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

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      dateTime: DateTime.now(),
    );
    setState(() {
      _transaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(_transaction),
        TransactionForm(_addTransaction),
      ],
    );
  }
}
