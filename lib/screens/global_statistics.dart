import 'package:covid19_app/models/build_card.dart';
import 'package:covid19_app/models/global_summary.dart';
import 'package:covid19_app/services/covid_services.dart';
import 'package:covid19_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:timeago_flutter/timeago_flutter.dart';

class GlobalStatistics extends StatelessWidget {
  GlobalSummaryModel summary;

  GlobalStatistics(@required this.summary);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCard("CONFIRMED", summary.totalConfirmed, summary.newConfirmed,
            kConfirmedColor),
        buildCard(
            "ACTIVE",
            summary.totalConfirmed -
                summary.totalRecovered -
                summary.totalDeaths,
            summary.newConfirmed - summary.newRecovered - summary.newDeaths,
            kActiveColor),
        buildCard("RECOVERED", summary.totalRecovered, summary.newRecovered,
            kRecoveredColor),
        buildCard("DEATH", summary.totalDeaths, summary.newDeaths, kDeathColor),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Text(
            "Statistics updated " + timeago.format(summary.date),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        )
      ],
    );
  }
}
