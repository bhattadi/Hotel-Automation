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
        home: MyHomePage(title: 'Flutter Login'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myControllerUsername = TextEditingController();
  final myControllerPassword = TextEditingController();
  final String _tempUserName = "BrownBoi";
  final String _tempPassword = "123";
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 26);

  @override
  void dispose() {
    myControllerPassword.dispose();
    myControllerUsername.dispose();
    super.dispose();
  }

  void validate() {}

  Widget build(BuildContext context) {
    final userNameField = TextField(
        controller: myControllerUsername,
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: 'Username',
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32))));

    final passwordField = TextField(
        controller: myControllerPassword,
        obscureText: true,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: 'Password',
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32))));

    final loginButton = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30),
        color: Colors.lightBlue,
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            onPressed: () {
              setState(() {
                //if(myControllerUsername.text == _tempUserName && myControllerPassword == _tempPassword) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextScreen()),
                );
                //}
              });
            },
            child: Text('Login',
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold))));

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
                    height: 60,
                    child: Text('BrownBois',
                        style: TextStyle(
                            fontSize: 48,
                            color: Colors.blue,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold))),
                SizedBox(
                  height: 75,
                  child: Image.asset(
                    'assets/checkin.png',
                    fit: BoxFit.contain,
                  ),
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

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Menu';

    void chooseNextPage(String lab) {
      if(lab == "Book new reservation") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => bookingPage()),
        );
      }
      else if(lab == "Edit reservation") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => editBookingPage()),
        );
      }
      else if(lab == "Settings") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => settingPage()),
        );
      }

    }

    Column _buildIcon(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(icon),
            color: Colors.blue,
            iconSize: 40,
            onPressed: () {
              chooseNextPage(label);
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          )
        ],
      );
    }

    Widget topRow = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIcon(Colors.blue, Icons.credit_card, "Book new reservation"),
          _buildIcon(Colors.blue, Icons.edit, "Edit reservation"),
        ],
      ),
    );

    Widget bottomRow = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIcon(Colors.blue, Icons.help, "Unknow, TBD"),
          _buildIcon(Colors.blue, Icons.settings, "Settings"),
        ],
      ),
    );

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
//          actions: <Widget>[
//            Center(
//              child:Container(
//                child:IconButton(
//                icon: Icon(Icons.arrow_back), onPressed: (){},
//                ),
//                alignment: Alignment(0,0),
//              ),
//            ),
//          ],
        ),
        body: Container(
          margin: EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              topRow,
              bottomRow,
            ],
          ),
        ),
      ),
    );
  }
}

//class Body extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Align(
//      alignment: Alignment.bottomCenter,
//      child: Column(
//
//      ),
//    );
//  }
//}

class bookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class editBookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class settingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
