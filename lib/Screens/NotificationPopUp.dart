import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_national_dawn/Common/Constants.dart';
import 'package:the_national_dawn/Common/Services.dart';

class NotificationPopUp extends StatefulWidget {
  var message;

  NotificationPopUp({this.message});

  @override
  _NotificationPopUpState createState() => _NotificationPopUpState();
}

class _NotificationPopUpState extends State<NotificationPopUp> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.message["notification"]["title"]}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            Text(
              "${widget.message["notification"]["body"]}",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.grey[800]),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 5.0, right: 5, top: 15, bottom: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    color: appPrimaryMaterialColor,
                    child: new Text(
                      "Accept",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Container(
                    width: 2,
                    color: appPrimaryMaterialColor,
                    height: 35,
                  ),
                  new FlatButton(
                    color: appPrimaryMaterialColor,
                    child:
                        // isSendLoading == true
                        //     ? LoadingBlueComponent()
                        //     :
                        Text(
                      "Reject",
                      style: TextStyle(color: Colors.white, fontSize: 18),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  // _sendRequest() async {
  //   try {
  //     final result = await InternetAddress.lookup('google.com');
  //     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //       setState(() {
  //         isSendLoading = true;
  //       });
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       var body = {
  //         "requestSender": "${prefs.getString(Session.CustomerId)}",
  //         "requestReceiver": "${widget.directoryData["_id"]}",
  //         "requestStatus": "accepted",
  //         "notificationData": {
  //           'notificationBody': "Hi " +
  //               "${widget.directoryData["name"]}" +
  //               ", " +
  //               "${prefs.getString(Session.CustomerName)} wants 1-2-1 meeting with you.",
  //           'notificationTitle': "TND Request",
  //         },
  //       };
  //       Services.postForSave2(
  //               apiname: 'users/oneTwoOneConnectionReq', body: body)
  //           .then((response) async {
  //         if (response.IsSuccess == true && response.Data == "1") {
  //           setState(() {
  //             isSendLoading = false;
  //           });
  //           Fluttertoast.showToast(msg: response.Message);
  //         }
  //       }, onError: (e) {
  //         setState(() {
  //           isSendLoading = false;
  //         });
  //         print("error on call -> ${e.message}");
  //         Fluttertoast.showToast(msg: "something went wrong");
  //       });
  //     }
  //   } on SocketException catch (_) {
  //     Fluttertoast.showToast(msg: "No Internet Connection");
  //   }
  // }
}
