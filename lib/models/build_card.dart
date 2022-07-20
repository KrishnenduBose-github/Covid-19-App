import 'package:covid19_app/utils/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildCard(String title, int totalCount, int todayCount, Color color) {
  return Card(
    elevation: 1,
    color: Colors.white,
    child: Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total",
                      style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                  Text(
                    totalCount
                        .toString()
                        .replaceAllMapped(reg, (match) => '${match[1]},'),
                    style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text("Today",
                    style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
                Text(
                  todayCount
                      .toString()
                      .replaceAllMapped(reg, (match) => '${match[1]},'),
                  style: TextStyle(
                      color: color, fontWeight: FontWeight.bold, fontSize: 20),
                )
              ])
            ],
          )
        ],
      ),
    ),
  );
}
