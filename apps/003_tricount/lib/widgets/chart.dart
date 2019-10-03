import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get txStatsForTheLast7Days {
    var totalSpending = 0.0;
    var stats = List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double amountPerDay = 0.0;
      for (var tx in recentTransactions) {
        if (tx.date.day == weekDay.day &&
            tx.date.month == weekDay.month &&
            tx.date.year == weekDay.year) {
          amountPerDay += tx.amount;
        }
      }
      totalSpending += amountPerDay;
      return {
        'day': DateFormat.E().format(weekDay)[0],
        'amount': amountPerDay,
      };
    });

    for (Map<String, Object> stat in stats) {
      stat['pctOfTotal'] = totalSpending == 0.0
          ? 0.0
          : (stat['amount'] as double) / totalSpending;
    }

    return stats.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: txStatsForTheLast7Days.map((tx) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                tx['day'],
                tx['amount'],
                tx['pctOfTotal'],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
