import 'package:flutter/material.dart';
import 'reviewDetails.dart';
import 'package:firebase_database/firebase_database.dart';


class ConfirmBooking extends StatefulWidget {

  ConfirmBooking({Key key, this.userId})
      : super(key: key);
  final String userId;
  @override
  _ConfirmBooking createState() => _ConfirmBooking();
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
class _ConfirmBooking extends State<ConfirmBooking> {
  final FirebaseDatabase _database = FirebaseDatabase.instance;


  @override
  Widget build(BuildContext context) {


    void fillInPage() async {
      _emailAddress.text = (await _database.reference().child("account").child(widget.userId).child("email").once()).value;
      _firstName.text = (await _database.reference().child("account").child(widget.userId).child("firstName").once()).value;
      _lastName.text = (await _database.reference().child("account").child(widget.userId).child("lastName").once()).value;
      _creditCardNumber.text = (await _database.reference().child("account").child(widget.userId).child("creditCardInfo").once()).value;
      _phoneNumber.text = (await _database.reference().child("account").child(widget.userId).child("phoneNumber").once()).value;
    }

    fillInPage();


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
                  'Contact Information',
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
                          child: Text("Place Order",
                              style: TextStyle(fontSize: 24)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReviewDetails(userId: widget.userId)),
                            );
                          })),
                ]))
          ]),
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
