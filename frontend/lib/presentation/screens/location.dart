// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
// ignore_for_file: use_key_in_widget_constructors

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

class BottomBar {
  final IconData icon;
  final String title;

  BottomBar({required this.icon, required this.title});
}

class Location extends StatefulWidget {
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final List<Category> countries = [
    Category(
      region: 'all',
      flag: Icons.apps,
    ),
    Category(
      region: 'Asia',
      flag: '🇨🇳',
    ),
    Category(
      region: 'Europe',
      flag: '🇫🇷',
    ),
    Category(
      region: 'Africa',
      flag: '🇿🇦',
    ),
    Category(
      region: 'Americas',
      flag: '🇺🇸',
    ),
    Category(
      region: 'Oceania',
      flag: '🇦🇺',
    ),
  ];

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
        rating: '4.7'),
    Attraction(
        img: 'assets/asella.jpeg',
        title: 'Watterfall',
        descr: 'Lorem ipsum dolor sit amet ',
        rating: '4.6'),
    Attraction(
        img: 'assets/asella.jpeg',
        title: 'Watterfall',
        descr: 'Lorem ipsum dolor sit amet ',
        rating: '4.5'),
    Attraction(
        img: 'assets/asella.jpeg',
        title: 'Watterfall',
        descr: 'Lorem ipsum dolor sit amet ',
        rating: '4.9'),
    Attraction(
        img: 'assets/asella.jpeg',
        title: 'Watterfall',
        descr: 'Lorem ipsum dolor sit amet ',
        rating: '4.1'),
  ];

  int selectedIndex = 0; // Track the selected index for category/regin

  int selected = 1; // Track the selected index for bottom nav bar

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
                        'Abay fountain',
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
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: 330,
                      height: 160,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/asella.jpeg',
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
                                  Icons.perm_device_information_outlined,
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
                                          'Lorem ipsum dolor sit amet,  ipsum dolor ',
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
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dictum mauris sed purus commodo fringilla. Praesent eu nulla lorem. rus commodo fringilla. Praesen',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
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
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: List.generate(
                        attractions.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {});
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
                                SizedBox(
                                  width: 240,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(8, 10, 8, 7),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              attractions[index].title,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'cambo',
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 3, right: 4, bottom: 4),
                                              child: Row(
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
                                                    attractions[index].rating,
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
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
                                                    fontSize: 13,
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
                                                fontSize: 11,
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
                        attractions.length,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/hotel');
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: SizedBox(
                                width: 207,
                                height: 275,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      attractions[index].img,
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
                                                attractions[index].title,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily:
                                                        'Times New Roman',
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam accumsan congue quam,',
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
                            attractions.length,
                            (index) => Padding(
                              padding: EdgeInsets.only(left: 5.0, bottom: 30),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: SizedBox(
                                        width: 150,
                                        height: 100,
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
                                    SizedBox(
                                      width: 200,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(8, 10, 8, 7),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  attractions[index].title,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: 'cambo',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 85, 85, 85)),
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
                                                        fontSize: 14,
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
                                                        'Rating ${attractions[index].rating}',
                                                        style: TextStyle(
                                                            fontSize: 13,
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
                                                        size: 16,
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
