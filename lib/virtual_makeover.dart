import 'package:flutter/material.dart';

class VirtualMakeoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Virtual Makeover")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Virtual Makeover Coming Soon!", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Icon(Icons.camera_alt, size: 50, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
