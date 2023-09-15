import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body:infoWidget(),
    ));
  }

  Widget infoWidget() 
  {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Image.asset("assets/images/sample.jpg"),
    information1(text: "Sample text"),
    ],
    );
  }

  Container information1({required String text})
  {
    return Container(
      child: Text("
      "),
    );
  }
}
