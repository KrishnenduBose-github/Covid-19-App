import 'package:covid19_app/utils/color_constant.dart';
import 'package:flutter/material.dart';

class showSlot extends StatefulWidget {
  late final List slots;
  showSlot(@required this.slots);

  @override
  State<showSlot> createState() => _showSlotState();
}

class _showSlotState extends State<showSlot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text("Available Slots"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[200]),
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: widget.slots.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                height: 450,
                child: Column(
                  children: [
                    Text(
                      'Center ID - ' +
                          widget.slots[index]['center_id'].toString(),
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Center Name - ' + widget.slots[index]['name'].toString(),
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Center Address - ' +
                          widget.slots[index]['address'].toString(),
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(),
                    Text(
                      'Vaccine Name - ' +
                          widget.slots[index]['vaccine'].toString(),
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(),
                    Text(
                      'Slots - ' + widget.slots[index]['slots'].toString(),
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
