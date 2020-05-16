import 'package:flutter/material.dart';
import 'bookReservation.dart';

class ReviewDetails extends StatefulWidget {
  @override
  _ReviewDetails createState() => _ReviewDetails();
}

class _ReviewDetails extends State<ReviewDetails>
{
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context, false),
          ),
          title: Text('Confirmation')
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
              child: Center(
                      child: Text('Review Details',
                                  style: TextStyle(fontSize: 36))
              )
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Name: ',
                            style: TextStyle(fontSize: 20),),
                      Text(getFirstName() + ' ' + getLastName(),
                            style: TextStyle(fontSize: 20,))
                    ]
                  )
                ],
              )
            )
          ],
        )
      )
    );
  }
}