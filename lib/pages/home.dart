import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  final titleCtrl = TextEditingController();
  final valueCtrl = TextEditingController();
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
              Column(
                children: <Widget>[
                  ..._transaction.map((tr) {
                    return Card(
                      elevation: 5.0,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColor)),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'R\$ ' + tr.value.toStringAsFixed(2),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                tr.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    color: Theme.of(context).primaryColor),
                              ),
                              Text(
                                  DateFormat('d/MM/yy h:m:s')
                                      .format(tr.dateTime),
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ))
                            ],
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
              Card(
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
                          print(titleCtrl.text);
                          print(valueCtrl.text);
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
