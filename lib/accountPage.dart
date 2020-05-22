import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutterapp/authentication.dart';
import 'account.dart';
import 'dart:async';

class AccountPage extends StatefulWidget {
  AccountPage({Key key, this.auth, this.userId, this.logoutCallback})
    : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _AccountPage createState() => _AccountPage();
}

//Declared Controller Variables that will hold values
//that the user will enter in a textfield
final _firstName = TextEditingController();
final _lastName = TextEditingController();
final _emailAddress = TextEditingController();
final _phoneNumber = TextEditingController();
final _creditCardNumber = TextEditingController();

//This class aims to lay the a form styled application
//Where the user is prompted to enter information in
//empty textboxes where information is layed in a row
//with the text on the left and textfield on the right
class _AccountPage extends State<AccountPage> {
  Account _account;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<Event> _onAccountChangedSubscription;
  Query _accountQuery;

  @override
  void initState(){
    super.initState();
    _accountQuery = _database.reference().child("account").orderByChild("userId").equalTo(widget.userId);
    _onAccountChangedSubscription = _accountQuery.onChildChanged.listen(onEntryChanged);
  }

  @override
  void dispose() {
    _onAccountChangedSubscription.cancel();
    super.dispose();
  }

  onEntryChanged(Event event) {
    setState(() {
      _account = Account.fromSnapshot(event.snapshot);
    });
  }

  addAccountInfo(Account account) {    
      _database.reference().child("account").child(widget.userId).set(account.toJson());
  }

  updateAccountInfo(String firstName, String lastName, String email, String phoneNum, String creditCard) {
    _account.firstName = firstName;
    _account.lastName = lastName;
    _account.email = email;
    _account.phoneNumber = phoneNum;
    _account.creditCardInfo = creditCard;

    if(_account != null) {
      _database.reference().child("account").child(widget.userId).update(_account.toJson());
    }
  }

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    double spacing = 20;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context, false),
          ),
          title: Text('Confirm Booking'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
                child: Center(
                    child: Text(
                  'Account Information',
                  style: TextStyle(fontSize: 32),
                ))),
            Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'First Name: ',
                        style: TextStyle(fontSize: 20),
                      ),

                      //This container is the format of the text field that the user
                      //will put their data into and the app will save this info
                      //in the controller variables defined above
                      Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: TextField(
                            controller: _firstName,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 0, 0, 0),
                                border: OutlineInputBorder(),
                                hintText: 'Enter Name'),
                          )),
                    ],
                  ),
                  Text(
                    '',
                    style: TextStyle(fontSize: spacing),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Last Name: ',
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: TextField(
                            controller: _lastName,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 0, 0, 0),
                                border: OutlineInputBorder(),
                                hintText: 'Enter Name'),
                          )),
                    ],
                  ),
                  Text(
                    '',
                    style: TextStyle(fontSize: spacing),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Phone Number: ',
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: TextField(
                            controller: _phoneNumber,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 0, 0, 0),
                                border: OutlineInputBorder(),
                                hintText: 'Enter Phone Number'),
                          )),
                    ],
                  ),
                  Text(
                    '',
                    style: TextStyle(fontSize: spacing),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Email Address: ',
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: TextField(
                            controller: _emailAddress,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 0, 0, 0),
                                border: OutlineInputBorder(),
                                hintText: 'Enter Email'),
                          )),
                    ],
                  ),
                  Text(
                    '',
                    style: TextStyle(fontSize: spacing),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Credit Card: ',
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: TextField(
                            controller: _creditCardNumber,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 0, 0, 0),
                                border: OutlineInputBorder(),
                                hintText: 'Enter Credit Card'),
                          )),
                    ],
                  ),
                  Text(
                    '',
                    style: TextStyle(fontSize: 36),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: RaisedButton(
                          color: Colors.lightBlue,
                          elevation: 10.0,
                          child: Text("Create Account",
                              style: TextStyle(fontSize: 24)),
                          onPressed: () {
                              _account = Account(widget.userId, _firstName.text.toString(), _lastName.text.toString(), 
                                                    _emailAddress.text.toString(), _phoneNumber.text.toString(), _creditCardNumber.text.toString());
                              addAccountInfo(_account);
                        }
                      )
                    ),
                  Text(
                    '',
                    style: TextStyle(fontSize: 36),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: RaisedButton(
                          color: Colors.lightBlue,
                          elevation: 10.0,
                          child: Text("Update Account",
                              style: TextStyle(fontSize: 24)),
                          onPressed: () {
                              updateAccountInfo(_firstName.text.toString(), _lastName.text.toString(), 
                                                _emailAddress.text.toString(), _phoneNumber.text.toString(), _creditCardNumber.text.toString());
                        }
                      )
                    ),
                    Text(
                    '',
                    style: TextStyle(fontSize: 36),
                  ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: RaisedButton(
                          color: Colors.lightBlue,
                          elevation: 10.0,
                          child: Text("Sign Out",
                              style: TextStyle(fontSize: 24)),
                          onPressed: () {
                            signOut();
                        }
                      )
                    ),
                 ]
               )
             )
            ]
          ),
        ),
      ),
    );
  }
}

//Function to get the first name in a different file
String getFirstName() {
  return _firstName.text.toString();
}

//Function to get the last name in a different file
String getLastName() {
  return _lastName.text.toString();
}

//Function to get the phone number in a different file
String getPhoneNumber() {
  return _phoneNumber.text.toString();
}

//Function to get the email address in a different file
String getEmailAddress() {
  return _emailAddress.text.toString();
}

//Get the credit card info in another file
String getCreditCard() {
  return _creditCardNumber.text.toString();
}
