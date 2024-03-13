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

  final List<BottomBar> bars = [
    BottomBar(icon: Icons.home_rounded, title: 'Home'),
    BottomBar(icon: Icons.album_outlined, title: 'Artists'),
    BottomBar(icon: Icons.music_note_rounded, title: 'Songs'),
    BottomBar(icon: Icons.album_outlined, title: 'Albums'),
    BottomBar(icon: Icons.person_outline, title: 'Account'),
  ];

  int selected = 0; // Track the selected index for bottom nav bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 30),
          child: Text(
            'Ardi Travel',
            style: TextStyle(
              fontFamily: 'lobster',
              fontSize: 26,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Container(
                width: 33,
                height: 35,
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
                child: Center(child: Icon(Icons.notifications_none_rounded))),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 40),
                width: 320,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 134, 134, 134).withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 0),
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
                            decoration: InputDecoration(
                              hintText: 'Discover a location.....',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 192, 192, 192),
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
              height: 38,
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 8.0, vertical: 7),
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
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
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
              height: 15,
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
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/location');
                              },
                              child: Container(
                                height: 280,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: SizedBox(
                                    width: 207,
                                    height: 275,
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          attractions[index]
                                              .img, // Use imgUrl instead of img
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          left: 10,
                                          child: Container(
                                            width: 180,
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 1, 8, 7),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    attractions[index].title,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily:
                                                            'Times New Roman',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    attractions[index].descr,
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      fontFamily:
                                                          'Times New Roman',
                                                      color: Color.fromARGB(
                                                          255, 122, 122, 122),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 53,
                                          right: 25,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 3,
                                                    right: 4,
                                                    bottom: 4),
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
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color.fromARGB(255, 255, 255, 255),
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
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(11),
                                        child: SizedBox(
                                          width: 75,
                                          height: 67,
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
                                          horizontal: 15.0, vertical: 26),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            attractions[index].title,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'Times New Roman',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            attractions[index].descr,
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
              height: 40,
              elevation: 0,
              backgroundColor: Colors.transparent,
              destinations: [
                NavigationDestination(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  label: '',
                ),
                NavigationDestination(
                    icon: Icon(Icons.camera_alt, color: Colors.white),
                    label: ''),
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
