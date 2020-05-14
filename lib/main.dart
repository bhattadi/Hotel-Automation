// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(HotelAutomation());

class HotelAutomation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Automation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Login')
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title});
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 26);

  @override
  Widget build(BuildContext context)
  {
    final userNameField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Username',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))));
    
    final passwordField = TextField(
      obscureText: true,
       style: style, 
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))));

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30),
      color: Colors.lightBlue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: (){},
        child: Text('Login',
                    textAlign: TextAlign.center,
                    style: style.copyWith(color: Colors.white,
                    fontWeight: FontWeight.bold))));

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 75,
                  child: Text('BrownBois',
                              style: TextStyle(fontSize: 48,
                                                color: Colors.blue,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold)
                  )
                ),
                SizedBox(
                  height: 100,
                  child: Image.asset(
                    'assets/data.jpg',
                    fit: BoxFit.contain,
                  ),
                  // child: Text('BrownWounded',
                  //             style: TextStyle(fontSize: 44,
                  //                               color: Colors.blue,
                  //                               fontStyle: FontStyle.italic,
                  //                               fontWeight: FontWeight.bold),
                  //             ),
                          
                ),
                SizedBox(height: 45),
                userNameField, 
                SizedBox(height: 25),
                passwordField,
                SizedBox(height: 35),
                loginButton,
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    ); 
  }
}