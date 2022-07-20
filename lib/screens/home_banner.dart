import 'package:flutter/material.dart';

Widget banner(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 25.0),
    height: 160.0,
    child: Stack(children: <Widget>[
      Container(
          margin: EdgeInsets.all(10.0),
          height: 140,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0XFFAEA1E5), Color(0XFF56549E)]),
              borderRadius: BorderRadius.circular(18.0)),
          child: Container(
            margin: EdgeInsets.only(left: 130.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, bottom: 5.0),
                    child: Text("Do your own test",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 20.0),
                    child: Text(
                      "Follow the instructions to do your own test.",
                      style: TextStyle(
                          fontSize: 16.0, height: 1.3, color: Colors.white),
                    ),
                  )
                ]),
          )),
      Positioned(
        child: Image(
          image: AssetImage("assets/lady.png"),
          height: 120.0,
        ),
        bottom: 20.0,
        left: 20.0,
      )
    ]),
  );
}
