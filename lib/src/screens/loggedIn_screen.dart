import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class LoggedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Indian App'),
      ),
      body: Container(child: Calender()),
    );
  }
}

class Calender extends StatefulWidget {
  createState() {
    return CalenderState();
  }
}

class CalenderState extends State<Calender> {
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: TableCalendar(
      calendarController: _calendarController,
    ));
  }
}
