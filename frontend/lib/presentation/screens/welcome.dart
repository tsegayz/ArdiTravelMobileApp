// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:frontend/presentation/screens/home.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:math';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Color extractDominantColor(LinearGradient gradient) {
    return Color.fromARGB(
        255, 238, 255, 254); // Use the first color for simplicity
  }

  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                  width: 220,
                  child: Text(
                    'Explore your favourite journey',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(height: 70),
                Transform.rotate(
                  angle: -pi / 2,
                  child: SizedBox(
                    width: 150,
                    child: SwipeableButtonView(
                      buttonText: '',
                      buttonWidget: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromARGB(255, 62, 98, 99),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 17),
                          child: Transform.rotate(
                            angle: pi / 2,
                            child: Text(
                              'Go',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      activeColor: Color.fromARGB(78, 244, 255, 254),
                      isFinished: isFinished,
                      onWaitingProcess: () {
                        Future.delayed(Duration(seconds: 1), () {
                          setState(() {
                            isFinished = true;
                          });
                        });
                      },
                      onFinish: () async {
                        await Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade, child: Home()));
                        setState(() {
                          isFinished = false;
                        });
                      },
                    ),
                  ),
                ),
                // GestureDetector(
                //   onVerticalDragUpdate: (details) {
                //     setState(() {
                //       translateY += details.primaryDelta!;
                //       if (translateY < 0) {
                //         translateY = 0;
                //       }
                //       if (translateY >
                //           MediaQuery.of(context).size.height - 160) {
                //         translateY = MediaQuery.of(context).size.height - 160;
                //       }
                //     });
                //   },
                //   onVerticalDragEnd: (details) {
                //     if (translateY ==
                //         MediaQuery.of(context).size.height - 160) {
                //       Navigator.pushNamed(context, '/home');
                //     }
                //   },
                //   child: Container(
                //     height: 160,
                //     width: 75,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(50),
                //       gradient: LinearGradient(
                //         begin: Alignment.topCenter,
                //         end: Alignment.bottomCenter,
                //         colors: [
                //           Color.fromARGB(80, 238, 255, 254),
                //           Color(0xFF3A7D79),
                //         ],
                //       ),
                //     ),
                //     child: Stack(
                //       children: [
                //         Positioned(
                //           top: 30,
                //           left: 23,
                //           child: Icon(
                //             Icons.keyboard_arrow_up_rounded,
                //             size: 35,
                //             color: Color.fromARGB(151, 255, 255, 255),
                //           ),
                //         ),
                //         Positioned(
                //           top: 43,
                //           left: 19,
                //           child: Icon(
                //             Icons.keyboard_arrow_up_rounded,
                //             size: 42,
                //             color: Color.fromARGB(255, 255, 255, 255),
                //           ),
                //         ),
                //         Align(
                //           alignment: Alignment.bottomCenter,
                //           child: Transform.translate(
                //             offset: Offset(0, translateY),
                //             child: Container(
                //               margin: EdgeInsets.only(bottom: 14),
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(50),
                //                 color: Color.fromARGB(255, 62, 98, 99),
                //               ),
                //               child: Padding(
                //                 padding: const EdgeInsets.symmetric(
                //                     vertical: 15.0, horizontal: 17),
                //                 child: Text(
                //                   'Go',
                //                   style: TextStyle(
                //                     color: Colors.white,
                //                     fontSize: 16,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
