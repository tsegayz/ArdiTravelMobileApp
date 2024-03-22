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

class RestaurantDetail extends StatefulWidget {
  @override
  State<RestaurantDetail> createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  final List<Category> countries = [
    Category(
      region: 'Breakfast',
      flag: Icons.table_restaurant_outlined,
    ),
    Category(
      region: 'Lunch',
      flag: Icons.lunch_dining_outlined,
    ),
    Category(
      region: 'Dinner',
      flag: Icons.dinner_dining_outlined,
    ),
  ];

  final List<Attraction> attractions = [
    Attraction(
        img: 'assets/welcome.jpg',
        title: 'Waterfall',
        descr: 'Lorem ipsum dolor',
        rating: '4.6'),
    Attraction(
        img: 'assets/asella.jpeg',
        title: 'Watterfall',
        descr: 'Lorem ipsum dolor ',
        rating: '4.6'),
    Attraction(
        img: 'assets/asella.jpeg',
        title: 'Watterfall',
        descr: 'Lorem ipsum dolor ',
        rating: '4.6'),
    Attraction(
        img: 'assets/asella.jpeg',
        title: 'Watterfall',
        descr: 'Lorem ipsum dolor ',
        rating: '4.6'),
    Attraction(
        img: 'assets/asella.jpeg',
        title: 'Watterfall',
        descr: 'Lorem ipsum dolor ',
        rating: '4.6'),
    Attraction(
        img: 'assets/asella.jpeg',
        title: 'Watterfall',
        descr: 'Lorem ipsum dolor ',
        rating: '4.6'),
  ];

  int selectedIndex = 0; // Track the selected index for category/regin

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
          padding: EdgeInsets.only(top: 17.0),
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
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 30),
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
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  width: 200,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 134, 134, 134).withOpacity(0.5),
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
                          size: 20,
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.only(bottom: 8.0, left: 3),
                            child: TextField(
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                hintText: 'search restaurant.....',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 192, 192, 192),
                                  fontSize: 13,
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
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: Row(
                        children: [
                          Icon(
                            Icons.table_restaurant_outlined,
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
              ],
            ),
            SizedBox(
              height: 38,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Text(
                'Category',
                style: TextStyle(
                  fontSize: 18,
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
                padding: const EdgeInsets.only(right: 32, left: 42),
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
                            EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
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
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 8.0,
                                  ),
                                  child: Container(
                                    width: 21,
                                    height: 21,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child:
                                        Icon(countries[index].flag, size: 15),
                                  ),
                                ),
                                Text(
                                  countries[index].region,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Times New Roman',
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.grey,
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
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0.0,
                        mainAxisSpacing: 30.0,
                      ),
                      itemCount: attractions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  attractions[index].img,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                            Container(
                              width: 145,
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    attractions[index].title,
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: 1,
                                      fontFamily: 'Times New Roman',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    attractions[index].descr,
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: 'Times New Roman',
                                      color: Color.fromARGB(255, 122, 122, 122),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$15 - \$25',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'cambo',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Icon(
                                        Icons.favorite_border_rounded,
                                        color: Colors.red,
                                        size: 16,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
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
                          EdgeInsets.symmetric(horizontal: 90),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/restaurantBook');
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
