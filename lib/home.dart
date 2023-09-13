import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_prediction_app/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //build function for main homepage, main page of the application
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          createSearcher(),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Text(
                    "Location Name",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.26),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.location_city_outlined),
                    color: Colors.green,
                  )
                ],
              ),
            ),
          ),
          weatherCard(),
        ],
      ),
    ));
  }

  Widget createSearcher() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 16, right: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: component_light,
          borderRadius: BorderRadius.circular(25),
        ),
        child: const TextField(
          // onChanged: (val) => runFilter(val),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search, color: tdBlack, size: 20),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            ),
            border: InputBorder.none,
            hintText: 'Search Location here',
            hintStyle: TextStyle(color: tdBlack),
          ),
        ),
      ),
    );
  }

  //Widget for weather prediction
  Card weatherCard() {
    return Card(
      color: component_light,
      elevation: 0.0,
      child: SizedBox(
        width: 300,
        height: 250,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset('assets/images/sunny.png')),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.08),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "28 °C",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
