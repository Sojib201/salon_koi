import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
                radius: 50, backgroundImage: AssetImage('assets/customer.png')),
            SizedBox(height: 20),
            Text("John Doe",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            SizedBox(height: 10),
            Text("Email: john.doe@example.com"),
            Text("Phone: +91 9876543210"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to edit profile screen
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => EditProfileScreen()));
              },
              child: Text("Edit Profile"),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfileScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: "Phone"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save profile updates
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Profile updated successfully!"),
                ));
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
