import 'package:flutter/material.dart';

class StylistProfilesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> stylists = [
    {'name': 'Alice', 'expertise': 'Hair Styling', 'rating': 4.5},
    {'name': 'Bob', 'expertise': 'Facial Specialist', 'rating': 4.8},
    {'name': 'Carol', 'expertise': 'Manicure & Pedicure', 'rating': 4.3},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stylist Profiles")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: stylists.length,
        itemBuilder: (context, index) {
          final stylist = stylists[index];
          return Card(
            child: ListTile(
              title: Text(stylist['name']),
              subtitle: Text("Expertise: ${stylist['expertise']}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${stylist['rating']} ⭐"),
                  IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Message sent to ${stylist['name']}!")),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
