import 'package:flutter/material.dart';

Widget prevention() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          "Prevention",
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              child: Column(
            children: <Widget>[
              Image(
                image: AssetImage("assets/prevention1.png"),
                height: 80.0,
                width: 80.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Avoid close\n contact',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              )
            ],
          )),
          Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/prevention2.png"),
                    height: 80.0,
                    width: 80.0,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Clean your\n hands often',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  )
                ],
              )),
          Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/prevention3.png"),
                    height: 80.0,
                    width: 80.0,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Wear a \n facemask',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  )
                ],
              ))
        ],
      )
    ],
  );
}
