import 'package:flutter/material.dart';
import 'package:koi/payment_history.dart';
import 'package:koi/referral_program.dart';
import 'package:koi/salon_locator.dart';
import 'package:koi/settings.dart';
import 'package:koi/special_offers.dart';
import 'package:koi/saloon_nav.dart';
import 'package:koi/view_services.dart';
import 'package:koi/virtual_makeover.dart';
import 'admin_panel.dart';
import 'book_appointment.dart';
import 'customer_support.dart';
import 'feedback_reviews.dart';
import 'home_screen.dart';
import 'loyalty_rewards.dart';
import 'my_profile.dart';
import 'notifications.dart';


void main() {
  runApp(SaloonKoiApp());
}

class SaloonKoiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saloon Koi',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/book_appointment': (context) => BookAppointmentScreen(),
        '/view_services': (context) => ViewServicesScreen(),
        '/my_profile': (context) => MyProfileScreen(),
        '/special_offers': (context) => SpecialOffersScreen(),
        '/saloon_nav': (context) => SaloonNav(),

        '/loyalty_rewards': (context) => LoyaltyRewardsScreen(),
        '/virtual_makeover': (context) => VirtualMakeoverScreen(),
        '/referral_program': (context) => ReferralProgramScreen(),
        '/payment_history': (context) => PaymentHistoryScreen(),
        '/notifications': (context) => NotificationsScreen(),
        '/salon_locator': (context) => SalonLocatorScreen(),
        '/admin_panel': (context) => AdminPanel(),
        '/settings': (context) => SettingsScreen(),
        '/customer_support': (context) => CustomerSupportScreen(),
        '/feedback_reviews': (context) => FeedbackReviewsScreen(),
      },
    );
  }
}
