import 'package:flutter/material.dart';
import 'bookReservation.dart';
import 'placeOrder.dart';
import 'booking.dart';

class ReviewDetails extends StatefulWidget {
  @override
  _ReviewDetails createState() => _ReviewDetails();
}

class _ReviewDetails extends State<ReviewDetails>
{
  Widget build(BuildContext context)
  {
    double spacing = 56;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context, false),
          ),
          title: Text('Confirmation')
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
                child: Center(
                        child: Text('Review Details',
                                    style: TextStyle(fontSize: 36,
                                                      fontWeight: FontWeight.bold))
                )
              ),
              Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Name: ',
                              style: TextStyle(fontSize: 20,
                                                fontWeight: FontWeight.bold),),
                        Text(getFirstName() + ' ' + getLastName(),
                              style: TextStyle(fontSize: 20,))
                      ]
                    ),
                    Text('', style: TextStyle(fontSize: spacing),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Phone Number: ',
                              style: TextStyle(fontSize: 20,
                                                fontWeight: FontWeight.bold),),
                        Text(getPhoneNumber(),
                              style: TextStyle(fontSize: 20,))
                      ]
                    ),
                    Text('', style: TextStyle(fontSize: spacing),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Email Address: ',
                              style: TextStyle(fontSize: 20,
                                                fontWeight: FontWeight.bold),),
                        Text(getEmailAddress(),
                              style: TextStyle(fontSize: 20,))
                      ]
                    ),
                    Text('', style: TextStyle(fontSize: spacing),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Credit Card Info: ',
                              style: TextStyle(fontSize: 20,
                                                fontWeight: FontWeight.bold),),
                        Text(getCreditCard(),
                              style: TextStyle(fontSize: 20,))
                      ]
                    ),
                    Text('', style: TextStyle(fontSize: spacing),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Selected Dates: \n\n',
                              style: TextStyle(fontSize: 20,
                                              fontWeight: FontWeight.bold),),
                        Text(getDateRange(),
                              style: TextStyle(fontSize: 20,))
                      ]
                    ),
                    Text('', style: TextStyle(fontSize: spacing),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Check In Time: ',
                              style: TextStyle(fontSize: 20,  
                                              fontWeight: FontWeight.bold),),
                        Text(getCheckInTime(),
                              style: TextStyle(fontSize: 20,))
                      ]
                    ),
                    Text('', style: TextStyle(fontSize: spacing),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Check Out Time: ',
                              style: TextStyle(fontSize: 20,
                                              fontWeight: FontWeight.bold),),
                        Text(getCheckOutTime(),
                              style: TextStyle(fontSize: 20,))
                      ]
                    ),
                    Text('', style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.15),),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: RaisedButton(
                          color: Colors.lightBlue,
                          elevation: 10.0,
                          child: Text("Confirm Order",
                                      style: TextStyle(fontSize: 24)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlaceOrder()),
                          );
                        }
                      )
                    ),
                  ],
                )
              )
            ],
          )
        )
      )
    );
  }
}