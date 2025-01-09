import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koi/profileScreen.dart';
import 'package:koi/saloonHomeScreen.dart';

import 'bookingScreen.dart';

import 'locatorScreen.dart';
import 'messagesScreen.dart';

class SaloonNav extends StatefulWidget {
  @override
  State<SaloonNav> createState() => _SaloonUIState();
}

class _SaloonUIState extends State<SaloonNav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0
          ? SaloonHomeScreen()
          : _selectedIndex == 1
              ? MapScreen()
              : _selectedIndex == 2
                  ? BookAppointmentScreen()
                  : _selectedIndex == 3
                      ? Messages()
                      : _selectedIndex == 4
                          ? MyProfileScreen()
                          : null,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.purple,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on), label: 'Location'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Booking'),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: 'Message'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          onTap: _onItemTapped,
          currentIndex: _selectedIndex),
    );
  }
}
