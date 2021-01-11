import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_national_dawn/Common/Constants.dart';
import 'package:the_national_dawn/Common/Services.dart';

class NotificationPopUp extends StatefulWidget {
  var data;
  NotificationPopUp({this.data});
  @override
  _NotificationPopUpState createState() => _NotificationPopUpState();
}

class _NotificationPopUpState extends State<NotificationPopUp> {
  List directoryList = [];
  bool isLoading = true;
  String CustomerName;

  custName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CustomerName = prefs.getString(CustomerName);
  }

  @override
  void initState() {
    //custName();
    print("======================================");
    print(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(
        "TND",
        style: TextStyle(
          fontSize: 22,
          color: appPrimaryMaterialColor,
          // fontWeight: FontWeight.bold
        ),
      ),
      content: new Wrap(
        children: [
          ListTile(
            title: Column(
              children: <Widget>[
                Text(
                  "Hi " +
                      ", " +
                      "${CustomerName} wants 1-2-1 meeting with you.",
                  style:
                      TextStyle(color: appPrimaryMaterialColor, fontSize: 18),
                ),
                Text(
                  widget.data,
                  style:
                      TextStyle(color: appPrimaryMaterialColor, fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        FlatButton(
          child: new Text(
            "Accept",
            style: TextStyle(color: appPrimaryMaterialColor, fontSize: 18),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        new FlatButton(
          child:
              // isSendLoading == true
              //     ? LoadingBlueComponent()
              //     :
              Text(
            "Reject",
            style: TextStyle(color: appPrimaryMaterialColor, fontSize: 18),
          ),
          onPressed: () async {
            // _sendRequest();
            // SharedPreferences prefs = await SharedPreferences.getInstance();
            Navigator.pop(context);
            // await prefs.clear();
            // Navigator.pushNamedAndRemoveUntil(
            //     context, '/LoginScreen', (route) => false);
          },
        ),
      ],
    );
  }
}
