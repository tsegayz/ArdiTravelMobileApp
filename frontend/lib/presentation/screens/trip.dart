// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
// ignore_for_file: use_key_in_widget_constructors

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

class BottomBar {
  final IconData icon;
  final String title;

  BottomBar({required this.icon, required this.title});
}

class Trip extends StatefulWidget {
  @override
  State<Trip> createState() => _TripState();
}

class _TripState extends State<Trip> {
  final List<Attraction> attractions = [
    Attraction(
        img: 'assets/welcome.jpg',
        title: 'Abay fountain',
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

  final List<BottomBar> bars = [
    BottomBar(icon: Icons.home_rounded, title: 'Home'),
    BottomBar(icon: Icons.album_outlined, title: 'Artists'),
    BottomBar(icon: Icons.music_note_rounded, title: 'Songs'),
    BottomBar(icon: Icons.album_outlined, title: 'Albums'),
    BottomBar(icon: Icons.person_outline, title: 'Account'),
  ];

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
                        attractions.length,
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
                                    Image.asset(
                                      attractions[index].img,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                    Container(
                                      color: Color.fromARGB(88, 0, 0, 0),
                                    ),
                                    Positioned(
                                      top: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 24.0, top: 14),
                                        child: SizedBox(
                                          width: 100,
                                          child: Text(
                                            attractions[index].title,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'lobster',
                                                color: Colors.white),
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
                                          color: Color.fromARGB(
                                              117, 255, 255, 255),
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
                                                      'Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, ',
                                                      style: TextStyle(
                                                          fontSize: 8,
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
                        attractions.length,
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
                                          child: Image.asset(
                                            attractions[index].img,
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
                                                width: 100,
                                                child: Text(
                                                  attractions[index].title,
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      fontFamily: 'cambo',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              // SizedBox(width: 45),
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
                                                    '${attractions[index].rating} rating',
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
                        for (int i = 0; i < attractions.length; i += 6)
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    height: 100,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, '/home');
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Stack(children: [
                                          Image.asset(
                                            attractions[i].img,
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
                                                attractions[i].title,
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
                                          Image.asset(
                                            attractions[i + 1].img,
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
                                                attractions[i + 1].title,
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
                                          Image.asset(
                                            attractions[i + 2].img,
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
                                                attractions[i + 2].title,
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
                                          Image.asset(
                                            attractions[i + 3].img,
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
                                                attractions[i + 3].title,
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
                                              Image.asset(
                                                attractions[i + 4].img,
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
                                                    attractions[i + 4].title,
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
                                              Image.asset(
                                                attractions[i + 5].img,
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
                                                    attractions[i + 5].title,
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
                        'Top Destinations :',
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
                        attractions.length,
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
                                          child: Image.asset(
                                            attractions[index].img,
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
                                            attractions[index].title,
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'Times New Roman',
                                                color: Colors.black),
                                          ),
                                          Text(
                                            'works : ',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontFamily: 'Times New Roman',
                                              color: Color.fromARGB(
                                                  255, 122, 122, 122),
                                            ),
                                          ),
                                          Text(
                                            'rating : ',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontFamily: 'Times New Roman',
                                              color: Color.fromARGB(
                                                  255, 122, 122, 122),
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
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 15),
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
              selectedIndex: selected,
              backgroundColor: Colors.transparent,
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined, color: Colors.white),
                  label: '',
                ),
                NavigationDestination(icon: Icon(Icons.camera_alt), label: ''),
                NavigationDestination(
                  icon: Icon(Icons.luggage_outlined, color: Colors.white),
                  label: '',
                ),
                NavigationDestination(
                    icon:
                        Icon(Icons.person_outline_rounded, color: Colors.white),
                    label: ''),
              ],
              onDestinationSelected: (index) {
                Navigator.of(context)
                    .pushNamed(['/home', '/trip', '/hotel', '/profile'][index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
