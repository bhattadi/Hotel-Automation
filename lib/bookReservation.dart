import 'package:flutter/material.dart';
import 'reviewDetails.dart';

class ConfirmBooking extends StatefulWidget {
  @override
  _ConfirmBooking createState() => _ConfirmBooking();
}

final _firstName = TextEditingController();
final _lastName = TextEditingController();
final _emailAddress = TextEditingController();
final _phoneNumber = TextEditingController();
final _creditCardNumber = TextEditingController();

class _ConfirmBooking extends State<ConfirmBooking>
{
  @override
  Widget build(BuildContext context) {
    double spacing = 20;
    return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon:Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context, false),
          ),
        title: Text('Confirm Booking'),
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
            child: Center(
                  child: Text('Contact Information',
                                style: TextStyle(fontSize: 32),)
          )
        ),
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('First Name: ',
                          style: TextStyle(fontSize: 20),),   
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: TextField(
                        controller: _firstName,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          border: OutlineInputBorder(),
                          hintText: 'Enter Name'
                        ),
                      )
                    ),   
                  ],
                ),
                Text('', style: TextStyle(fontSize: spacing),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Last Name: ',
                          style: TextStyle(fontSize: 20),),   
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: TextField(
                        controller: _lastName,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          border: OutlineInputBorder(),
                          hintText: 'Enter Name'
                        ),
                      )
                    ),   
                  ],
                ),
                Text('', style: TextStyle(fontSize: spacing),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Phone Number: ',
                          style: TextStyle(fontSize: 20),),   
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: TextField(
                        controller: _phoneNumber,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          border: OutlineInputBorder(),
                          hintText: 'Enter Phone Number'
                        ),
                      )
                    ),   
                  ],
                ),
                Text('', style: TextStyle(fontSize: spacing),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Email Address: ',
                          style: TextStyle(fontSize: 20),),   
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: TextField(
                        controller: _emailAddress,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          border: OutlineInputBorder(),
                          hintText: 'Enter Email'
                        ),
                      )
                    ),   
                  ],
                ),
                Text('', style: TextStyle(fontSize: spacing),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Credit Card: ',
                          style: TextStyle(fontSize: 20),),   
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: TextField(
                        controller: _creditCardNumber,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          border: OutlineInputBorder(),
                          hintText: 'Enter Credit Card'
                        ),
                      )
                    ),   
                  ],
                ),
                Text('', style: TextStyle(fontSize: 36),),
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
                                builder: (context) => ReviewDetails()),
                          );
                        })),
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

String getFirstName()
{
  return _firstName.text.toString();
}

String getLastName()
{
  return _lastName.text.toString();
}

String getPhoneNumber()
{
  return _phoneNumber.text.toString();
}

String getEmailAddress()
{
  return _emailAddress.text.toString();
}

String getCreditCard()
{
  return _creditCardNumber.text.toString();
}