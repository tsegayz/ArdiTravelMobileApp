// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class RestaurantBook extends StatefulWidget {
  RestaurantBook({super.key});

  @override
  State<RestaurantBook> createState() => _RestaurantBookState();
}

class _RestaurantBookState extends State<RestaurantBook> {
  String dropdownValue = 'one';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerTwo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.only(top: 16.0),
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
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Text(
                'Reservation',
                style: TextStyle(
                  fontFamily: 'lobster',
                  fontSize: 30,
                  color: Color.fromARGB(255, 173, 173, 173),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Time :',
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 15,
                    color: Color.fromARGB(255, 56, 56, 56),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 170,
                  height: 36,
                  child: TextFormField(
                    controller: _controllerTwo,
                    readOnly: true,
                    style: TextStyle(fontSize: 14),
                    onTap: () async {
                      final TimeOfDay? timeOfDay = await showTimePicker(
                        context: context,
                        initialTime: selectedTime,
                      );
                      if (timeOfDay != null) {
                        setState(() {
                          selectedTime = timeOfDay;
                          String period =
                              selectedTime.period == DayPeriod.am ? 'AM' : 'PM';
                          _controllerTwo.text =
                              '${selectedTime.hourOfPeriod}:${selectedTime.minute} $period';
                        });
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'mm/dd/yy',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 197, 197, 197),
                        fontFamily: 'Times New Roman',
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(
                        Icons.timer_sharp,
                        color: Color.fromARGB(255, 146, 146, 146),
                        size: 18,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 224, 224, 224),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 224, 224, 224),
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(62, 255, 255, 255),
                      contentPadding: EdgeInsets.symmetric(horizontal: 17),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Date :',
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 15,
                    color: Color.fromARGB(255, 56, 56, 56),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 170,
                  height: 36,
                  child: TextFormField(
                    controller: _controller,
                    readOnly: true,
                    style: TextStyle(fontSize: 14),
                    onTap: () async {
                      final DateTime? dateTime = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2500),
                        initialDate: selectedDate,
                      );
                      if (dateTime != null) {
                        setState(() {
                          selectedDate = dateTime;
                          _controller.text =
                              '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}';
                        });
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'mm/dd/yy',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 197, 197, 197),
                        fontFamily: 'Times New Roman',
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(
                        Icons.calendar_month_rounded,
                        color: Color.fromARGB(255, 151, 151, 151),
                        size: 18,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 224, 224, 224),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 224, 224, 224),
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(62, 255, 255, 255),
                      contentPadding: EdgeInsets.symmetric(horizontal: 17),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Name :',
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 15,
                    color: Color.fromARGB(255, 56, 56, 56),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 170,
                  height: 36,
                  child: TextFormField(
                    onChanged: (value) {},
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      labelText: 'name',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 197, 197, 197),
                        fontSize: 14,
                        fontFamily: 'Times New Roman',
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 224, 224, 224),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 224, 224, 224),
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(62, 255, 255, 255),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Phone number :',
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 15,
                    color: Color.fromARGB(255, 56, 56, 56),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 170,
                  height: 36,
                  child: TextFormField(
                    onChanged: (value) {},
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      labelText: '+251-987-879-977',
                      labelStyle: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 197, 197, 197),
                        fontFamily: 'Times New Roman',
                      ),
                      prefixIcon: Icon(Icons.phone,
                          color: Color.fromARGB(255, 177, 177, 177), size: 18),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 224, 224, 224),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 224, 224, 224),
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(62, 255, 255, 255),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF2A4244),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  child: Text(
                    'Book now',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Times New Roman',
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
