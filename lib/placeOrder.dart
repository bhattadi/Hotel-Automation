import 'package:flutter/material.dart';

class PlaceOrder extends StatefulWidget {
  @override
  _PlaceOrder createState() => _PlaceOrder();
  }

class _PlaceOrder extends State<PlaceOrder>
{
  @override
  Widget build(BuildContext buildContext){
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Placed')
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
        child: Center(
        child: Text("Thank you for your order! Would you like a receipt or emailed copy of your reciept?",
                    style: TextStyle(fontSize: 28))
        ),
      ),
    );
  }
}