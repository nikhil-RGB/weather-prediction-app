// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_prediction_app/Urgency.dart';
import 'package:weather_prediction_app/colors.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'package:weather_prediction_app/pages/InfoPage.dart';

String selected = "TOD";

class Home extends StatefulWidget {
  final Urgency urgency;
  const Home({super.key, required this.urgency});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //These variables will be read from the API/data model we will read from
  String weather = "Sunny";
  String prediction = "   -     ";
  int temperature = 0;
  int accuracy = 89;
  Widget dateWidget = const SizedBox();
  int windspeed = 19;
  String direction = "45°NE";
  int humidity = 8;
  String cloud_cover = "medium";
  int rainfall = 0;
  int precipitation = 0;

  //build function for main homepage, main page of the application
  @override
  Widget build(BuildContext context) {
    if (selected != "TOD") {
      windspeed = 21;
      direction = "315°NE";
      humidity = 79;
      cloud_cover = "medium";
      rainfall = 72;
      precipitation = 91;
    } else {
      windspeed = 19;
      direction = "45°NE";
      humidity = 8;
      cloud_cover = "medium";
      rainfall = 0;
      precipitation = 0;
    }

    weather = selected == "TOD" ? "Sunny" : "Slightly Cloudy";
    dateWidget = selected == "TOD" ? currentDate(false) : currentDate(true);
    prediction = selected == "TOD" ? "  -    " : "~5-6 hours";
    Random random = Random();
    accuracy = random.nextInt(40) + 57;
    int n = 28;
    int m = 32;
    temperature = n + random.nextInt(m - n + 1);
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgStandard,
      body: SingleChildScrollView(
        child: Column(
          children: [
            createSearcher(),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    const Text(
                      "Potheri, Chennai",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
            const SizedBox(
              height: 12.5,
            ),
            dayButtons(),
            const SizedBox(height: 12.5),
            weatherCard(),
            const SizedBox(height: 25),
            createUrgencyCard(),
            const SizedBox(height: 25),
            additionalInformationCard(),
          ],
        ),
      ),
    ));
  }

  Widget createSearcher() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 16, right: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
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
  Container weatherCard() {
    return Container(
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        width: 360,
        height: 180,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset('assets/images/sunny.png')),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "$temperature °C",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.26),
                dateWidget,
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                predictionText(),
                SizedBox(width: MediaQuery.of(context).size.width * 0.12),
                Text(
                  "     $precipitation % \nprecipitation",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget predictionText() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            weather,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Text(
            "Expect rainfall in $prediction",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  //gets a current date string
  Widget currentDate(bool tomm) {
    DateTime now = DateTime.now();
    if (tomm) {
      now = now.add(Duration(days: 1));
    }
    String month = DateFormat.MMMM().format(now);
    if (tomm) {
      now.add(Duration(days: 1));
    }
    return SizedBox(
      height: 50,
      width: 30,
      child: Column(
        children: [
          Text(
            "${month}".substring(0, 3),
            style: TextStyle(fontSize: 13),
          ),
          Text(
            "${now.day}",
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }

  //button to change day-wise details.
  Widget dayButtons() {
    return SegmentedButton<String>(
      segments: const [
        ButtonSegment<String>(value: "TOD", label: Text("Today")),
        ButtonSegment<String>(value: "TOM", label: Text("Tomorrow")),
      ],
      selected: <String>{selected},
      onSelectionChanged: (Set<String> newSelection) {
        setState(() {
          selected = newSelection.first;
        });
      },
    );
  }

  Widget createUrgencyCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: widget.urgency.bg,
      ),
      child: SizedBox(
        height: 140,
        width: 360,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "⚠ Expected Cloud burst: ${widget.urgency.name} RISK",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.urgency == Urgency.LOW
                    ? "No Cloudburst expected soon"
                    : "A cloudburst is expected in 24 days",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoPage()),
                  );
                }, //Show user precautions: TODO
                child: Text(
                  "Necessary Precautions>>",
                  style: TextStyle(
                      color: Color(0xFFFAFF00),
                      fontSize: 12,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget additionalInformationCard() {
    return SizedBox(
      height: 140,
      width: 360,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              infoField("Wind Speed", "$windspeed kmph"),
              infoField("Cloud Cover", "$cloud_cover"),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              infoField("Wind Direction", "$direction"),
              infoField("Rainfall", "$rainfall mm"),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              infoField("Humidity", "$humidity%"),
              infoField("Precipitation", "$precipitation%")
            ],
          ),
        ],
      ),
    );
  }

  Widget infoField(String label, String info) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: RichText(
        text: TextSpan(
          text: '$label ',
          style: TextStyle(
            color: const Color(0xFF433B3B),
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          children: [
            TextSpan(
              text: '$info',
              style: TextStyle(
                color: const Color(0xFFA4A4A4),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
