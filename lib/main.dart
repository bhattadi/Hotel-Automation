// The driver for the project

import 'package:flutter/material.dart';
import 'package:flutterapp/authentication.dart';
import 'package:flutterapp/root_page.dart';
import 'package:flutterapp/room.dart';

void main() => runApp(HotelAutomation());

class HotelAutomation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Call buildCalendar --> actually create database if the calandar object == null
    setUpCalendar();
    return new MaterialApp(
        title: 'Hotel Automation',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new RootPage(auth: new Auth()));
  }
}
