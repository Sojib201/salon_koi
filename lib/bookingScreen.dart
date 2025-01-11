// // import 'package:flutter/material.dart';
// //
// // class BookAppointmentScreen extends StatefulWidget {
// //   @override
// //   _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
// // }
// //
// // class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
// //   String? selectedDate;
// //   String? selectedTime;
// //   String? selectedService;
// //
// //   final List<String> services = ['Haircut', 'Facial', 'Manicure', 'Pedicure'];
// //   final List<String> timeSlots = ['10:00 AM', '11:00 AM', '2:00 PM', '4:00 PM'];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(automaticallyImplyLeading: false, title: Text("Booking")),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text("Select a Service:",
// //                 style: TextStyle(fontWeight: FontWeight.bold)),
// //             DropdownButton<String>(
// //               value: selectedService,
// //               items: services.map((service) {
// //                 return DropdownMenuItem(value: service, child: Text(service));
// //               }).toList(),
// //               onChanged: (value) {
// //                 setState(() {
// //                   selectedService = value;
// //                 });
// //               },
// //             ),
// //             SizedBox(height: 20),
// //             Text("Select a Time Slot:",
// //                 style: TextStyle(fontWeight: FontWeight.bold)),
// //             DropdownButton<String>(
// //               value: selectedTime,
// //               items: timeSlots.map((time) {
// //                 return DropdownMenuItem(value: time, child: Text(time));
// //               }).toList(),
// //               onChanged: (value) {
// //                 setState(() {
// //                   selectedTime = value;
// //                 });
// //               },
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () {
// //                 if (selectedService != null && selectedTime != null) {
// //                   showDialog(
// //                     context: context,
// //                     builder: (_) => AlertDialog(
// //                       title: Text("Booking Confirmed"),
// //                       content: Text(
// //                           "You have booked a $selectedService at $selectedTime."),
// //                       actions: [
// //                         TextButton(
// //                           onPressed: () => Navigator.pop(context),
// //                           child: Text("OK"),
// //                         ),
// //                       ],
// //                     ),
// //                   );
// //                 } else {
// //                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //                     content: Text("Please select both service and time slot."),
// //                   ));
// //                 }
// //               },
// //               child: Text("Confirm Booking"),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookAppoinmentScreen extends StatefulWidget {
  const BookAppoinmentScreen({super.key});

  @override
  State<BookAppoinmentScreen> createState() => _BookApponmentScreenState();
}

class _BookApponmentScreenState extends State<BookAppoinmentScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Appointment Booking'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                border: Border(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                ),
              ),
              child: const TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white60,
                indicatorColor: Colors.white,
                tabs: [
                  Tab(text: "All"),
                  Tab(text: "Upcoming"),
                  Tab(text: "Completed"),
                  Tab(text: "Pending"),
                ],
              ),
            ),
            // TabBarView for displaying content
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Fency Nails'),
                                      const Row(
                                        //crossAxisAlignment:CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 12),
                                              backgroundColor: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
