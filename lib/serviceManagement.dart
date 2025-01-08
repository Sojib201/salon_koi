
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adminUser_model.dart';

class ManageServicesScreen extends StatelessWidget {
  final List<Services> services = [
    Services(id: '1', name: 'Haircut', price: 15.0),
    Services(id: '2', name: 'Beard Trim', price: 10.0),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Services'),
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return ListTile(
            title: Text(service.name),
            subtitle: Text('\$${service.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Implement service deletion functionality here
              },
            ),
          );
        },
      ),
    );
  }
}
