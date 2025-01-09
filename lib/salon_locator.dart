




import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SalonLocatorScreen extends StatefulWidget {
  @override
  _SalonLocatorScreenState createState() => _SalonLocatorScreenState();
}

class _SalonLocatorScreenState extends State<SalonLocatorScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(37.42796133580664, -122.085749655962);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salon Locator'),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('salon1'),
            position: LatLng(37.42796133580664, -122.085749655962),
            infoWindow: InfoWindow(title: "Salon 1"),
          ),
          Marker(
            markerId: MarkerId('salon2'),
            position: LatLng(37.428, -122.086),
            infoWindow: InfoWindow(title: "Salon 2"),
          ),
        },
      ),
    );
  }
}


