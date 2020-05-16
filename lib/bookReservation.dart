import 'package:flutter/material.dart';
import 'placeOrder.dart';

class ConfirmBooking extends StatefulWidget {
  @override
  _ConfirmBooking createState() => _ConfirmBooking();
}

class _ConfirmBooking extends State<ConfirmBooking>
{
  @override
  
  Widget build(BuildContext context) {
    double spacing = 20;
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Booking'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
            child: Center(
                  child: Text('Reservation Details',
                                style: TextStyle(fontSize: 36),)
          )
        ),
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('First Name: ',
                          style: TextStyle(fontSize: 20),),   
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(50, 0, 50, 20),
                          border: OutlineInputBorder(),
                          hintText: 'Enter Name'
                        ),
                      )
                    ),   
                  ],
                ),
                Text('', style: TextStyle(fontSize: spacing),),
                Row(
                  children: [
                    Text('Last Name: ',
                          style: TextStyle(fontSize: 20),),   
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(50, 0, 50, 20),
                          border: OutlineInputBorder(),
                          hintText: 'Enter Name'
                        ),
                      )
                    ),   
                  ],
                ),
                Text('', style: TextStyle(fontSize: spacing),),
                Row(
                  children: [
                    Text('Phone Number: ',
                          style: TextStyle(fontSize: 20),),   
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(22, 0, 20, 20),
                          border: OutlineInputBorder(),
                          hintText: 'Enter Phone Number'
                        ),
                      )
                    ),   
                  ],
                ),
                Text('', style: TextStyle(fontSize: spacing),),
                Row(
                  children: [
                    Text('Email Address: ',
                          style: TextStyle(fontSize: 20),),   
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(50, 0, 50, 20),
                          border: OutlineInputBorder(),
                          hintText: 'Enter Email'
                        ),
                      )
                    ),   
                  ],
                ),
                Text('', style: TextStyle(fontSize: spacing),),
                Row(
                  children: [
                    Text('Credit Card: ',
                          style: TextStyle(fontSize: 20),),   
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(35, 0, 30, 20),
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
                                builder: (context) => PlaceOrder()),
                          );
                        })),
              ]
            )
          )
        ]
      ),
    );
  }
}
