//The login page for the user

import 'package:flutter/material.dart';
import 'menu.dart';

//Set the initial Stateless Widget
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

//Allow the user input to be saved via two strings
//Will eventually keep username/password combinations
//in a separate database and support forgot password
//and create an account functionalities
class _MyHomePageState extends State<MyHomePage> {
  final myControllerUsername = TextEditingController();
  final myControllerPassword = TextEditingController();

  //Temporary username and passwords for debugging
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

    //Define the username section
    final userNameField = TextField(
        controller: myControllerUsername,
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: 'Username',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32))));

    //Define the password section
    final passwordField = TextField(
        controller: myControllerPassword,
        obscureText: true,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: 'Password',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32))));

    //Define the blue login section
    final loginButton = Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(30),
        color: Colors.lightBlue,
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            onPressed: () {
              setState(() {
                //Add logic about whether an account exists in the database
                //The key will be a pair of a username and password
                //The value will be an Account object (Account will be its own class)
                if (myControllerUsername.text == _tempUserName &&
                    myControllerPassword.text == _tempPassword) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NextScreen()),
                  );
                }
              });
            },
            child: Text('Login',
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold))));

    //The scaffold should actually create the buttons and
    //appear on the center of the screen
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