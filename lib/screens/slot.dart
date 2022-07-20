// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:covid19_app/screens/show_slot.dart';
import 'package:covid19_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Slot extends StatefulWidget {
  Slot({Key? key}) : super(key: key);

  @override
  State<Slot> createState() => _SlotState();
}

class _SlotState extends State<Slot> {
  //-----------------------------------
  TextEditingController pinController = new TextEditingController();
  TextEditingController dayController = new TextEditingController();
  String dropDownValue = "01";
  List slots = [];
  bool changebutton = false;
  //----------------------------------
  fetchSlots() async {
    await http
        .get(Uri.parse(
            "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=" +
                pinController.text +
                "&date=" +
                dayController.text +
                "-" +
                dropDownValue +
                "-2022"))
        .then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        slots = result['sessions'];
        print(slots);
      });
      //Navigator.push(context, route);
    });
  }

  searchSlots() async {
    await Future.delayed(Duration(seconds: 1));
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => showSlot(slots)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Center(child: Text("Vaccination Slots")),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              TextFormField(
                onFieldSubmitted: (value) {
                  if (value.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("PIN-code cannot be empty")));
                  } else if (value.length < 6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("PIN-code not valid")));
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "PIN code cannot be empty";
                  } else if (value.length < 6) {
                    return "PIN code not valid";
                  }
                  return null;
                },
                controller: pinController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  hintText: "Enter PIN code",
                  hintStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 0)),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    //padding: EdgeInsets.all(10),
                    height: 80,
                    child: TextFormField(
                      onFieldSubmitted: (value) {
                        if (value.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Day cannot be empty")));
                        }
                      },
                      controller: dayController,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      decoration: InputDecoration(
                        hintText: "Enter Day",
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(width: 0)),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: EdgeInsets.all(20),
                      ),
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return "Day cannot be empty";
                        }
                        return null;
                      },
                    ),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: DropdownButton(
                          isExpanded: true,
                          value: dropDownValue,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          underline: Container(color: Colors.white, height: 2),
                          items: <String>[
                            '01',
                            '02',
                            '03',
                            '04',
                            '05',
                            '06',
                            '07',
                            '08',
                            '09',
                            '10',
                            '11',
                            '12'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              child: Text(
                                value,
                                //style: TextStyle(color: Colors.white),
                              ),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue = newValue as String;
                            });
                          }))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  fetchSlots();
                  if (slots.isNotEmpty) {
                    setState(() {
                      changebutton = true;
                    });
                  }
                  if (slots.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("No slots available")));
                  } else {
                    searchSlots();
                  }
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 50,
                  width: changebutton ? 50 : 140,
                  alignment: Alignment.center,
                  child: changebutton
                      ? Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                      : Text(
                          "Search",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                  decoration: BoxDecoration(
                      color: changebutton ? Colors.green : Colors.white,
                      //shape: changebutton ? BoxShape.circle : BoxShape.rectangle,
                      borderRadius:
                          BorderRadius.circular(changebutton ? 50 : 8)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
