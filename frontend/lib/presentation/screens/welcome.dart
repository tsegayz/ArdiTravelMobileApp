// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 40), () {
      Navigator.pushNamed(context, '/home');
    });
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          Navigator.pushNamed(context, '/home');
        },
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/welcome.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      'Start Your Journey swipe',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(230, 221, 221, 221),
                        fontFamily: 'cambo', 
                      ),
                    ),
                  ),
                  SizedBox(height: 190),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
