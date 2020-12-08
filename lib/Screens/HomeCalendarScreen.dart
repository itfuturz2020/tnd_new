import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:the_national_dawn/Common/Constants.dart';
import 'package:the_national_dawn/Common/Services.dart';

class HomeCalendarScreen extends StatefulWidget {
  @override
  _HomeCalendarScreenState createState() => _HomeCalendarScreenState();
}

class _HomeCalendarScreenState extends State<HomeCalendarScreen>
    with TickerProviderStateMixin {
  bool isLoading = true;
  DateTime _selectedDay;
  Map<DateTime, List> _visibleEvents;
  List _selectedEvents = [];
  int _currentIndex = 0;
  CalendarController _calendarController;

  @override
  void initState() {
    _visibleEvents = {};
    _calendarController = new CalendarController();
    _getEventData();
  }

  _getEventData() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//        var body = {};
        Services.PostForList(
          api_name: 'admin/getEvents',
        ).then((ResponseList) async {
          setState(() {
            isLoading = false;
          });
          Map<DateTime, List> temp = {};
          if (ResponseList.length > 0) {
            for (var i = 0; i < ResponseList.length; i++) {
              List splitData =
                  ResponseList[i]["startDate"][0].toString().split("/");
              DateTime startDate = DateTime.parse(
                  "${splitData[2]}-${splitData[1]}-${splitData[0]}");
              var splitData2 =
                  ResponseList[i]["endDate"][0].toString().split('/');
              DateTime endDate = DateTime.parse(
                  "${splitData2[2]}-${splitData2[1]}-${splitData2[0]}");

              for (DateTime j = startDate;
                  j.isBefore(endDate) || j == endDate;
                  j = j.add(Duration(days: 1))) {
                temp.addAll({
                  j: [ResponseList[i]]
                });
              }
            }
            log(temp.toString());

            setState(() {
              _visibleEvents = temp;
            });
          } else {
            setState(() {
              isLoading = false;
            });
            Fluttertoast.showToast(msg: "No Data Found");
            //show "data not found" in dialog
          }
        }, onError: (e) {
          setState(() {
            isLoading = false;
          });
          print("error on call -> ${e.message}");
          Fluttertoast.showToast(msg: "Something Went Wrong");
        });
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(msg: "No Internet Connection.");
    }
  }

  showMsg(String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text(msg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "Close",
                style: TextStyle(color: appPrimaryMaterialColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onDaySelected(DateTime day, List events, _) {
    setState(() {
      _selectedDay = day;
      _selectedEvents = events;
    });
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      locale: 'en_US',
      events: _visibleEvents,
      //holidays: _visibleHolidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.monday,

      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
        /*CalendarFormat.twoWeeks: '2 weeks',
        CalendarFormat.week: 'Week',*/
      },
      calendarStyle: CalendarStyle(
        selectedColor: appPrimaryMaterialColor,
        todayColor: appPrimaryMaterialColor[200],
        markersColor: Colors.deepOrange,
        //markersMaxAmount: 7,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: appPrimaryMaterialColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      calendarController: _calendarController,
    );
  }

  Widget _buildEventList() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView(
        shrinkWrap: true,
        children: _selectedEvents
            .map(
              (event) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 75.0),
                        child: Container(
                          padding:
                              const EdgeInsets.only(left: 30.0, right: 8.0),
                          height: 107,
                          //width: 250,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  event["eventOrganiseBy"],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff4B4B4B),
                                      fontWeight: FontWeight.w600),
                                ),
//                                Text(
//                                  "Owl factory Solutions",
//                                  style: TextStyle(
//                                      fontSize: 10, color: Color(0xff4B4B4B)),
//                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  event["eventName"],
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  event["startTime"] + "-" + event["endTime"],
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
                          backgroundImage: NetworkImage(event["eventImage"]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
//                  Container(
//                decoration: BoxDecoration(
//                  border: Border.all(width: 0.8),
//                  borderRadius: BorderRadius.circular(12.0),
//                ),
//                margin:
//                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                child: ListTile(
//                  title: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text(event["Name"]),
//                      Text(event["Venue"]),
//                    ],
//                  ),
//                  onTap: () {
//                    String selectedDate =
//                        _selectedDay.toString().substring(0, 10);
////                      Navigator.push(
////                        context,
////                        MaterialPageRoute(
////                          builder: (context) => EventDetailList(
////                            date: selectedDate,
////                            events: _selectedEvents,
////                          ),
////                        ),
////                      );
//                  },
//                ),
//              ),
            )
            .toList(),
      ),
    );
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    setState(() {
      print(first);
      print(last);
    });
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
      body: ListView(
        children: <Widget>[
          _buildTableCalendar(),
          _buildEventList(),
        ],
      ),
    );
  }
}
