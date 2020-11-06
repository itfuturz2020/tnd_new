import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:the_national_dawn/Common/Constants.dart';

class HomeCalendarScreen extends StatefulWidget {
  @override
  _HomeCalendarScreenState createState() => _HomeCalendarScreenState();
}

class _HomeCalendarScreenState extends State<HomeCalendarScreen> {
  CalendarController _calendarController;
  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            "Calendar",
            style: TextStyle(
              color: appPrimaryMaterialColor,
              fontSize: 18,
              //fontWeight: FontWeight.bold
            ),
          ),
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(top: 8.0, right: 18, left: 10, bottom: 8),
            child: Container(
              height: 20,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.grey[200], width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[600].withOpacity(0.2),
                        blurRadius: 1.0,
                        spreadRadius: 1.0,
                        offset: Offset(3.0, 5.0))
                  ]),
              child: Image.asset('assets/scan.png'),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableCalendar(
            calendarController: _calendarController,
            calendarStyle: CalendarStyle(
              selectedColor: appPrimaryMaterialColor,
              todayColor: appPrimaryMaterialColor[400],
              markersColor: Colors.brown[700],
              outsideDaysVisible: false,
            ),
            headerStyle: HeaderStyle(
              formatButtonTextStyle:
                  TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
              formatButtonDecoration: BoxDecoration(
                color: appPrimaryMaterialColor,
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Today's Agenda",
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 18),
                        ),
                        Container(
                          height: 3,
                          width: 60,
                          color: appPrimaryMaterialColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 75.0),
                    child: Container(
                      padding: const EdgeInsets.only(left: 30.0, right: 8.0),
                      height: 107,
                      //width: 250,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Ms. Hema Malini",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff4B4B4B),
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Owl factory Solutions",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xff4B4B4B)),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Lecture on How to Grow.",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "10:00AM - 12:00PM",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: appPrimaryMaterialColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: CircleAvatar(
                      radius: 49,
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage("assets/z.jpeg"),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
