import 'package:flutter/material.dart';

class SpecialOffersScreen extends StatelessWidget {
  final List<Map<String, String>> offers = [
    {'title': '20% Off on Haircuts', 'description': 'Get a fresh look for less!'},
    {'title': 'Free Facial with Hair Spa', 'description': 'Limited time offer!'},
    {'title': 'Combo Package: ₹999', 'description': 'Haircut + Shave + Facial.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Special Offers")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: offers.length,
        itemBuilder: (context, index) {
          final offer = offers[index];
          return Card(
            child: ListTile(
              title: Text(offer['title']!),
              subtitle: Text(offer['description']!),
              leading: Icon(Icons.local_offer, color: Colors.red),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Offer '${offer['title']}' applied!")),
                  );
                },
                child: Text("Apply"),
              ),
            ),
          );
        },
      ),
    );
  }
}
