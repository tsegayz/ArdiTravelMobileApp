// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  SignUp({super.key});

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'please enter a valid email';
    }
    return null;
  }

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
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromARGB(83, 0, 0, 0),
          ),
          
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 260),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            labelText: 'username',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontFamily: 'Times New Roman',
                            ),
                            prefixIcon: Icon(Icons.person, color: Colors.white,size: 18,),
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: Color.fromARGB(0, 255, 255, 255),
                              ),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(62, 255, 255, 255),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          validator: validateEmail,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontFamily: 'Times New Roman',
                            ),
                            prefixIcon: Icon(Icons.alternate_email_rounded, color: Colors.white,size: 18),
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: Color.fromARGB(0, 255, 255, 255),
                              ),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(62, 255, 255, 255),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          validator: (value) => value!.length < 8
                              ? 'password should be 8 characters'
                              : null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (value) {},
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontFamily: 'Times New Roman',
                            ),
                            prefixIcon: Icon(Icons.lock_open_rounded, color: Colors.white, size: 18),
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: Color.fromARGB(0, 255, 255, 255),
                              ),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(62, 255, 255, 255),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, '/home');
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 255, 255, 255),
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 10),
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: Color.fromARGB(255, 7, 25, 46),
                                fontFamily: 'Times New Roman',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 65),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {Navigator.pushNamed(context, '/signIn');},
                        child: Text(
                          'Sign in to account',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Times New Roman',
                          ),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          '|',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Next content',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Times New Roman',
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 60,
            right: 40,
            child: TextButton(
              onPressed: () {Navigator.pushNamed(context, '/home');},
              child: Text(
                'Skip',
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 16,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
