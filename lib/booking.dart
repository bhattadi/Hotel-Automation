//import 'package:flutter/material.dart';
//import 'package:some_calendar/some_calendar.dart';
//import 'package:intl/intl.dart';
//import 'package:intl/date_symbol_data_local.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:jiffy/jiffy.dart';
import 'package:some_calendar/some_calendar.dart';


class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    List<DateTime> selectedDates = List();

    @override
    void initState() {
      initializeDateFormatting();
      Intl.systemLocale = 'en_En'; // to change the calendar format based on localization
      super.initState();
    }
    return MaterialApp (
      home: Scaffold(
        body: Center(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: SomeCalendar(
            primaryColor: Color(0xff5833A5),
            mode: SomeMode.Range,
            isWithoutDialog: true,
            selectedDates: selectedDates,
            startDate: Jiffy().subtract(years: 3),
            lastDate: Jiffy().add(months: 9),
            done: (date) {
              setState(() {
                selectedDates = date;
                //showSnackbar(selectedDates.toString());
              });
            },
          ),
        )
        ),
        ),
      );
  }
}

