// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
// ignore_for_file: use_key_in_widget_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Category {
  final String region;
  final dynamic flag;

  Category({
    required this.region,
    required this.flag,
  });
}

class Attraction {
  final String img;
  final String title;
  final String descr;
  final String rating;

  Attraction(
      {required this.img,
      required this.title,
      required this.descr,
      required this.rating});
}

class Trip extends StatefulWidget {
  @override
  State<Trip> createState() => _TripState();
}

class _TripState extends State<Trip> {

  int selectedIndex = 0; // Track the selected index for category/regin

  int selected = 2; // Track the selected index for bottom nav bar

  List<dynamic> hotels = [];
  List<dynamic> locations = [];
  List<dynamic> restaurants = [];
  List<dynamic> tourGuides = [];

  Future<void> fetchLocations() async {
    List<dynamic> fetchedLocations = await getLocation();
    setState(() {
      locations = fetchedLocations;
    });
  }

  Future<void> fetchHotels() async {
    List<dynamic> fetchedHotels = await getHotels();
    setState(() {
      hotels = fetchedHotels;
    });
  }

  Future<void> fetchRestaurants() async {
    List<dynamic> fetchedRestaurants = await getRestaurants();
    setState(() {
      restaurants = fetchedRestaurants;
    });
  }

  Future<void> fetchTourGuides() async {
    List<dynamic> fetchTourGuides = await getTourguides();
    setState(() {
      tourGuides = fetchTourGuides;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchLocations();
    fetchHotels();
    fetchRestaurants();
    fetchTourGuides();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            'Ardi Travel',
            style: TextStyle(
              fontFamily: 'lobster',
              fontSize: 24,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(top: 17.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
              size: 16,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Container(
                width: 33,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 3,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                child: Center(
                    child: Icon(
                  Icons.notifications_none_rounded,
                  size: 20,
                ))),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: Divider(
                          color: Color(0xFFCECBCB),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        'The variety of cities and destinations',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 153, 153, 153),
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: List.generate(
                        locations.length,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/location');
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                width: 290,
                                height: 190,
                                child: Stack(
                                  children: [
                                    Image.network(
                                      'http://localhost:5000${locations[index]['image']}',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                    Container(
                                      color: Color.fromARGB(123, 0, 0, 0),
                                    ),
                                    Positioned(
                                      top: 5,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 24.0, top: 14),
                                        child: SizedBox(
                                          width: 100,
                                          child: Text(
                                            locations[index]['name'],
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'lobster',
                                                color: Colors.white),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 13,
                                      right: 10,
                                      child: Container(
                                        width: 155,
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color:
                                              Color.fromARGB(76, 255, 255, 255),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.info_outline_rounded,
                                                color: Colors.white,
                                                size: 28,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              SizedBox(
                                                width: 106,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      locations[index]
                                                          ['description'],
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          fontFamily:
                                                              'Times New Roman',
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 27,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Text(
                        'Top Luxury hotels',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, bottom: 5),
                    child: Row(
                      children: List.generate(
                        hotels.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {});
                            },
                            child: Container(
                                width: 190,
                                height: 302,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 2,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 10.0, left: 10, right: 10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: SizedBox(
                                          width: 175,
                                          height: 130,
                                          child: Image.network(
                                            'http://localhost:5000${hotels[index]['image']}',
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 110,
                                                child: Text(
                                                  hotels[index]['name'],
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      fontFamily: 'cambo',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Icon(
                                                Icons.favorite_border,
                                                color: Colors.red,
                                                size: 15,
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 100,
                                                child: Text(
                                                  'Room type: Deluxe, executive',
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      fontFamily:
                                                          'Times New Roman',
                                                      height: 1.2,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 12,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Text(
                                                    '${hotels[index]['rating']} rating',
                                                    style: TextStyle(
                                                        fontSize: 9,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '\$180.00',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'cambo',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.bed_outlined,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                '170 rooms',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color.fromARGB(
                                                        255, 148, 148, 148)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.apartment_sharp,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                'luxury hotels to enjoy',
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    color: Color.fromARGB(
                                                        255, 148, 148, 148)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Text(
                        'Splendid restaurants',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Row(
                      children: [
                        for (int i = 0; i < restaurants.length; i += 7)
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    height: 100,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, '/restaurantDetail');
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Stack(children: [
                                          Image.network(
                                            'http://localhost:5000${restaurants[i]['image']}',
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                          Container(
                                            color: Color.fromARGB(68, 0, 0, 0),
                                          ),
                                          Positioned(
                                              left: 10,
                                              bottom: 10,
                                              child: Text(
                                                restaurants[i]['name'],
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    fontFamily:
                                                        'Times New Roman',
                                                    color: Colors.white),
                                              )),
                                        ]),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  SizedBox(
                                    width: 150,
                                    height: 100,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/location');
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Stack(children: [
                                          Image.network(
                                            'http://localhost:5000${restaurants[i + 1]['image']}',
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                          Container(
                                            color: Color.fromARGB(115, 0, 0, 0),
                                          ),
                                          Positioned(
                                              left: 10,
                                              bottom: 10,
                                              child: Text(
                                                restaurants[i + 1]['name'],
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    fontFamily:
                                                        'Times New Roman',
                                                    color: Colors.white),
                                              )),
                                        ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 15),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    height: 215,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/location');
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Stack(children: [
                                          Image.network(
                                            'http://localhost:5000${restaurants[i + 2]['image']}',
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                          Container(
                                            color: Color.fromARGB(115, 0, 0, 0),
                                          ),
                                          Positioned(
                                              left: 10,
                                              bottom: 10,
                                              child: Text(
                                                restaurants[i + 2]['name'],
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    fontFamily:
                                                        'Times New Roman',
                                                    color: Colors.white),
                                              )),
                                        ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 15),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 280,
                                    height: 100,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/location');
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Stack(children: [
                                          Image.network(
                                            'http://localhost:5000${restaurants[i + 3]['image']}',
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                          Container(
                                            color: Color.fromARGB(115, 0, 0, 0),
                                          ),
                                          Positioned(
                                              left: 10,
                                              bottom: 10,
                                              child: Text(
                                                restaurants[i + 3]['name'],
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    fontFamily:
                                                        'Times New Roman',
                                                    color: Colors.white),
                                              )),
                                        ]),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 130,
                                        height: 100,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/location');
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Stack(children: [
                                              Image.network(
                                                'http://localhost:5000${restaurants[i + 4]['image']}',
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                                height: double.infinity,
                                              ),
                                              Container(
                                                color: Color.fromARGB(
                                                    115, 0, 0, 0),
                                              ),
                                              Positioned(
                                                  left: 10,
                                                  bottom: 10,
                                                  child: Text(
                                                    restaurants[i + 4]['name'],
                                                    style: TextStyle(
                                                        fontSize: 9,
                                                        fontFamily:
                                                            'Times New Roman',
                                                        color: Colors.white),
                                                  )),
                                            ]),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      SizedBox(
                                        width: 130,
                                        height: 100,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/location');
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Stack(children: [
                                              Image.network(
                                                'http://localhost:5000${restaurants[i + 5]['image']}',
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                                height: double.infinity,
                                              ),
                                              Container(
                                                color: Color.fromARGB(
                                                    115, 0, 0, 0),
                                              ),
                                              Positioned(
                                                  left: 10,
                                                  bottom: 10,
                                                  child: Text(
                                                    restaurants[i + 5]['name'],
                                                    style: TextStyle(
                                                        fontSize: 9,
                                                        fontFamily:
                                                            'Times New Roman',
                                                        color: Colors.white),
                                                  )),
                                            ]),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(width: 15),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Text(
                        'Tour Guides :',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Row(
                      children: List.generate(
                        tourGuides.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {});
                            },
                            child: Container(
                                width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 1,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: SizedBox(
                                          width: 75,
                                          height: 62,
                                          child: Image.network(
                                            'http://localhost:5000${tourGuides[index]['image']}',
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            tourGuides[index]['name'],
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'Times New Roman',
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            width: 70,
                                            child: Text(
                                              tourGuides[index]['featuring'],
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontFamily: 'Times New Roman',
                                                color: Color.fromARGB(
                                                    255, 122, 122, 122),
                                              ),
                                              maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 12,
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                tourGuides[index]['rating']
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontFamily: 'Times New Roman',
                                                  color: Color.fromARGB(
                                                      255, 122, 122, 122),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(14, 0, 14, 15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Color(0xFF2A4244),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 19.0),
            child: NavigationBar(
              height: 30,
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedIndex: selected,
              destinations: [
                NavigationDestination(
                  icon: Image.asset(
                    'assets/home.png',
                    width: 20,
                    height: 20,
                    color: Colors.white,
                  ),
                  label: '',
                ),
                NavigationDestination(
                    icon: Image.asset(
                      'assets/luggage.png',
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                    label: ''),
                NavigationDestination(
                  icon: Image.asset(
                    'assets/tourist.png',
                    width: 26,
                    height: 26,
                  ),
                  label: '',
                ),
                NavigationDestination(
                    icon: Image.asset(
                      'assets/restaurant.png',
                      width: 20,
                      height: 20,
                      color: Colors.white,
                    ),
                    label: ''),
                NavigationDestination(
                    icon: Image.asset(
                      'assets/user.png',
                      width: 20,
                      height: 20,
                      color: Colors.white,
                    ),
                    label: ''),
              ],
              onDestinationSelected: (index) {
                Navigator.of(context).pushNamed([
                  '/home',
                  '/hotel',
                  '/trip',
                  '/restaurant',
                  '/profile'
                ][index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}

Future<List<dynamic>> getLocation() async {
  try {
    final response =
        await http.get(Uri.parse('http://localhost:5000/api/v1/locations'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<dynamic> locations = data['data']['locations'];
      return locations;
    } else {
      return []; // Return an empty list if response status code is not 200
    }
  } catch (e) {
    return []; // Return an empty list if an error occurs
  }
}

Future<List<dynamic>> getHotels() async {
  try {
    final response =
        await http.get(Uri.parse('http://localhost:5000/api/v1/hotels'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<dynamic> hotels = data['data']['hotels'];
      return hotels;
    } else {
      return []; // Return an empty list if response status code is not 200
    }
  } catch (e) {
    return []; // Return an empty list if an error occurs
  }
}

Future<List<dynamic>> getRestaurants() async {
  try {
    final response =
        await http.get(Uri.parse('http://localhost:5000/api/v1/restaurants'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<dynamic> restaurants = data['data']['restaurants'];
      print(restaurants);
      return restaurants;
    } else {
      return []; // Return an empty list if response status code is not 200
    }
  } catch (e) {
    return []; // Return an empty list if an error occurs
  }
}

Future<List<dynamic>> getTourguides() async {
  try {
    final response =
        await http.get(Uri.parse('http://localhost:5000/api/v1/tourGuides'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<dynamic> tourGuides = data['data']['tourGuides'];
      return tourGuides;
    } else {
      return []; // Return an empty list if response status code is not 200
    }
  } catch (e) {
    return []; // Return an empty list if an error occurs
  }
}
