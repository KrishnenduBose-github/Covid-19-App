import 'package:covid19_app/screens/home_banner.dart';
import 'package:covid19_app/screens/home_prevention.dart';
import 'package:covid19_app/screens/tracker.dart';
import 'package:covid19_app/utils/color_constant.dart';
import 'package:flutter/material.dart';

import 'home_header.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: ListView(
        children: [header(context), prevention(), banner(context)],
      ),
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }
}

Widget bottomNavigationBar(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    color: Colors.white,
    height: 50,
    width: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Container()),
        Container(
          height: 40.0,
          width: 70.0,
          decoration: BoxDecoration(
              color: Color(0XFF4C79FF),
              borderRadius: BorderRadius.circular(20.0)),
          child: Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        GestureDetector(
          child: Container(
            height: 40.0,
            width: 70.0,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: Icon(
              Icons.insert_chart,
              color: Color(0XFF999FbF),
            ),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Tracker()));
          },
        ),
        Expanded(child: Container())
      ],
    ),
  );
}
