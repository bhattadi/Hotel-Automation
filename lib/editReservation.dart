import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class EditBookingPage extends StatefulWidget {
  
  EditBookingPage({Key key, this.userId})
      : super(key: key);
      final String userId;
      
  @override
  _EditBookingPage createState() => _EditBookingPage();

  
}

class _EditBookingPage extends State<EditBookingPage>{
  @override
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final databaseReference = FirebaseDatabase.instance.reference();
  
  getData() async{
    databaseReference.child("account").child(widget.userId).child("reservations").once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }
    

  Widget build(BuildContext context) {
    print("STOP HERE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    getData();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context, false),
          ),
          title: Text('Edit Reservations')
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.05),
                    child: Center(
                        child: Text('Edit Reservations',
                            style: TextStyle(
                                fontSize: 36, fontWeight: FontWeight.bold)))),
            Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    child: Column(
                      children: [
                        Text("Want to place data here", style: TextStyle(fontSize: 24),)
                      ]
                    )
            )
            ],
          )
        )
      )
    );
  }
}