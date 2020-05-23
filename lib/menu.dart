//The Menu Page after the user has logged in

import 'package:flutter/material.dart';
import 'booking.dart';
import 'package:flutterapp/authentication.dart';
import 'accountPage.dart';
import 'editReservation.dart';
import 'settings.dart';

//The NextScreen class defines how to open
//new pages given a chosen menu item
class Menu extends StatefulWidget {
  Menu({Key key, this.auth, this.userId, this.logoutCallback, this.loginCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final VoidCallback loginCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _Menu();
}

class _Menu extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    final title = 'Menu';

    void chooseNextPage(String lab) {
      //If the user clicks on book the open the book Page
      if (lab == "Book") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookingPage(userId: widget.userId)),
        );
      }

      //If the user clicks on edit button to open Edit Page
      else if (lab == "Edit") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditBookingPage()),
        );
      }

      //If the user clicks on settings button to open Settings Page
      else if (lab == "Settings") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingPage()),
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
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle),
              iconSize: 30,
              onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AccountPage(userId: widget.userId, auth: widget.auth, logoutCallback: widget.logoutCallback)),
              ),
            )
          ],
          automaticallyImplyLeading: true,
          title: Text(title),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              topRow,
              Text(
                '',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.1),
              ),
              bottomRow,
              Text(
                '',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.1),
              ),
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
