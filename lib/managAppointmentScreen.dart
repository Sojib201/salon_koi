import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adminUser_model.dart';

class ManageAppointmentsScreen extends StatelessWidget {
  final List<Appointment> appointments = [
    Appointment(
      id: '1',
      userId: '1',
      serviceId: '1',
      date: DateTime.now().add(Duration(days: 1)),
    ),
    Appointment(
      id: '2',
      userId: '2',
      serviceId: '2',
      date: DateTime.now().add(Duration(days: 2)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Appointments'),
      ),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return ListTile(
            title: Text('Appointment ID: ${appointment.id}'),
            subtitle: Text('Date: ${appointment.date.toLocal()}'),
          );
        },
      ),
    );
  }
}
