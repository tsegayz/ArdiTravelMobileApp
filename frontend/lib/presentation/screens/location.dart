// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
// ignore_for_file: use_key_in_widget_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

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

class BottomBar {
  final IconData icon;
  final String title;

  BottomBar({required this.icon, required this.title});
}

class Location extends StatefulWidget {
  final Map<String, dynamic> data;

  Location({required this.data});
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  int selectedIndex = 0;
  int selected = 1;

  late int id;
  List<dynamic> locations = [];
  List<dynamic> hotels = [];
  List<dynamic> restaurants = [];

  List<dynamic> _filteredHotels = [];
  List<dynamic> _filteredRestaurant = [];
  List<dynamic> _filteredLocation = [];

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

  Future<void> fetchFilteredData() async {
    List<dynamic> fetchedHotels = await getHotels();
    setState(() {
      hotels = fetchedHotels;
      _filteredHotels =
          hotels.where((hotel) => hotel['location_id'] == id).toList();
      _filteredRestaurant = restaurants
          .where((restaurant) => restaurant['locationtype_id'] == id)
          .toList();
      _filteredLocation = locations
          .where((location) => location['location_type_id'] == id)
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    id = widget.data['_id'];
    fetchHotels();
    fetchLocations();
    fetchRestaurants();
    fetchFilteredData();
  }

  @override
  Widget build(BuildContext context) {
    final region = widget.data['region'];
    final zone = widget.data['zone'];
    final woreda = widget.data['woreda'];
    final imagePath = 'http://localhost:5000${widget.data['image']}';
    final description = widget.data['description'];

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
            Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 34.0),
                      child: Text(
                        region,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'cambo',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: 330,
                      height: 160,
                      child: Stack(
                        children: [
                          Image.network(
                            imagePath,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Color.fromARGB(131, 0, 0, 0),
                          ),
                          Positioned(
                            bottom: 13,
                            left: 10,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 190,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '$zone, $woreda',
                                          style: TextStyle(
                                            fontSize: 14,
                                            height: 1.2,
                                            fontFamily: 'Times New Roman',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
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
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Column(children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 34.0),
                    child: Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'cambo',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                margin: EdgeInsets.only(left: 30),
                width: 350,
                child: Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 9,
                  ),
                ),
              )
            ]),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 34.0),
                      child: Text(
                        'Attractions',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cambo',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: List.generate(
                        _filteredLocation.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/attractionDetail',
                                arguments: {'data': _filteredLocation[index]},
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: SizedBox(
                                    width: 240,
                                    height: 180,
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          'http://localhost:5000${_filteredLocation[index]['image']}',
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 240,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(8, 10, 8, 7),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _filteredLocation[index]['name'],
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'cambo',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on_rounded,
                                                  size: 15,
                                                ),
                                                Text(
                                                  'Details - location',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontFamily:
                                                        'Times New Roman',
                                                    color: Color.fromARGB(
                                                        255, 122, 122, 122),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '\$150.00/person',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'cambo',
                                                color: Color.fromARGB(
                                                    255, 122, 122, 122),
                                              ),
                                            ),
                                          ],
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
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 34.0),
                      child: Text(
                        'Hotels',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cambo',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: List.generate(
                        _filteredHotels.length,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/hotelDetail',
                                arguments: {'data': _filteredHotels[index]},
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: SizedBox(
                                width: 207,
                                height: 275,
                                child: Stack(
                                  children: [
                                    Image.network(
                                      'http://localhost:5000${_filteredHotels[index]['image']}',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      color: Color.fromARGB(131, 0, 0, 0),
                                    ),
                                    Positioned(
                                      bottom: 13,
                                      left: 10,
                                      child: Container(
                                        width: 190,
                                        padding: EdgeInsets.all(2),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(8, 1, 8, 7),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _filteredHotels[index]['name'],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily:
                                                        'Times New Roman',
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                _filteredHotels[index]
                                                    ['description'],
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 18,
                                      top: 20,
                                      child: Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: Icon(
                                                Icons.favorite_border,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
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
                SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 34.0),
                          child: Text(
                            'Restaurants',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'cambo',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Column(
                          children: List.generate(
                            _filteredRestaurant.length,
                            (index) => Padding(
                              padding: EdgeInsets.only(left: 5.0, bottom: 30),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/restaurant',
                                    arguments: {
                                      'data': _filteredRestaurant[index]
                                    },
                                  );
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: SizedBox(
                                        width: 130,
                                        height: 100,
                                        child: Stack(
                                          children: [
                                            Image.network(
                                              'http://localhost:5000${_filteredRestaurant[index]['image']}',
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(18, 10, 8, 7),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 160,
                                                  child: Text(
                                                    _filteredRestaurant[index]['name'],
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily: 'cambo',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromARGB(
                                                            255, 85, 85, 85)),
                                                            
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.location_on_rounded,
                                                      size: 15,
                                                    ),
                                                    Text(
                                                      'Details - location',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontFamily: 'cambo',
                                                        color: Color.fromARGB(
                                                            255, 122, 122, 122),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 3,
                                                      right: 4,
                                                      bottom: 4),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Rating ${_filteredRestaurant[index]['rating']}',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontFamily:
                                                                'Times New Roman',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      SizedBox(
                                                        width: 2,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                        size: 14,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
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
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
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
      return [];
    }
  } catch (e) {
    return [];
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
      return [];
    }
  } catch (e) {
    return [];
  }
}

Future<List<dynamic>> getRestaurants() async {
  try {
    final response =
        await http.get(Uri.parse('http://localhost:5000/api/v1/restaurants'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<dynamic> restaurants = data['data']['restaurants'];
      return restaurants;
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
}
