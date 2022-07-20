// ignore_for_file: prefer_const_constructors_in_immutables, invalid_required_positional_param

import 'package:covid19_app/utils/color_constant.dart';
import 'package:flutter/material.dart';

class NavigationOption extends StatelessWidget {
  final String title;
  final bool selected;
  final Function() onselected;

  // ignore: use_key_in_widget_constructors
  NavigationOption(
      @required this.title, @required this.selected, @required this.onselected);

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onselected(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                color: selected ? kPrimaryColor : Colors.grey[400],
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          selected
              ? Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
