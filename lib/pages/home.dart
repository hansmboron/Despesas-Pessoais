import 'dart:math';

import 'package:despesas_pessoais/components/chart.dart';
import 'package:despesas_pessoais/components/transaction-form.dart';
import 'package:despesas_pessoais/components/transaction-list.dart';
import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _openFormModal(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  final List<Transaction> _transaction = [
    // Transaction(
    //   id: 't1',
    //   title: 'Tenis',
    //   value: 190.99,
    //   dateTime: DateTime.now().subtract(Duration(days: 3)),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Conta de luz',
    //   value: 211.13,
    //   dateTime: DateTime.now().subtract(Duration(days: 1)),
    // ),
  ];

  // filtrar lista para pegar só dos últimos 7 dias
  List<Transaction> get _recentTransactions {
    return _transaction.where((tr) {
      return tr.dateTime.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime dateTime) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      dateTime: dateTime,
    );
    setState(() {
      _transaction.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transaction.removeWhere((tr) => tr.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _openFormModal(context),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(recentTransactions: _recentTransactions),
            TransactionList(
              transactions: _transaction,
              onRemove: _removeTransaction,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openFormModal(context),
      ),
    );
  }
}
