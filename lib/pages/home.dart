import 'package:despesas_pessoais/components/transaction-user.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  child: Text('Gráfico'),
                  elevation: 5.0,
                ),
              ),
              TransactionUser()
            ],
          ),
        ],
      ),
    );
  }
}
