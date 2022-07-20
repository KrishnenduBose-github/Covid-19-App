import 'package:covid19_app/models/navigation_switcher.dart';
import 'package:covid19_app/screens/country_screen.dart';
import 'package:covid19_app/screens/home.dart';
import 'package:covid19_app/screens/slot.dart';
import 'package:covid19_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:covid19_app/utils/navigation_option.dart';

import 'global.dart';

enum NavigationStatus {
  GLOBAL,
  COUNTRY,
  SLOT,
  HOME,
}

class Tracker extends StatefulWidget {
  Tracker({Key? key}) : super(key: key);

  @override
  State<Tracker> createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  NavigationStatus navigationStatus = NavigationStatus.GLOBAL;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return navigationStatus == NavigationStatus.HOME
        ? HomeScreen()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              title: const Text("COVID-19 TRACKER"),
              elevation: 0,
              centerTitle: true,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        )),
                    // ignore: prefer_const_constructors
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: navigationStatus == NavigationStatus.GLOBAL
                          ? Global()
                          : navigationStatus == NavigationStatus.COUNTRY
                              ? Country()
                              : Slot(),
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NavigationOption(
                          "Home", navigationStatus == NavigationStatus.HOME,
                          () {
                        setState(() {
                          navigationStatus = NavigationStatus.HOME;
                        });
                      }),
                      NavigationOption(
                          "Global", navigationStatus == NavigationStatus.GLOBAL,
                          () {
                        setState(() {
                          navigationStatus = NavigationStatus.GLOBAL;
                        });
                      }),
                      NavigationOption("Country",
                          navigationStatus == NavigationStatus.COUNTRY, () {
                        setState(() {
                          navigationStatus = NavigationStatus.COUNTRY;
                        });
                      }),
                      NavigationOption(
                          "Slot", navigationStatus == NavigationStatus.SLOT,
                          () {
                        setState(() {
                          navigationStatus = NavigationStatus.SLOT;
                        });
                      }),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
