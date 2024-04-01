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

class Restaurant extends StatefulWidget {
  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  final List<Category> countries = [
    Category(
      region: 'all',
      flag: Icons.apps,
    ),
    Category(
      region: 'City',
      flag: Icons.local_bar_rounded,
    ),
    Category(
      region: 'Local',
      flag: Icons.fastfood,
    ),
    Category(region: 'Luxury', flag: Icons.breakfast_dining_outlined),
  ];

  int selectedIndex = 0;
  int selected = 3;
  String enteredWord = '';
  List<dynamic> restaurants = [];
  List<dynamic> _filteredRestaurants = [];

  Future<void> fetchRestaurants() async {
    List<dynamic> fetchedRestaurants = await getRestaurants();
    setState(() {
      restaurants = fetchedRestaurants;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchRestaurants();
  }

  void _runFilter(String word) {
    setState(() {
      enteredWord = word;
    });

    if (word.isEmpty) {
      setState(() {
        _filteredRestaurants = restaurants.toList();
      });
    } else {
      setState(() {
        _filteredRestaurants = restaurants
            .where((restaurant) =>
                restaurant['name'].toLowerCase().contains(word.toLowerCase()))
            .toList();
      });
    }
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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text.rich(
                //   TextSpan(
                //       text: 'Lets eat',
                //       style: TextStyle(
                //         fontSize: 18,
                //         height: 1,
                //         fontFamily: 'cambo',
                //       ),
                //       children: [
                //         TextSpan(
                //           text: 'Quality Food',
                //           style: TextStyle(
                //             color: Colors.amber,
                //           ),
                //         ),
                //       ]),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 20),
                  child: Text(
                    'Lets eat',
                    style: TextStyle(
                      fontSize: 18,
                      height: 1,
                      fontFamily: 'cambo',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Text(
                    'Quality Food',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.amber,
                      fontFamily: 'cambo',
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 15,
                    ),
                    width: 322,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 134, 134, 134)
                              .withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            top: -50,
                            right: 40,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 134, 134, 134)
                                        .withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                                color: Color(0xFFF8D49B),
                              ),
                            )),
                        Positioned(
                            top: -40,
                            right: -10,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 134, 134, 134)
                                        .withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                                color: Color(0xFFF6C986),
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'All the retaurants',
                                style: TextStyle(
                                  fontSize: 17,
                                  height: 1,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'cambo',
                                ),
                              ),
                              Text(
                                'you need',
                                style: TextStyle(
                                  fontSize: 17,
                                  height: 1,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'cambo',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  'search restaurants ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 1,
                                    color: const Color.fromARGB(
                                        255, 184, 184, 184),
                                    fontFamily: 'cambo',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    width: 320,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 134, 134, 134)
                              .withOpacity(0.5),
                          blurRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.search_rounded,
                            color: Colors.grey,
                            size: 24,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 4.0, left: 5),
                              child: TextField(
                                onChanged: (value) => _runFilter(value),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Times New Roman',
                                ),
                                decoration: InputDecoration(
                                  hintText: 'search restaurant.....',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 192, 192, 192),
                                    fontSize: 15,
                                    fontFamily: 'cambo',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'cambo',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 45,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 32, left: 32),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        countries.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 7),
                            child: Container(
                              padding: EdgeInsets.only(
                                right: 10.0,
                              ),
                              decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? Color(0xFF2A4244)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                    offset: Offset(1, 1),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 6),
                                    child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child:
                                          Icon(countries[index].flag, size: 15),
                                    ),
                                  ),
                                  Text(
                                    countries[index].region,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
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
                SizedBox(
                  height: 35,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Text(
                            'Top Restaurants :',
                            style: TextStyle(
                              fontSize: 14,
                              height: 1,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'cambo',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: Row(
                          children: List.generate(
                            restaurants.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/restaurantDetail',
                                    arguments: {'data': restaurants[index]},
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: SizedBox(
                                    width: 307,
                                    height: 190,
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          'http://localhost:5000${restaurants[index]['image']}',
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          child: Container(
                                            width: 307,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 10),
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 190,
                                                      child: Text(
                                                        restaurants[index]
                                                            ['name'],
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Times New Roman',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 150,
                                                      child: Text(
                                                        restaurants[index]
                                                            ['description'],
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          fontFamily:
                                                              'Times New Roman',
                                                          color: Color.fromARGB(
                                                              255,
                                                              122,
                                                              122,
                                                              122),
                                                        ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '\$15 - \$25',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'cambo',
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 15,
                                          right: 25,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 3,
                                                        vertical: 3),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      '4.8',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black),
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
                                              )),
                                        ),
                                        Positioned(
                                          bottom: 55,
                                          right: 0,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(18.0),
                                                ),
                                                color: Color.fromARGB(
                                                    181, 255, 255, 255),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 4),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .table_restaurant_outlined,
                                                      size: 16,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      'Book now',
                                                      style: TextStyle(
                                                          fontFamily: 'cambo',
                                                          fontSize: 14,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              )),
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
                  height: 25,
                )
              ],
            ),
            Visibility(
              visible: enteredWord.isEmpty ? false : true,
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 260),
                  width: 320,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 134, 134, 134).withOpacity(0.5),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: List.generate(
                      _filteredRestaurants.length,
                      (index) => GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/restaurantDetail',
                            arguments: {'data': _filteredRestaurants[index]},
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB( 15, 8, 15, 0),
                          child: Text(
                            _filteredRestaurants[index]['name'],
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'Times New Roman',
                              color: Colors.black,
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
                    color: Colors.white,
                  ),
                  label: '',
                ),
                NavigationDestination(
                    icon: Image.asset(
                      'assets/restaurant.png',
                      width: 20,
                      height: 20,
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

Future<List<dynamic>> getRestaurants() async {
  try {
    final response =
        await http.get(Uri.parse('http://localhost:5000/api/v1/restaurants'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<dynamic> restaurants = data['data']['restaurants'];
      return restaurants;
    } else {
      return []; // Return an empty list if response status code is not 200
    }
  } catch (e) {
    return []; // Return an empty list if an error occurs
  }
}
