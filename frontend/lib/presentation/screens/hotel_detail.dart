// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, must_be_immutable, unused_element
// ignore_for_file: use_key_in_widget_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Category {
  final String title;
  final dynamic icon;

  Category({
    required this.title,
    required this.icon,
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

class BottomBar {
  final IconData icon;
  final String title;

  BottomBar({required this.icon, required this.title});
}

class HotelDetail extends StatefulWidget {
  final Map<String, dynamic> data;

  HotelDetail({required this.data});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  final List<Attraction> attractions = [
    Attraction(
        img: 'assets/welcome.jpg',
        title: 'Waterfall',
        descr: 'Lorem ipsum dolor sit amet',
        rating: '4.6'),
    Attraction(
        img: 'assets/asella.jpeg',
        title: 'Watterfall',
        descr: 'Lorem ipsum dolor sit amet ',
        rating: '4.6'),
    Attraction(
        img: 'assets/asella.jpeg',
        title: 'Watterfall',
        descr: 'Lorem ipsum dolor sit amet ',
        rating: '4.6'),
    Attraction(
        img: 'assets/asella.jpeg',
        title: 'Watterfall',
        descr: 'Lorem ipsum dolor sit amet ',
        rating: '4.6'),
    Attraction(
        img: 'assets/asella.jpeg',
        title: 'Watterfall',
        descr: 'Lorem ipsum dolor sit amet ',
        rating: '4.6'),
    Attraction(
        img: 'assets/asella.jpeg',
        title: 'Watterfall',
        descr: 'Lorem ipsum dolor sit amet ',
        rating: '4.6'),
  ];

  final List<Category> amenities = [
    Category(
      title: 'sunning',
      icon: Icons.wb_sunny_outlined,
    ),
    Category(
      title: 'free WiFi',
      icon: Icons.wifi,
    ),
    Category(
      title: 'Restaurant',
      icon: Icons.restaurant_menu,
    ),
    Category(
      title: 'bar',
      icon: Icons.local_bar_rounded,
    ),
  ];

  int selectedIndex = 0;

  int selected = 2;

  @override
  Widget build(BuildContext context) {
    final id = widget.data['_id'];
    final name = widget.data['name'];
    final imagePath = 'http://localhost:5000${widget.data['image']}';
    final description = widget.data['description'];
    final rating = widget.data['rating'];

    final Map<String, dynamic> pics;

    List<dynamic> hotelRoom = [];
    List<dynamic> filteredHotelRoom = [];

    Future<void> fetchHotelRoom() async {
      List<dynamic> fetchedHotelRoom = await getHotelRoom();
      setState(() {
        hotelRoom = fetchedHotelRoom;
      });
    }

    @override
    void initState() {
      super.initState();
      fetchHotelRoom();
    }

    void runFilter(String word) {

    }

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 430,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    child: SizedBox(
                      height: 400,
                      child: Image.network(
                        imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      color: Color.fromARGB(131, 0, 0, 0),
                    ),
                  ),
                  Positioned(
                    bottom: 65,
                    left: 38,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 280,
                            child: Text(
                              name,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Times New Roman',
                                  color: Colors.white,
                                  height: 1),
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                size: 20,
                                color: Colors.white,
                              ),
                              Text(
                                'Location of hotel',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: 'cambo'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 20,
                      child: Container(
                        height: 90,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 134, 134, 134)
                                  .withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 0),
                            ),
                          ],
                          color: Color(0xFF2A4244),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 10),
                          child: Column(
                            children: [
                              Text(
                                rating.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontFamily: 'cambo'),
                              ),
                              Text(
                                '/likes',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'cambo'),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                      top: 10,
                      left: 16,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 17.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overview',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'cambo',
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 40, top: 10),
                      child: Text(
                        description,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ]),
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
                        'Amenities',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cambo',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      amenities.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/location');
                            },
                            child: Column(
                              children: [
                                Icon(
                                  amenities[index].icon,
                                  size: 18,
                                ),
                                Text(
                                  amenities[index].title,
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Text(
                        'Preview',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cambo',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 330,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        attractions.length,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/location');
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                width: 80,
                                height: 80,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      attractions[index].img,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
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
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, top: 20, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 1,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite_border,
                        size: 26,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFF2A4244),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 1,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 90),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/hotelBook');
                        },
                        child: Text(
                          'Book now',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Times New Roman',
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<dynamic>> getHotelRoom() async {
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
