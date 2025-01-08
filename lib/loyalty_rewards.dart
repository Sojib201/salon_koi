import 'package:flutter/material.dart';

class LoyaltyRewardsScreen extends StatelessWidget {
  final int loyaltyPoints = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Loyalty & Rewards")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Your Loyalty Points: $loyaltyPoints",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Redeem rewards coming soon!")),
                );
              },
              child: Text("Redeem Rewards"),
            ),
          ],
        ),
      ),
    );
  }
}
