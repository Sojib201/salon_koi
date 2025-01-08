import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adminUser_model.dart';

class ManageUsersScreen extends StatelessWidget {
  final List<User> users = [
    User(id: '1', name: 'John Doe', email: 'john@example.com'),
    User(id: '2', name: 'Jane Smith', email: 'jane@example.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Users'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Implement user deletion functionality here
              },
            ),
          );
        },
      ),
    );
  }
}
