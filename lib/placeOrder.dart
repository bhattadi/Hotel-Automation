import 'package:flutter/material.dart';

class PlaceOrder extends StatefulWidget {
  @override
  _PlaceOrder createState() => _PlaceOrder();
  }

class _PlaceOrder extends State<PlaceOrder>
{
  @override
  Widget build(BuildContext buildContext){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context, false),
            ),
          title: Text('Order Placed')
        ),
        body: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
          child: Center(
                child: Column(
                    children: [
                      Text('Order Successful!',
                            style: TextStyle(fontSize: 36,
                                              fontWeight: FontWeight.w500),),
                      Text('', style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.05),),
                      Text("Your reservation details will be emailed to you momentarily. We will also be sending you access codes to receive access codes to unlock your door",
                      style: TextStyle(fontSize: 20,
                                        fontStyle: FontStyle.italic))
              ]
            ),
          ),
        ),
      ),
    );
  }
}