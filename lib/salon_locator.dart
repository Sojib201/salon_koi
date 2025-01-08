// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// class SalonLocatorScreen extends StatefulWidget {
//   @override
//   _SalonLocatorScreenState createState() => _SalonLocatorScreenState();
// }
//
// class _SalonLocatorScreenState extends State<SalonLocatorScreen> {
//   late GoogleMapController _controller;
//   Location _location = Location();
//   LatLng? _currentLocation;
//
//   final List<LatLng> salonLocations = [
//     LatLng(37.42796133580664, -122.085749655962),
//     LatLng(37.430000, -122.085000),
//     LatLng(37.426000, -122.083000),
//   ];
//
//   static const CameraPosition _kInitialPosition = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.0,
//   );
//
//   // Function to update map and get current location
//   void _onMapCreated(GoogleMapController controller) {
//     _controller = controller;
//     _getUserLocation();
//   }
//
//   // Fetch user location
//   void _getUserLocation() async {
//     var currentLocation = await _location.getLocation();
//     setState(() {
//       _currentLocation = LatLng(currentLocation.latitude!, currentLocation.longitude!);
//       _controller.moveCamera(CameraUpdate.newLatLng(_currentLocation!));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Salon Locator")),
//       body: _currentLocation == null
//           ? Center(child: CircularProgressIndicator())
//           : GoogleMap(
//         initialCameraPosition: _kInitialPosition,
//         onMapCreated: _onMapCreated,
//         markers: {
//           ...salonLocations.map((location) => Marker(
//             markerId: MarkerId(location.toString()),
//             position: location,
//             infoWindow: InfoWindow(title: "Salon Location"),
//           )),
//           if (_currentLocation != null)
//             Marker(
//               markerId: MarkerId('current_location'),
//               position: _currentLocation!,
//               infoWindow: InfoWindow(title: 'Your Location'),
//               icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//             ),
//         },
//       ),
//     );
//   }
// }






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


