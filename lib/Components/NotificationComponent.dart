import 'package:flutter/material.dart';
import 'package:the_national_dawn/Common/Constants.dart';

class NotificationComponent extends StatefulWidget {
  @override
  _NotificationComponentState createState() => _NotificationComponentState();
}

class _NotificationComponentState extends State<NotificationComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width * 1.2,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[100], width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[400].withOpacity(0.2),
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  offset: Offset(3.0, 5.0))
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: CircleAvatar(
                    backgroundColor: appPrimaryMaterialColor,
                    radius: 18,
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    )),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 15),
                    child: Text(
                      "All News Fastest",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 6),
                    child: Text(
                      "News is information about current events.Common topics reports.",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, right: 4),
              child: Text(
                "12 Dec 2020",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
