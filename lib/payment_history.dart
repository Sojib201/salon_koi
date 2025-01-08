import 'package:flutter/material.dart';
import 'package:koi/payment_model.dart';

class PaymentHistoryScreen extends StatelessWidget {
  final List<Payment> payments = [
    Payment(
      id: '1',
      description: 'Haircut Payment',
      amount: 15.0,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Payment(
      id: '2',
      description: 'Beard Trim Payment',
      amount: 10.0,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Payment(
      id: '3',
      description: 'Hair Color Payment',
      amount: 25.0,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment History'),
      ),
      body: ListView.builder(
        itemCount: payments.length,
        itemBuilder: (context, index) {
          final payment = payments[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(payment.description),
              subtitle: Text('Date: ${payment.date.toLocal()}'),
              trailing: Text('\$${payment.amount.toStringAsFixed(2)}'),
            ),
          );
        },
      ),
    );
  }
}
