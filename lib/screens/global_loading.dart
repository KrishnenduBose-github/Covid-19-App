import 'package:covid19_app/utils/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class globalLoading extends StatelessWidget {
  const globalLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [loading(), loading(), loading(), loading()],
    );
  }
}

Widget loading() {
  return Card(
    elevation: 1,
    child: Container(
      height: 100,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Shimmer.fromColors(
            child: Column(
              children: [
                Container(
                  height: 20,
                  width: 100,
                  color: Colors.white,
                ),
                Expanded(child: Container()),
                Container(
                  height: 15,
                  width: double.infinity,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 30,
                  width: double.infinity,
                  color: Colors.white,
                ),
              ],
            ),
            baseColor: grey1!,
            highlightColor: grey2!),
      ),
    ),
  );
}
