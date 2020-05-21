import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jiffy/jiffy.dart';
import 'package:some_calendar/some_calendar.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'bookReservation.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

List<DateTime> selectedDates = List();
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
                                  builder: (context) => ConfirmBooking()),
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

//Function to get the Check In Time in a different file
String getCheckInTime() {
  return formatTimeOfDay(_timeIn);
}

//Function to get the Check Out Time in a different file
String getCheckOutTime() {
  return formatTimeOfDay(_timeOut);
}
