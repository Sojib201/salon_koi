import 'package:flutter/material.dart';
import 'package:koi/serviceManagement.dart';
import 'package:koi/userManagement.dart';

import 'analyticsScreen.dart';
import 'managAppointmentScreen.dart';

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          AdminTile(
            title: 'Manage Users',
            icon: Icons.people,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManageUsersScreen()),
              );
            },
          ),
          AdminTile(
            title: 'Manage Services',
            icon: Icons.design_services,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManageServicesScreen()),
              );
            },
          ),
          AdminTile(
            title: 'View Appointments',
            icon: Icons.calendar_today,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManageAppointmentsScreen()),
              );
            },
          ),
          AdminTile(
            title: 'View Analytics',
            icon: Icons.bar_chart,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnalyticsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AdminTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const AdminTile({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
