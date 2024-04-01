// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_print
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

class _FlagClipper extends CustomClipper<Path> {
  const _FlagClipper(this.radius);

  final double radius;

  @override
  Path getClip(Size size) {
    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);

    path.addOval(Rect.fromCircle(center: center, radius: radius));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
  int selectedIndex = 0; // Track the selected index for category/regin

  int selected = 0; // Track the selected index for bottom nav bar
  String enteredWord = '';

  List<dynamic> locations = [];
  List<dynamic> locationType = [];
  List<dynamic> _filteredLocation = [];
  List<dynamic> activities = [];

  Future<void> fetchLocations() async {
    List<dynamic> fetchedLocations = await getLocation();
    setState(() {
      locations = fetchedLocations;
    });
  }

  Future<void> fetchLocationType() async {
    List<dynamic> fetchedLocationType = await getLocationType();
    setState(() {
      locationType = fetchedLocationType;
    });
  }

  Future<void> fetchActivities() async {
    List<dynamic> fetchActivities = await getActivity();
    setState(() {
      activities = fetchActivities;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchLocations();
    fetchLocationType();
    fetchActivities();
  }

  void _runFilter(String word) {
    setState(() {
      enteredWord = word;
    });

    if (word.isEmpty) {
      setState(() {
        _filteredLocation = locationType.toList();
      });
    } else {
      setState(() {
        _filteredLocation = locationType
            .where((locationType) => locationType['region']
                .toLowerCase()
                .contains(word.toLowerCase()))
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
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 25),
                    width: 320,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 134, 134, 134)
                              .withOpacity(0.5),
                          spreadRadius: 0.8,
                          blurRadius: 0.5,
                        ),
                      ],
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: TextField(
                                onChanged: (value) => _runFilter(value),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Times New Roman',
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Discover a location.....',
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
                          Icon(
                            Icons.search_rounded,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
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
                              getLocation();
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
                                  countries[index].flag is IconData
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 6),
                                          child: Container(
                                            width: 21,
                                            height: 21,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Icon(countries[index].flag,
                                                size: 15),
                                          ),
                                        )
                                      : ClipPath(
                                          clipper: _FlagClipper(8),
                                          child: Text(
                                            countries[index].flag,
                                            style: TextStyle(
                                              fontSize: 24,
                                            ),
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
                  height: 5,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Text(
                            'Trending Attractions :',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Times New Roman',
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
                            activities.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/attractionDetail',
                                    arguments: {'data': activities[index]},
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: SizedBox(
                                    width: 207,
                                    height: 275,
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          'http://localhost:5000${activities[index]['image']}',
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          left: 10,
                                          child: Container(
                                            width: 185,
                                            height: 60,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 4),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  activities[index]['name'],
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontFamily:
                                                        'Times New Roman',
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 3.0),
                                                  child: Text(
                                                    activities[index]
                                                        ['description'],
                                                    style: TextStyle(
                                                      fontSize: 7.5,
                                                      fontFamily:
                                                          'Times New Roman',
                                                      color: Color.fromARGB(
                                                          255, 122, 122, 122),
                                                    ),
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 70,
                                          right: 23,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 3, right: 4),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 10,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Text(
                                                    activities[index]['rating']
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 8,
                                                        color: Colors.black),
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
                    )
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
                            'Top Attractions :',
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
                        padding: const EdgeInsets.only(left: 30.0, bottom: 15),
                        child: Row(
                          children: List.generate(
                            locations.length,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Container(
                                    width: 200,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
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
                                      children: [
                                        SizedBox(
                                          width: 90,
                                          child: Padding(
                                            padding: EdgeInsets.all(9),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              child: Image.network(
                                                'http://localhost:5000${locations[index]['image']}',
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                                height: double.infinity,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 100,
                                                child: Text(
                                                  locations[index]['name'],
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontFamily:
                                                          'Times New Roman',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 100,
                                                child: Text(
                                                  locations[index]
                                                      ['description'],
                                                  style: TextStyle(
                                                    fontSize: 9,
                                                    fontFamily:
                                                        'Times New Roman',
                                                    color: Color.fromARGB(
                                                        255, 122, 122, 122),
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
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
              ],
            ),
            Visibility(
              visible: enteredWord.isEmpty ? false : true,
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 78),
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
                      _filteredLocation.length,
                      (index) => GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/location',
                            arguments: {'data': _filteredLocation[index]},
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 15.0),
                          child: Text(
                            _filteredLocation[index]['region'],
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

Future<List<dynamic>> getLocationType() async {
  try {
    final response =
        await http.get(Uri.parse('http://localhost:5000/api/v1/locationtype'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<dynamic> locationTypes = data['data']['locationTypes'];
      return locationTypes;
    } else {
      return []; // Return an empty list if response status code is not 200
    }
  } catch (e) {
    return []; // Return an empty lidst if an error occurs
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

Future<List<dynamic>> getActivity() async {
  try {
    final response =
        await http.get(Uri.parse('http://localhost:5000/api/v1/activities'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<dynamic> activities = data['data']['activities'];
      return activities;
    } else {
      return []; // Return an empty list if response status code is not 200
    }
  } catch (e) {
    print(e.toString());
    return []; // Return an empty list if an error occurs
  }
}
