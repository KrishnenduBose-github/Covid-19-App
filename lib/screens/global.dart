// ignore_for_file: unnecessary_new, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:covid19_app/models/global_summary.dart';
import 'package:covid19_app/screens/global_loading.dart';
import 'package:covid19_app/screens/global_statistics.dart';
import 'package:covid19_app/services/covid_services.dart';
import 'package:flutter/material.dart';

CovidService covidService = new CovidService();

class Global extends StatefulWidget {
  Global({Key? key}) : super(key: key);

  @override
  State<Global> createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  late Future<GlobalSummaryModel> summary;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    summary = covidService.getGlobalSummary();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Global Corona Virus cases",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      summary = covidService.getGlobalSummary();
                    });
                  },
                  child: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          FutureBuilder(
            future: summary,
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Center(
                  child: Text("Error occured"),
                );
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return globalLoading();
                default:
                  return snapshot.hasData
                      ? GlobalStatistics(snapshot.data as GlobalSummaryModel)
                      : Center(
                          child: Text("Empty"),
                        );
              }
            },
          ),
        ],
      ),
    ]);
  }
}
