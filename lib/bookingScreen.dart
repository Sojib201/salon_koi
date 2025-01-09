import 'package:flutter/material.dart';

class BookAppointmentScreen extends StatefulWidget {
  @override
  _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  String? selectedDate;
  String? selectedTime;
  String? selectedService;

  final List<String> services = ['Haircut', 'Facial', 'Manicure', 'Pedicure'];
  final List<String> timeSlots = ['10:00 AM', '11:00 AM', '2:00 PM', '4:00 PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,title: Text("Book an Appointment")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select a Service:", style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: selectedService,
              items: services.map((service) {
                return DropdownMenuItem(value: service, child: Text(service));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedService = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text("Select a Time Slot:", style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: selectedTime,
              items: timeSlots.map((time) {
                return DropdownMenuItem(value: time, child: Text(time));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedTime = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedService != null && selectedTime != null) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("Booking Confirmed"),
                      content: Text(
                          "You have booked a $selectedService at $selectedTime."),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Please select both service and time slot."),
                  ));
                }
              },
              child: Text("Confirm Booking"),
            ),
          ],
        ),
      ),
    );
  }
}
