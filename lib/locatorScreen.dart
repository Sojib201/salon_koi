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

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:koi/saloon_list/saloon_data.dart';
//
// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});
//
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   GoogleMapController? _controller;
//   final Set<Marker> _markers = {};
//
//   final Set<Polyline> _polylines = {};
//   final List<LatLng> _polylineCoordinates = [
//     LatLng(23.7530, 90.3792),
//     LatLng(23.7540, 90.3792),
//     // LatLng(23.7550, 90.3800),
//   ];
//
//   void _onMapCreated(GoogleMapController controller) {
//     _controller = controller;
//     //_addPolyline();
//   }
//   // void _addPolyline() {
//   //   setState(() {
//   //     _polylines.add(Polyline(
//   //       polylineId: PolylineId('route1'),
//   //       points: _polylineCoordinates,
//   //       color: Colors.red,
//   //       width: 5, // Line thickness
//   //     ));
//   //   });
//   // }
//
//   @override
//   void initState() {
//     super.initState();
//     _loadMarkers();
//   }
//
//   Future<void> _loadMarkers() async {
//     try {
//       // Map<String, dynamic> AllSaloon = {
//       //   'list': [
//       //     {
//       //       'id': 2,
//       //       'saloonName': 'Maruf Barbar Shop',
//       //       'lat': 23.7530,
//       //       'lon': 90.3792
//       //     },
//       //     {
//       //       'id': 3,
//       //       'saloonName': 'Sojib Barbar Shop',
//       //       'lat': 23.7540,
//       //       'lon': 90.3792
//       //     },
//       //     {
//       //       'id': 4,
//       //       'saloonName': 'Emon Barbar Shop',
//       //       'lat': 2.7535,
//       //       'lon': 90.3792
//       //     },
//       //   ]
//       // };
//       List<dynamic> salons = AllSaloon['list'];
//
//       setState(() {
//         _markers.clear();
//         for (var salon in salons) {
//           _markers.add(Marker(
//             markerId: MarkerId(salon['id'].toString()),
//             position: LatLng(salon['lat'], salon['lon']),
//             infoWindow: InfoWindow(
//               title: salon['saloonName'],
//               snippet: 'Details about this salon',
//             ),
//           ));
//         }
//       });
//     } catch (e) {
//       print("Error loading markers: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: Stack(
//           children: [
//             Positioned(
//               bottom: MediaQuery.of(context).size.height * 0.15,
//               left: 0,
//               right: 0,
//               top: 0,
//               child: Expanded(
//                 //flex: 5,
//                 child: Container(
//                   color: Colors.purple.shade50,
//                   child: Column(
//                     children: [
//                       Container(
//                         child: Row(
//                           //mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Expanded(
//                               flex: 2,
//                               child: IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(Icons.arrow_back),
//                               ),
//                             ),
//                             //SizedBox(width: 6,),
//                             const Expanded(
//                               flex: 5,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     'Current Location',
//                                     style: TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                   Row(
//                                     children: [
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       Icon(
//                                         Icons.location_on,
//                                         size: 18,
//                                         color: Colors.green,
//                                       ),
//                                       Text('Ash Dr. San Jose'),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             //SizedBox(width: 110,),
//                             Expanded(
//                               flex: 1,
//                               child: IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(Icons.search),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         flex: 6,
//                         child: ClipRRect(
//                           borderRadius: const BorderRadius.only(
//                             topRight: Radius.circular(35),
//                             topLeft: Radius.circular(35),
//                           ),
//                           child: GoogleMap(
//                               // polylines: <Polyline>{
//                               //   Polyline(
//                               //     polylineId: PolylineId('sample'),
//                               //     color: Colors.red,
//                               //
//                               //   )
//                               // },
//                               polylines: <Polyline>{
//                                 Polyline(
//                                   polylineId: PolylineId('route1'),
//                                   color: Colors.blue,
//                                   points: _polylineCoordinates,
//                                 ),
//                               },
//                               initialCameraPosition: const CameraPosition(
//                                 target: LatLng(23.7535, 90.3792),
//                                 zoom: 15,
//                               ),
//                               markers: _markers,
//                               onMapCreated: _onMapCreated),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: MediaQuery.of(context).size.height * 0.25,
//               left: 0,
//               right: 0,
//               bottom: 0,
//               child: DraggableScrollableSheet(
//                 expand: true,
//                 initialChildSize: 0.3,
//                 minChildSize: 0.3,
//                 maxChildSize: 0.7,
//                 builder:
//                     (BuildContext context, ScrollController scrollController) {
//                   return Container(
//                     height: 180,
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(35),
//                         topRight: Radius.circular(35),
//                       ),
//                     ),
//                     child: ListView.builder(
//                       controller: scrollController,
//                         itemCount: 20,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: const EdgeInsets.only(
//                                 top: 3, bottom: 10, left: 14, right: 14),
//                             child: Container(
//                               height: 94,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: const BorderRadius.all(
//                                   Radius.circular(12),
//                                 ),
//                                 border: Border.all(color: Colors.grey),
//                               ),
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     flex: 4,
//                                     child: ClipRRect(
//                                       borderRadius: const BorderRadius.only(
//                                         topLeft: Radius.circular(11),
//                                         bottomLeft: Radius.circular(11),
//                                       ),
//                                       child: Image.asset(
//                                         'assets/img_1.png',
//                                         fit: BoxFit.contain,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(width: 8),
//                                   Expanded(
//                                     flex: 10,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         SizedBox(height: 8),
//                                         Text('Fency Nails'),
//                                         const Row(
//                                           children: [
//                                             Icon(Icons.access_time),
//                                             Text('Wed'),
//                                             Text('18'),
//                                             Text('May'),
//                                             Text('2023'),
//                                           ],
//                                         ),
//                                         SizedBox(height: 6),
//                                         SizedBox(
//                                           height: 30,
//                                           child: ElevatedButton(
//                                             onPressed: () {},
//                                             style: ElevatedButton.styleFrom(
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(30),
//                                               ),
//                                               padding: const EdgeInsets.symmetric(
//                                                   vertical: 0, horizontal: 12),
//                                               backgroundColor: Colors.white54,
//                                             ),
//                                             child: const Text(
//                                               'Upcoming',
//                                               style:
//                                                   TextStyle(color: Colors.black),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:koi/saloon_list/saloon_data.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  final Set<Marker> _markers = {};

  final Set<Polyline> _polylines = {};
  final List<LatLng> _polylineCoordinates = [
    LatLng(23.7530, 90.3792),
    LatLng(23.7550, 90.3795),
    //LatLng(23.7550, 90.3800),
  ];

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    //_addPolyline();
  }
  // void _addPolyline() {
  //   setState(() {
  //     _polylines.add(Polyline(
  //       polylineId: PolylineId('route1'),
  //       points: _polylineCoordinates,
  //       color: Colors.red,
  //       width: 5, // Line thickness
  //     ));
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  Future<void> _loadMarkers() async {
    try {
      // Map<String, dynamic> AllSaloon = {
      //   'list': [
      //     {
      //       'id': 2,
      //       'saloonName': 'Maruf Barbar Shop',
      //       'lat': 23.7530,
      //       'lon': 90.3792
      //     },
      //     {
      //       'id': 3,
      //       'saloonName': 'Sojib Barbar Shop',
      //       'lat': 23.7540,
      //       'lon': 90.3792
      //     },
      //     {
      //       'id': 4,
      //       'saloonName': 'Emon Barbar Shop',
      //       'lat': 2.7535,
      //       'lon': 90.3792
      //     },
      //   ]
      // };
      List<dynamic> salons = AllSaloon['list'];

      setState(() {
        _markers.clear();
        for (var salon in salons) {
          _markers.add(Marker(
            markerId: MarkerId(salon['id'].toString()),
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
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.166,
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                color: Colors.purple.shade50,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            //flex: 1,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_back),
                            ),
                          ),
                          //SizedBox(width: 6,),
                          const Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Current Location',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 18,
                                      color: Colors.green,
                                    ),
                                    Text('Ash Dr. San Jose'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          //SizedBox(width: 110,),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      //flex: 6,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(28),
                          topLeft: Radius.circular(28),
                        ),
                        child: GoogleMap(
                            trafficEnabled: true,
                            buildingsEnabled: true,
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                            scrollGesturesEnabled: true,

                            // polylines: <Polyline>{
                            //   Polyline(
                            //     polylineId: PolylineId('sample'),
                            //     color: Colors.red,
                            //
                            //   )
                            // },

                            // polygons: {
                            //   Polygon(
                            //     polygonId: PolygonId('polygon1'),
                            //     points: _polylineCoordinates,
                            //     fillColor: Colors.blue.withOpacity(0.2),
                            //     strokeColor: Colors.red,
                            //     strokeWidth: 2,
                            //   ),
                            // },

                            polylines: <Polyline>{
                              Polyline(
                                polylineId: PolylineId('route1'),
                                color: Colors.blue,
                                points: _polylineCoordinates,
                              ),
                            },
                            initialCameraPosition: const CameraPosition(
                              target: LatLng(23.7550, 90.37100),
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
            DraggableScrollableSheet(
              initialChildSize: 0.21,
              minChildSize: 0.2,
              maxChildSize: 0.8,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          //flex:2,
                          child: Icon(
                            Icons.horizontal_rule_rounded,
                            size: 30,
                          ),
                        ),
                        Expanded(
                          flex: 18,
                          child: ListView.builder(
                            controller: scrollController,
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 10, left: 14, right: 14),
                                child: Container(
                                  height: 94,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
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
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 0,
                                                      horizontal: 12),
                                                  backgroundColor:
                                                      Colors.white54,
                                                ),
                                                child: const Text(
                                                  'Upcoming',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
