import 'package:covid19_app/screens/global_loading.dart';
import 'package:covid19_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class countryLoading extends StatelessWidget {
  const countryLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [loading(), loading(), loadingChartCard()],
    );
  }
}

Widget loadingInputCard() {
  return Card(
    elevation: 1,
    child: Container(
      height: 80,
      padding: EdgeInsets.all(24),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300] as Color,
        highlightColor: Colors.grey[100] as Color,
        child: Container(
          width: double.infinity,
          height: 30,
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget loadingChartCard() {
  return Card(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        height: 180,
        child: Shimmer.fromColors(
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.white,
                ))
              ],
            ),
            baseColor: grey1 as Color,
            highlightColor: grey2 as Color),
      ));
}
