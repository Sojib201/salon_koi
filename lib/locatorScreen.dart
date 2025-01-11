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
      List<dynamic> salons = AllSaloon['list'];

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
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              // Google Map and ListTile Section
              Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      color: Colors.purple.shade50,
                      child: Column(
                        children: [
                          // Container(
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       IconButton(
                          //         onPressed: () {},
                          //         icon: Icon(Icons.arrow_back),
                          //       ),
                          //       Column(
                          //         //crossAxisAlignment: CrossAxisAlignment.start,
                          //         //mainAxisAlignment: MainAxisAlignment.start,
                          //         children: [
                          //           Text(
                          //             'Current Location',
                          //             style: TextStyle(fontWeight: FontWeight.bold),
                          //           ),
                          //           Row(
                          //             children: [
                          //               Icon(
                          //                 Icons.location_on,
                          //                 color: Colors.green,
                          //               ),
                          //               Text('Ash Dr. San Jose'),
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //       IconButton(
                          //         onPressed: () {},
                          //         icon: Icon(Icons.search),
                          //       ),
                          //
                          //     ],
                          //   ),
                          // ),
                          ListTile(
                            leading: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_back),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search),
                            ),
                            title: Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Current Location',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.green,
                                    ),
                                    Text('Ash Dr. San Jose'),
                                  ],
                                ),
                              ],
                            ),
                            // subtitle: Row(
                            //   children: [
                            //     Icon(
                            //       Icons.location_on,
                            //       color: Colors.green,
                            //     ),
                            //     Text('Ash Dr. San Jose'),
                            //   ],
                            // ),
                          ),
                          Expanded(
                            flex: 4,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(35),
                                topLeft: Radius.circular(35),
                              ),
                              child: GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(23.7535, 90.3792),
                                    zoom: 15,
                                  ),
                                  markers: _markers,
                                  onMapCreated: _onMapCreated),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.42,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 94,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      bottomLeft: Radius.circular(11),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8),
                                      Text('Fency Nails'),
                                      const Row(
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(height: 6),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 12),
                                            backgroundColor: Colors.white54,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 94,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      bottomLeft: Radius.circular(11),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8),
                                      Text('Fency Nails'),
                                      const Row(
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(height: 6),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                            TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 12),
                                            backgroundColor: Colors.white54,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 94,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      bottomLeft: Radius.circular(11),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8),
                                      Text('Fency Nails'),
                                      const Row(
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(height: 6),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                            TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 12),
                                            backgroundColor: Colors.white54,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 94,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      bottomLeft: Radius.circular(11),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8),
                                      Text('Fency Nails'),
                                      const Row(
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(height: 6),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                            TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 12),
                                            backgroundColor: Colors.white54,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 94,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      bottomLeft: Radius.circular(11),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8),
                                      Text('Fency Nails'),
                                      const Row(
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(height: 6),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                            TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 12),
                                            backgroundColor: Colors.white54,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 94,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      bottomLeft: Radius.circular(11),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8),
                                      Text('Fency Nails'),
                                      const Row(
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(height: 6),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                            TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 12),
                                            backgroundColor: Colors.white54,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 94,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      bottomLeft: Radius.circular(11),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8),
                                      Text('Fency Nails'),
                                      const Row(
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(height: 6),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                            TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 12),
                                            backgroundColor: Colors.white54,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 94,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      bottomLeft: Radius.circular(11),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8),
                                      Text('Fency Nails'),
                                      const Row(
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(height: 6),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                            TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 12),
                                            backgroundColor: Colors.white54,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 94,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      bottomLeft: Radius.circular(11),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8),
                                      Text('Fency Nails'),
                                      const Row(
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(height: 6),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                            TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 12),
                                            backgroundColor: Colors.white54,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 94,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      bottomLeft: Radius.circular(11),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8),
                                      Text('Fency Nails'),
                                      const Row(
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(height: 6),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                            TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 12),
                                            backgroundColor: Colors.white54,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 94,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      bottomLeft: Radius.circular(11),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8),
                                      Text('Fency Nails'),
                                      const Row(
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(height: 6),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                            TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 12),
                                            backgroundColor: Colors.white54,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 94,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      bottomLeft: Radius.circular(11),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8),
                                      Text('Fency Nails'),
                                      const Row(
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(height: 6),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                            TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 12),
                                            backgroundColor: Colors.white54,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 14, right: 14),
                          child: Container(
                            height: 94,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      bottomLeft: Radius.circular(11),
                                    ),
                                    child: Image.asset(
                                      'assets/img_1.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8),
                                      Text('Fency Nails'),
                                      const Row(
                                        children: [
                                          Icon(Icons.access_time),
                                          Text('Wed'),
                                          Text('18'),
                                          Text('May'),
                                          Text('2023'),
                                        ],
                                      ),
                                      SizedBox(height: 6),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Upcoming',
                                            style:
                                            TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 12),
                                            backgroundColor: Colors.white54,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
