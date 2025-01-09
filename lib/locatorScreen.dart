// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:koi/saloon_list/saloon_data.dart';
//
//
// class SalonLocatorScreen extends StatefulWidget {
//   @override
//   _SalonLocatorScreenState createState() => _SalonLocatorScreenState();
// }
//
// class _SalonLocatorScreenState extends State<SalonLocatorScreen> {
//   late GoogleMapController mapController;
//   TextEditingController searchController = TextEditingController();
//
//   final LatLng _center = const LatLng(37.42796133580664, -122.085749655962);
//
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Container(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           decoration: BoxDecoration(
//             color: Colors.grey[200],
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Row(
//             children: [
//               Icon(Icons.search, color: Colors.grey),
//               SizedBox(width: 10),
//               Expanded(
//                 child: TextField(
//                   onChanged: (value) {
//                     // Handle search logic
//                     print('Searching for: $value');
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Search',
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         backgroundColor: Colors.green[700],
//       ),
//       body: GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: _center,
//           zoom: 11.0,
//         ),
//         markers: {
//           Marker(
//             markerId: MarkerId('salon1'),
//             position: LatLng(37.42796133580664, -122.085749655962),
//             infoWindow: InfoWindow(title: AllSaloon['list'][1]['saloonName']),
//           ),
//           Marker(
//             markerId: MarkerId('salon2'),
//             position: LatLng(36.428, -122.086),
//             infoWindow: InfoWindow(title: 'Salon 2'),
//           ),
//         },
//       ),
//     );
//   }
// }
//
//

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:koi/saloon_list/saloon_data.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  Set<Marker> _markers = Set();

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }


  Future<void> _loadMarkers() async {
    try {

      // String response = '''
      // {
      //   "list": [
      //     {"id": 1, "saloonName": "Five Star", "lat": 23.7535, "lon": 90.3792},
      //     {"id": 2, "saloonName": "Maruf Barber Shop", "lat": 23.7530, "lon": 90.3792},
      //     {"id": 3, "saloonName": "Sojib Barber Shop", "lat": 23.7540, "lon": 90.3792},
      //     {"id": 4, "saloonName": "Emon Barber Shop", "lat": 23.7535, "lon": 90.3792},
      //     {"id": 5, "saloonName": "Anik Barber Shop", "lat": 23.7535, "lon": 90.3792}
      //   ]
      // }
      // ''';

     // final data = json.decode(response);
      List<dynamic> salons =AllSaloon['list'];

      setState(() {
        _markers.clear();
        for (var salon in salons) {
          _markers.add(Marker(
            markerId:
                MarkerId(salon['id'].toString()), // Unique ID for each marker
            position: LatLng(salon['lat'], salon['lon']),
            infoWindow: InfoWindow(
              title: salon['saloonName'],
              snippet: 'Details about this salon',
            ),
          ));
        }
      });
    } catch (e) {
      print("Error loading markers: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Salons Map')),
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target:
                LatLng(23.7535, 90.3792), // Default location, can be adjusted
            zoom: 15,
          ),
          markers: _markers,
          onMapCreated: _onMapCreated),
    );
  }
}
