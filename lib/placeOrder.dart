import 'package:flutter/material.dart';

class PlaceOrder extends StatefulWidget {
  @override
  _PlaceOrder createState() => _PlaceOrder();
}

//This file is basically if the order goes successful
//the user will be directed to a confirmation page
//This screen just says the transaction was good
//and more information about reservations will be comings
//Eventually we would like to add the ability to email
//Booking details to the user as a pdf
class _PlaceOrder extends State<PlaceOrder> {
  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context, false),
            ),
            title: Text('Order Placed')),
        body: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
          child: Center(
            child: Column(children: [
              Text(
                'Order Successful!',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
              ),
              Text(
                '',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.05),
              ),
              Text(
                  "Your reservation details will be emailed to you momentarily. We will also be sending you access codes to receive access codes to unlock your door",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
              Text(
                '',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.05),
              ),
              Center(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.075,
                    child: RaisedButton(
                        color: Colors.lightBlue,
                        elevation: 10.0,
                        child: Text("Return to Menu",
                            style: TextStyle(fontSize: 24)),
                        onPressed: () {
                          Navigator.popUntil(
                              context, (Route<dynamic> route) => route.isFirst);
                        })),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
