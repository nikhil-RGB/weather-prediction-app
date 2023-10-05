// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_prediction_app/Urgency.dart';
import 'package:weather_prediction_app/home.dart';
import 'package:weather_prediction_app/pages/InfoPage.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentPage = 0; //index for which page app is currently on.
  //List of screens in the app
  final List<Widget> screens = [
    Home(urgency: Urgency.HIGH),
    Center(
      child: Text("No implementation yet!"),
    ),
    InfoPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        currentIndex: _currentPage,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              // color: Colors.blue,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.analytics,
                // color: Colors.blue,
              ),
              label: 'Analytics'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.info,
                // color: Colors.blue,
              ),
              label: 'Info'),
        ],
      ),
    );
  }
}
