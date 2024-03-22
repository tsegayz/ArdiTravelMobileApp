// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:share/share.dart';

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

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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

  int selectedIndex = 0; // Track the selected index for category/regin

  int selected = 4; // Track the selected index for bottom nav bar

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 60,
                  left: 130,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/user.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Center(
                          child: Text(
                        'Username',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 2, 6, 27),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times New Roman',
                        ),
                      )),
                      Text(
                        'All the details of user',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 1, 10, 22),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 64, right: 5, top: 270),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 290,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 290,
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade300),
                                ),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(25, 18, 25, 8),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.person_4,
                                        color: Color.fromARGB(255, 88, 88, 88),
                                        size: 17,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Account detail: email',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(255, 2, 6, 27),
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade300),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 18, 25, 8),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Color.fromARGB(255, 88, 88, 88),
                                      size: 17,
                                    ),
                                    Text(
                                      'My Address',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 290,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Center(
                                            child: Text(
                                              'Lyrical Application',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                          content: Text(
                                              "Lorem dolor sit amet, consectetur adipiscing elit. Pellentesque vel mi ut elit tempor aliquam eget eget enim. Proin cursus eleifend pretium. Aliquam cursus "),
                                        ));
                              },
                              child: Container(
                                width: 290,
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey.shade300),
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(25, 18, 25, 8),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.info,
                                        color: Color.fromARGB(255, 88, 88, 88),
                                        size: 17,
                                      ),
                                      Text(
                                        'About us',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 290,
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade300),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 18, 25, 8),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_rate_outlined,
                                      color: Color.fromARGB(255, 88, 88, 88),
                                      size: 17,
                                    ),
                                    Text(
                                      'Rate App',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Share.share(
                                    'Check out this amazing app: https://example.com');
                              },
                              child: Container(
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey.shade300),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(25, 18, 25, 8),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.share_outlined,
                                        color: Color.fromARGB(255, 88, 88, 88),
                                        size: 17,
                                      ),
                                      Text(
                                        'Share App',
                                        style: TextStyle(
                                          fontSize: 16,
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
                    ],
                  ),
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
