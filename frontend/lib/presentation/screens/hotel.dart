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

class Hotel extends StatefulWidget {
  @override
  State<Hotel> createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  int selectedIndex = 0;
  String enteredWord = '';
  int selected = 1;
  List<dynamic> hotels = [];
  List<dynamic> _filteredHotels = [];

  Future<void> fetchHotels() async {
    List<dynamic> fetchedHotels = await getHotels();
    setState(() {
      hotels = fetchedHotels;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchHotels();
  }

  void _runFilter(String word) {
    setState(() {
      enteredWord = word;
    });

    if (word.isEmpty) {
      setState(() {
        _filteredHotels = hotels.toList();
      });
    } else {
      setState(() {
        _filteredHotels = hotels
            .where((hotel) =>
                hotel['name'].toLowerCase().contains(word.toLowerCase()))
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
                Padding(
                  padding: const EdgeInsets.only(left: 28, top: 30),
                  child: Text(
                    'Discover',
                    style: TextStyle(
                        fontSize: 18,
                        height: 1,
                        fontFamily: 'cambo',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Text(
                    'hotel of your choice',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'cambo',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, right: 10, left: 10),
                        width: 280,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 134, 134, 134)
                                  .withOpacity(0.5),
                              blurRadius: 1,
                              offset: Offset(0, 1),
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
                                size: 25,
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 12, left: 10),
                                  child: TextField(
                                    onChanged: (value) => _runFilter(value),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Times New Roman',
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Discover a location.....',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 192, 192, 192),
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
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                        child: Icon(
                          Icons.apps_rounded,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 38,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Text(
                            'Popular',
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
                      child: Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: Row(
                          children: List.generate(
                            hotels.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/hotelDetail',
                                    arguments: {'data': hotels[index]},
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          'http://localhost:5000${hotels[index]['image']}',
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
                  height: 30,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Text(
                            'All per your need ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'cambo',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 4, 30, 20),
                      child: SizedBox(
                        height: 330,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20.0,
                          ),
                          itemCount: hotels.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/hotelDetail',
                                  arguments: {'data': hotels[index]},
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 9.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: SizedBox(
                                    width: 207,
                                    height: 275,
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          'http://localhost:5000${hotels[index]['image']}',
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
                                          left: 4,
                                          child: Container(
                                            width: 190,
                                            padding: EdgeInsets.all(2),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 1, 8, 7),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 130,
                                                    child: Text(
                                                      hotels[index]['name'],
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontFamily:
                                                              'Times New Roman',
                                                          color: Colors.white),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 90,
                                                    child: Text(
                                                      hotels[index]
                                                          ['description'],
                                                      style: TextStyle(
                                                          fontSize: 9,
                                                          color: Colors.white),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
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
                                            width: 26,
                                            height: 26,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: Icon(
                                                    size: 18,
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
                            );
                          },
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Visibility(
              visible: enteredWord.isEmpty ? false : true,
              child: Container(
                margin: EdgeInsets.only(top: 150, left: 40),
                width: 280,
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
                    _filteredHotels.length,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/hotelDetail',
                          arguments: {'data': _filteredHotels[index]},
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 8, 15, 0),
                        child: Text(
                          _filteredHotels[index]['name'],
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
