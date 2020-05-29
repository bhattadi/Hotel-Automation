import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jiffy/jiffy.dart';
import 'package:some_calendar/some_calendar.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'bookReservation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutterapp/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookingPage extends StatefulWidget {
  BookingPage({Key key, this.userId}) : super(key: key);
  final String userId;

  @override
  _BookingPageState createState() => _BookingPageState();
}

List<DateTime> selectedDates = List();
List<int> chosenRooms = List<int>();
TimeOfDay _timeIn = TimeOfDay.now();
TimeOfDay _timeOut = TimeOfDay.now();
double baseRate = 60.0;

String formatTimeOfDay(TimeOfDay tod) {
  final now = new DateTime.now();
  final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
  final format = DateFormat.jm(); //"6:00 AM"
  return format.format(dt);
}

class _BookingPageState extends State<BookingPage> {
  @override
  void initState() {
    initializeDateFormatting();
    Intl.systemLocale =
        'en_En'; // to change the calendar format based on localization
    super.initState();
  }

  void onTimeChangedIn(TimeOfDay newTime) {
    setState(() {
      _timeIn = newTime;
    });
  }

  void onTimeChangedOut(TimeOfDay newTime) {
    setState(() {
      _timeOut = newTime;
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (_) => SomeCalendar(
              mode: SomeMode.Range,
              startDate: Jiffy().subtract(years: 3),
              lastDate: Jiffy().add(months: 9),
              selectedDates: selectedDates,
              isWithoutDialog: false,
              primaryColor: Colors.blue,
              done: (date) {
                setState(() {
                  selectedDates = date;
                });
              },
            ));
  }

  SizedBox _buildCheckInButton(String label) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.42,
        height: MediaQuery.of(context).size.height * 0.075,
        child: RaisedButton(
          color: Colors.lightBlue,
          elevation: 10.0,
          onPressed: () {
            Navigator.of(context).push(
              showPicker(
                context: context,
                value: _timeIn,
                onChange: onTimeChangedIn,
              ),
            );
          },
          child: Text(
            label,
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ));
  }

  SizedBox _buildCheckOutButton(String label) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.42,
      height: MediaQuery.of(context).size.height * 0.075,
      child: RaisedButton(
        color: Colors.lightBlue,
        elevation: 10.0,
        onPressed: () {
          Navigator.of(context).push(
            showPicker(
              context: context,
              value: _timeOut,
              onChange: onTimeChangedOut,
            ),
          );
        },
        child: Text(
          label,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    @override
    List<Room> masterListOfRooms = List<Room>(20);

    final FirebaseDatabase _database = FirebaseDatabase.instance;

    void setUpRooms() {
      masterListOfRooms[0] = Room(false, "Don't touch!", "Don't touch!", 0);
      for (int i = 1; i < masterListOfRooms.length; ++i) {
        masterListOfRooms[i] = Room(true, "12:00 AM", "12:00 AM", i);
      }
    }

    Future<List<Room>> openRooms() async {
      setUpRooms();
      DataSnapshot roomsInDatabase;
      List<Room> usableRooms = List<Room>.from(masterListOfRooms);
      for (int i = 0; i < selectedDates.length; ++i) {
        var dayOfYear = new DateFormat.yMMMd().format(selectedDates[i]);
        roomsInDatabase = await _database
            .reference()
            .child("calendar")
            .child("Days")
            .child(dayOfYear)
            .child("Room Numbers")
            .once();

        List<dynamic> roomsBookedInDatabase = roomsInDatabase.value;

        List<dynamic> rooms = List<dynamic>.from(roomsBookedInDatabase);

        rooms.removeWhere((element) => element == null);

        for (int j = 0; j < rooms.length; ++j) {
          if (rooms[j]["isAvailable"] == false) {
            usableRooms.remove(masterListOfRooms[rooms[j]["roomNum"]]);
          }
        }
      }
      return usableRooms;
    }

    // ---------------------------------------------------------------------------------------------------------

//
    //    final databaseReference = Firestore.instance;

//      mapOfMaps.forEach((key, value) {
//        print(Map.from(value));
//      });

//        print(dates.value);
//      }
//      //}
////      print(dates);
    // ---------------------------------------------------------------------------------------------------------------------------------------------------------
//
//    void addRoomsIntoCloudFireStore() async {
//
//    }
//
//    void potentialRooms(var data) {
//      for(int i = 0; i < data.length; ++i) {
//
//      }
//    }
//
//
//    void bookingInCloudFireStore() async {
//      for(int i = 0; i < selectedDates.length; ++i) {
//        var dayOfYear = DateFormat("D").format(selectedDates[i]);
//        databaseReference.collection("days").getDocuments().then((querySnapshot) {
//          querySnapshot.documents.forEach((result) {
//            databaseReference.collection("days").document(dayOfYear).collection("rooms").getDocuments().then((querySnapshot) {
//              querySnapshot.documents.forEach((result) {
//                Map<String, dynamic> data = result.data;
//                print(data);
//              });
//            });
//          });
//        });
//
//      }
//    }

//    void createRecord() async {
    //// -------------------------------------------SET DATA--------------------------------------------------------------------------------------------------
//      await databaseReference.collection("books")
//          .document("1")
//          .setData({
//        'title': 'Mastering Flutter',
//        'description': 'Programming Guide for Dart'
//      });
//
//      await databaseReference.collection("books")
//          .document("2")
//          .setData({
//        'title': 'Testing out database',
//        'description': 'Here we gooooo'
//      });
//
//      await databaseReference.collection("books")
//          .document("3")
//          .setData({
//        'title': 'Testing 3 out database',
//        'description': 'Here we gooooo'
//      });

    //// -------------------------------------------SET DATA--------------------------------------------------------------------------------------------------

    // ----------------------------------------------ADDED INTO DATABASE-------------------------------------------------------------------------------------------------

//      DocumentReference ref = await databaseReference.collection("books")
//          .add({
//        'title': 'Flutter in Action',
//        'description': 'Complete Programming Guide to learn Flutter'
//      });
//      print(ref.documentID);

    // ----------------------------------------------ADDED INTO DATABASE-------------------------------------------------------------------------------------------------

    // ---------------------------------------SUBCOLLECTION---------------------------------------------------------------------------------------------------------
//    await databaseReference.collection("books").document("4").collection("subcollection").document("trial_in_subcollection").setData({
//      'title': 'Trying to work with a subcollection',
//    });
//
//    await databaseReference.collection("books").document("4").collection("subcollection").document("trial_in_subcollection2").setData({
//      'title': 'Trying to work with a subcollection2',
//      'test' : "test"
//    });

    // ----------------------------------------SUBCOLLECTION--------------------------------------------------------------------------------------------------------

    // ----------------------------------------GETTING SUBCOLLECTION--------------------------------------------------------------------------------------------------------

//      databaseReference.collection("books").getDocuments().then((querySnapshot) {
//        querySnapshot.documents.forEach((result) {
//          databaseReference.collection("books").document(result.documentID).collection("subCollection").getDocuments().then((querySnapshot) {
//            querySnapshot.documents.forEach((result) {
//              print(result.data);
//            });
//          });
//        });
//
//      });

    // ----------------------------------------GETTING SUBCOLLECTION--------------------------------------------------------------------------------------------------------

    // --------------------------------------ACTUAL DATA FOR HOTEL-------------------------------------------------------------------------------------------------------

//    for(int i = 0; i < 366; ++i) {
//      await databaseReference.collection("days").document(i.toString()).setData({"dayNum": i.toString()});
//      await databaseReference.collection("days").document(i.toString()).collection("rooms").document("tempRoom").setData({
//      'isAvailable' : true,
//      'checkin':  2,
//      'checkout': 2,
//      'roomNum': 0,
//      });
//
//    }

    // -------------------------------------ACTUAL DATA FOR HOTEL--------------------------------------------------------------------------------------------------------

    // -------------------------------------------TRIED OUT ARRAY FOR HOTEL--------------------------------------------------------------------------------------------------
//    DocumentReference docRef = Firestore.instance.collection("days").document("0");
//    DocumentSnapshot doc = await docRef.get();
//    List rooms = doc.data["rooms"];
//
//    dynamic room = Room(true, 0, 0, "testRoom");
//
//    docRef.updateData(
//
//      {
//        'rooms': FieldValue.arrayUnion(room)
//      }
//
//    );

    // -------------------------------------------TRIED OUT ARRAY FOR HOTEL--------------------------------------------------------------------------------------------------

    //   }

    Icon ifNotZero(int value) {
      if (value != 0) {
        return Icon(
            chosenRooms.contains(value)
                ? Icons.check
                : Icons.add_circle_outline,
            color: chosenRooms.contains(value) ? Colors.green : null);
      }
    }

    showRooms() {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)), //this right here
          actions: <Widget>[
            Container(
              height: 300.0,
              width: 300.0,
              child: SizedBox(
                child: new FutureBuilder(
                    future: openRooms(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Room>> snapshot) {
                      if (!snapshot.hasData) {
                        return new Container();
                      }
                      List<Room> content = snapshot.data;
                      return new ListView.builder(
                        itemCount: content.length,
                        itemBuilder: (BuildContext context, int index) {
                          //if(content[index].roomNum != 0) {
                          return new ListTile(
                            title: Text(content[index].roomNum != 0
                                ? "Room: " + (content[index].roomNum).toString()
                                : "Select a Room"),
                            trailing: ifNotZero(content[index].roomNum),
                            onTap: () {
                              setState(() {
                                if (content[index].roomNum != 0) {
                                  if (chosenRooms
                                      .contains(content[index].roomNum)) {
                                    chosenRooms.remove(content[index].roomNum);
                                  } else {
                                    chosenRooms.add(content[index].roomNum);
                                  }
                                }
                              });
                            },
                          );
                          //}
                        },
                      );
                    }),
              ),
            )
          ],
        );
      });
    }

    SizedBox checkIn = _buildCheckInButton("Check-in Time");
    SizedBox checkOut = _buildCheckOutButton("Check-out Time");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Book Reservation"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.42,
                        height: MediaQuery.of(context).size.height * 0.075,
                        child: RaisedButton(
                          color: Colors.lightBlue,
                          elevation: 10.0,
                          padding: EdgeInsets.all(10),
                          child: Text("Select Dates",
                              style: TextStyle(fontSize: 18)),
                          onPressed: () {
                            _showDialog();
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.05),
                        child: Text(
                            selectedDates.length != 0
                                ? "From: " +
                                    new DateFormat.yMMMd()
                                        .format(selectedDates.first) +
                                    '\n' +
                                    '\n' +
                                    "To: " +
                                    new DateFormat.yMMMd()
                                        .format(selectedDates.last)
                                : "Please Select Dates",
                            style: TextStyle(
                                fontSize: 16, fontStyle: FontStyle.italic)),
                      )
                    ]),
                Row(
                  children: [
                    Text(
                      '',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.05),
                    )
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    checkIn,
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.05),
                      child: Text(formatTimeOfDay(_timeIn),
                          style: TextStyle(
                              fontSize: 16, fontStyle: FontStyle.italic)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.05),
                    )
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    checkOut,
                    Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.05),
                        child: Text(formatTimeOfDay(_timeOut),
                            style: TextStyle(
                                fontSize: 16, fontStyle: FontStyle.italic)))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.1),
                    )
                  ],
                ),
                Center(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: RaisedButton(
                          color: Colors.lightBlue,
                          elevation: 10.0,
                          child: Text("Choose Rooms",
                              style: TextStyle(fontSize: 24)),
                          onPressed: () {
                            openRooms();
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => showRooms());
                          })),
                ),
                Row(
                  children: [
                    Text(
                      '',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.05),
                    )
                  ],
                ),
                Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text(
                          "Estimated Cost: ",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.05,
                            0,
                            MediaQuery.of(context).size.width * 0.05,
                            0),
                        child: Text(
                          "\$" +
                              (baseRate * selectedDates.length)
                                  .toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ]),
                Row(
                  children: [
                    Text(
                      '',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.05),
                    )
                  ],
                ),
                Center(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: RaisedButton(
                          color: Colors.lightBlue,
                          elevation: 10.0,
                          child: Text("Confirm Booking",
                              style: TextStyle(fontSize: 24)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ConfirmBooking(userId: widget.userId)),
                            );
                          })),
                ),
              ]),
        ),
      ),
    );
  }
}

//Function to get the Selected Date Range in a different file
String getDateRange() {
  return selectedDates.length != 0
      ? "From: " +
          new DateFormat.yMMMd().format(selectedDates.first) +
          '\n' +
          '\n' +
          "To: " +
          new DateFormat.yMMMd().format(selectedDates.last)
      : "Please Select Dates";
}

List<DateTime> dates() {
  return selectedDates;
}

List<int> chosen() {
  return chosenRooms;
}

//Function to get the Check In Time in a different file
String getCheckInTime() {
  return formatTimeOfDay(_timeIn);
}

void clearChosenRooms() {
  chosenRooms.clear();
}

//Function to get the Check Out Time in a different file
String getCheckOutTime() {
  return formatTimeOfDay(_timeOut);
}
