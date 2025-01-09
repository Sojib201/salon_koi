import 'package:flutter/material.dart';

import 'dashboard_tile.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> dashboardItems = [
    {'title': 'Book an Appointment', 'route': '/book_appointment'},
    {'title': 'View Services', 'route': '/view_services'},
    {'title': 'My Profile', 'route': '/my_profile'},
    {'title': 'Special Offers', 'route': '/special_offers'},
    {'title': 'Saloon UI', 'route': '/saloon_nav'},
    {'title': 'Loyalty & Rewards', 'route': '/loyalty_rewards'},
    //{'title': 'Virtual Makeover', 'route': '/virtual_makeover'},
    {'title': 'Referral Program', 'route': '/referral_program'},
    {'title': 'Payment History', 'route': '/payment_history'},
    {'title': 'Notifications', 'route': '/notifications'},
    {'title': 'Salon Locator', 'route': '/salon_locator'},
    {'title': 'Admin Panel', 'route': '/admin_panel'},
    {'title': 'Settings', 'route': '/settings'},
    {'title': 'Customer Support', 'route': '/customer_support'},
    {'title': 'Feedback & Reviews', 'route': '/feedback_reviews'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Saloon Koi App Dashboard")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3,
        ),
        padding: EdgeInsets.all(16),
        itemCount: dashboardItems.length,
        itemBuilder: (context, index) {
          final item = dashboardItems[index];
          return DashboardTile(
            title: item['title'],
            onTap: () {
              Navigator.pushNamed(context, item['route']);
            },
          );
        },
      ),
    );
  }
}
