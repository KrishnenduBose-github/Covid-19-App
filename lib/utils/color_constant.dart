import 'package:flutter/material.dart';

Color kPrimaryColor = Color(0xFF166DE0);
Color kConfirmedColor = Color(0xFFFF1242);
Color kActiveColor = Color(0xFF017BFF);
Color kRecoveredColor = Color(0xFF29A746);
Color kDeathColor = Color(0xFF6D757D);
Color? grey1 = Colors.grey[300];
Color? grey2 = Colors.grey[100];

// ignore: prefer_const_constructors
LinearGradient kGradientShimmer = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  // ignore: prefer_const_literals_to_create_immutables
  colors: [
    grey1!,
    grey2!,
  ],
);
RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function mathFunc = (Match match) => '${match[1]}.' as String;
