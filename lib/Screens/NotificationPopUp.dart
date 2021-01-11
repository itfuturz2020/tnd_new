import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
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

  showDialog(context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, top: 65, right: 20, bottom: 20),
          margin: EdgeInsets.only(top: 65),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 5), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Text(
                "TND",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Container(
                    width: 130,
                    child: Text(
                      "${widget.data}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.grey[800]),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        child: new Text(
                          "Accept",
                          style: TextStyle(
                              color: appPrimaryMaterialColor, fontSize: 18),
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
                          style: TextStyle(
                              color: appPrimaryMaterialColor, fontSize: 18),
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
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   child: Image.asset(
          //     'images/background.png',
          //     fit: BoxFit.fill,
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: showDialog(context),
              ),
              // Image.asset(
              //   'images/myginitext.png',
              //   height: 60,
              // ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
        ],
      ),
    );

    //   AlertDialog(
    //   title: new Text(
    //     "TND",
    //     style: TextStyle(
    //       fontSize: 22,
    //       color: appPrimaryMaterialColor,
    //       // fontWeight: FontWeight.bold
    //     ),
    //   ),
    //   content: new Wrap(
    //     children: [
    //       ListTile(
    //         title: Column(
    //           children: <Widget>[
    //             Text(
    //               "Hi " +
    //                   ", " +
    //                   "${CustomerName} wants 1-2-1 meeting with you.",
    //               style:
    //                   TextStyle(color: appPrimaryMaterialColor, fontSize: 18),
    //             ),
    //             Text(
    //               "${widget.data}",
    //               style:
    //                   TextStyle(color: appPrimaryMaterialColor, fontSize: 18),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    //   actions: <Widget>[
    //     // usually buttons at the bottom of the dialog
    //     FlatButton(
    //       child: new Text(
    //         "Accept",
    //         style: TextStyle(color: appPrimaryMaterialColor, fontSize: 18),
    //       ),
    //       onPressed: () {
    //         Navigator.of(context).pop();
    //       },
    //     ),
    //     new FlatButton(
    //       child:
    //           // isSendLoading == true
    //           //     ? LoadingBlueComponent()
    //           //     :
    //           Text(
    //         "Reject",
    //         style: TextStyle(color: appPrimaryMaterialColor, fontSize: 18),
    //       ),
    //       onPressed: () async {
    //         // _sendRequest();
    //         // SharedPreferences prefs = await SharedPreferences.getInstance();
    //         Navigator.pop(context);
    //         // await prefs.clear();
    //         // Navigator.pushNamedAndRemoveUntil(
    //         //     context, '/LoginScreen', (route) => false);
    //       },
    //     ),
    //   ],
    // );
  }
}
