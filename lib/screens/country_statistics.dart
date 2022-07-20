// ignore_for_file: unnecessary_new

import 'package:covid19_app/models/country_summary.dart';
import 'package:covid19_app/models/time_cases.dart';
import 'package:covid19_app/screens/charts.dart';
import 'package:covid19_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19_app/models/time_cases.dart';

class CountryStatistics extends StatelessWidget {
  List<CountrySummaryModel> countrysummary;

  CountryStatistics(@required this.countrysummary);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCard(
            "CONFIRMED",
            countrysummary[countrysummary.length - 1].confirmed,
            kConfirmedColor,
            "ACTIVE",
            countrysummary[countrysummary.length - 1].active,
            kActiveColor),
        buildCard(
            "RECOVERED",
            countrysummary[countrysummary.length - 1].recovered,
            kRecoveredColor,
            "DEATH",
            countrysummary[countrysummary.length - 1].death,
            kDeathColor),
        buildCardChart(countrysummary)
      ],
    );
  }
}

Widget buildCard(String lefttitle, int leftCount, Color leftcolor,
    String righttitle, int rightCount, Color rightcolor) {
  return Card(
    elevation: 1,
    color: Colors.white,
    child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(lefttitle,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                Expanded(child: Container()),
                Text(
                  "Total",
                  style: TextStyle(
                    color: leftcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(
                  leftCount
                      .toString()
                      .replaceAllMapped(reg, (match) => '${match[1]},'),
                  style: TextStyle(
                      color: leftcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(righttitle,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                Expanded(child: Container()),
                Text(
                  "Total",
                  style: TextStyle(
                    color: rightcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(
                  rightCount
                      .toString()
                      .replaceAllMapped(reg, (match) => '${match[1]},'),
                  style: TextStyle(
                      color: rightcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            ),
          ],
        )),
  );
}

Widget buildCardChart(List<CountrySummaryModel> summaryList) {
  return Card(
    elevation: 1,
    child: Container(
      height: 190,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Chart(_createData(summaryList), false),
    ),
  );
}

List<charts.Series<TimeSeriesCases, DateTime>> _createData(
    List<CountrySummaryModel> summaryList) {
  List<TimeSeriesCases> confirmedData = [];
  List<TimeSeriesCases> activeData = [];
  List<TimeSeriesCases> recoveredData = [];
  List<TimeSeriesCases> deathData = [];

  for (var item in summaryList) {
    print(item.date);
    confirmedData.add(TimeSeriesCases(item.date, item.confirmed));
    activeData.add(TimeSeriesCases(item.date, item.active));
    recoveredData.add(TimeSeriesCases(item.date, item.recovered));
    deathData.add(TimeSeriesCases(item.date, item.death));
  }

  return [
    new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Confirmed',
        data: confirmedData,
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kConfirmedColor)),
    new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Active',
        data: activeData,
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kActiveColor)),
    new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Recovered',
        data: recoveredData,
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kRecoveredColor)),
    new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Death',
        data: deathData,
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kDeathColor))
  ];
}
