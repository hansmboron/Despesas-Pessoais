import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: MediaQuery.of(context).size.height / 1.5,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'Nenhuma transação cadastrada',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 10),
                Image.asset(
                  'assets/img/waiting.png',
                  height: MediaQuery.of(context).size.height / 3.0,
                  color: Colors.grey,
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 5.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                          Text(DateFormat('d/MM/yy h:m:s').format(tr.dateTime),
                              style: TextStyle(
                                color: Colors.grey[600],
                              ))
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
