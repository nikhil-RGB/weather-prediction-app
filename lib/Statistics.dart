import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/map.png"),
          const SizedBox(
            height: 20,
          ),
          Image.asset("assets/images/graph.png"),
        ],
      ),
    );
  }
}
