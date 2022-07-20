import 'package:covid19_app/utils/color_constant.dart';
import 'package:flutter/material.dart';

Widget header(BuildContext context) {
  return Container(
    height: 250.0,
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Covid-19",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: 40.0,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                    child: Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                )),
              )
            ],
          ),
        ),
        Text(
          "Are you feeling sick?",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
              "If you feel sick with any of covid-19 symptoms please call or SMS us immediately for help.",
              style:
                  TextStyle(fontSize: 15.0, color: Colors.white, height: 1.5)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton.icon(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  color: Color(0XFFFF4D58),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  label: Text(
                    "Call Now",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Not available")));
                  },
                  icon: Icon(
                    Icons.phone,
                    color: Colors.white,
                  )),
              FlatButton.icon(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  color: Color(0XFF4D79FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  label: Text(
                    "Send SMS",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Not available")));
                  },
                  icon: Icon(
                    Icons.chat_bubble,
                    color: Colors.white,
                  ))
            ],
          ),
        )
      ],
    ),
  );
}
