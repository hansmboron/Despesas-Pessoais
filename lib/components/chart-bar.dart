import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percent;

  const ChartBar({this.label, this.value, this.percent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              '${value.toStringAsFixed(2)}',
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 70,
          width: 20,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4)),
              ),
              FractionallySizedBox(
                heightFactor: !percent.isNaN ? percent : .0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(4)),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 5),
        Text(label)
      ],
    );
  }
}
