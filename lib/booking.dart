//import 'package:flutter/material.dart';
//import 'package:some_calendar/some_calendar.dart';
//import 'package:intl/intl.dart';
//import 'package:intl/date_symbol_data_local.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:jiffy/jiffy.dart';
import 'package:some_calendar/some_calendar.dart';

import 'package:day_night_time_picker/day_night_time_picker.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override

  List<DateTime> selectedDates = List();
  TimeOfDay _timeIn = TimeOfDay.now();
  TimeOfDay _timeOut = TimeOfDay.now();
  double baseRate = 60.0;


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

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();  //"6:00 AM"
    return format.format(dt);
  }
  
  RaisedButton _buildCheckInButton(String label) {
    return RaisedButton(
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
        style: TextStyle(color: Colors.black),
      ),
    );
  }


  RaisedButton _buildCheckOutButton(String label) {
    return RaisedButton(
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
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget build(BuildContext context) {
    @override
    RaisedButton checkIn = _buildCheckInButton("Check-in Time");
    RaisedButton checkOut = _buildCheckOutButton("Check-out Time");
    return Scaffold(
        appBar: AppBar(
          title: Text("Book Reservation"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                RaisedButton(
                  child: Text("Select Calendar Dates"),
                  onPressed: () {
                    _showDialog();
                  },
                ),
                Text(
                  selectedDates.length != 0 ? new DateFormat.yMMMd().format(selectedDates.first) + " - " + new DateFormat.yMMMd().format(selectedDates.last) : "Please Select Dates",
                ),
              ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    checkIn,
                    Text(formatTimeOfDay(_timeIn)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    checkOut,
                    Text(formatTimeOfDay(_timeOut))
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Estimated Cost: ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      "\$" + (baseRate * selectedDates.length).toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ]
              ),
              RaisedButton(
                child: Text("Confirm Booking"),
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConfirmBooking()),
                  );
                }
              )
            ],
          ),
        ));
  }
}


class ConfirmBooking extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container();
  }
}