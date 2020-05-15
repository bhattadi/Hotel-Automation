//The Menu Page after the user has logged in

import 'package:flutter/material.dart';

//The NextScreen class defines how to open 
//new pages given a chosen menu item
class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Menu';

    void chooseNextPage(String lab) {
      if (lab == "Book") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => bookingPage()),
        );
      } else if (lab == "Edit") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => editBookingPage()),
        );
      } else if (lab == "Settings") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => settingPage()),
        );
      }
    }

    //Build the physical icon button for menu activities
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
          _buildIcon(Colors.blue, Icons.credit_card, "Book"),
          _buildIcon(Colors.blue, Icons.edit, "Edit"),
        ],
      ),
    );

    Widget bottomRow = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIcon(Colors.blue, Icons.help, "Unknown"),
          _buildIcon(Colors.blue, Icons.settings, "Settings"),
        ],
      ),
    );

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(title),
          leading: IconButton(
            icon:Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
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
