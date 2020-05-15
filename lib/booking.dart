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
    showDialog(
            context: context,
            builder: (_) => SomeCalendar(
              mode: SomeMode.Range,
              startDate: Jiffy().subtract(years: 3),
              lastDate: Jiffy().add(months: 9),
              selectedDates: selectedDates,
              isWithoutDialog: false,
              primaryColor: Colors.red,
              done: (date) {
                setState(() {
                  selectedDates = date;
                  //showSnackbar(selectedDates.toString());
                });
              },
            )
          );

    }
  }

