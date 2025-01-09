import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaloonUI extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"icon": "content_cut", "label": "Haircut"},
    {"icon": "face", "label": "Shaves"},
    {"icon": "brush", "label": "Makeup"},
    {"icon": "masks", "label": "Nail Cut"},
  ];

  final List<Map<String, String>> salons = [
    {
      "name": "Serenity Salon",
      "address": "2464 Royal Ln, Mesa, NJ",
      "distance": "2 km"
    },
    {
      "name": "The Glam Room",
      "address": "1234 Broadway Ave, NY",
      "distance": "3 km"
    },
    {"name": "Luxury Cuts", "address": "789 Main St, LA", "distance": "5 km"},
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/customer.png'), // Replace with your profile image
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Viren Radadiya',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black),
                ),
                Text(
                  '2715 Ash Dr. San Jose, San Jose, CA',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.notifications_outlined, color: Colors.black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          // Handle search logic
                          print('Searching for: $value');
                        },
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.filter_list, color: Colors.grey),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Banner
              Container(
                width: size.width,
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '30% Off',
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Wedding Package\nHair-styling & treatment',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              print('Explore clicked');
                            },
                            child: Text('Explore'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: Image.asset('assets/img.png',
                          width: 120), // Replace with your banner image
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Categories
              Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.8,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print('${categories[index]['label']} tapped');
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.purple[50],
                            child: Image.asset('assets/customer.png')),
                        SizedBox(height: 5),
                        Text(categories[index]['label']!,
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20),

              // Nearby Salons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nearby Salons',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(onPressed: () {}, child: Text('View All')),
                ],
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: salons.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print('${salons[index]['name']} tapped');
                    },
                    child: Card(
                      margin: EdgeInsets.only(bottom: 16),
                      child: ListTile(
                        leading: Icon(Icons.store, color: Colors.purple),
                        title: Text(salons[index]['name']!),
                        subtitle: Text(salons[index]['address']!),
                        trailing: Text(salons[index]['distance']!),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on), label: 'Location'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Booking'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          if (index == 4) {
            Navigator.pushNamed(context, '/profile');
          }
          if (index == 2) {
            Navigator.pushNamed(context, '/booking');
          }
        },
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(child: Text('Profile Screen')),
    );
  }
}

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booking')),
      body: Center(child: Text('Booking Screen')),
    );
  }
}
