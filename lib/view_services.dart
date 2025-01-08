import 'package:flutter/material.dart';

class ViewServicesScreen extends StatelessWidget {
  final List<Map<String, String>> services = [
    {'name': 'Haircut', 'price': '₹300'},
    {'name': 'Facial', 'price': '₹500'},
    {'name': 'Manicure', 'price': '₹400'},
    {'name': 'Pedicure', 'price': '₹450'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Services")),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return ListTile(
            title: Text(service['name']!),
            subtitle: Text("Price: ${service['price']}"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("${service['name']} selected."),
              ));
            },
          );
        },
      ),
    );
  }
}
