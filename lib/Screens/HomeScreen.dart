import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_slider/image_slider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_national_dawn/Common/ClassList.dart';
import 'package:the_national_dawn/Common/Constants.dart';
import 'package:the_national_dawn/Common/Services.dart';
import 'package:the_national_dawn/Components/LoadingBlueComponent.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:the_national_dawn/offlineDatabase/db_handler.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String fcmToken = "";
  String qrData;
  var _name;
  var _comp_name;
  var _mobileNo;
  var _email;
  var img;
  String barCode;
  DBHelper dbHelper;
  Future<List<Visitorclass>> visitor;

  _profile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString(Session.CustomerName);
      _comp_name = prefs.getString(Session.CustomerCompanyName);
      _email = prefs.getString(Session.CustomerEmailId);
      img = prefs.getString(Session.CustomerImage);
      _mobileNo = prefs.getString(Session.CustomerPhoneNo);
      qrData =
          _name + "," + _comp_name + "," + _email + "," + img + "," + _mobileNo;
    });
  }

  Future scanVisitor() async {
    try {
      String barCode = await BarcodeScanner.scan();
      var qrtext = barCode.toString().split(",");
      print(qrtext[3]);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 9.0, top: 6),
                        child: Icon(
                          Icons.clear,
                          size: 19,
                          color: Colors.grey,
                        ),
                      ),
                    )),
                Container(
                    height: 80,
                    width: 100,
                    child: Image.network(Image_URL + "${qrtext[3]}")),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Name : ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${qrtext[0]}",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Row(children: [
                    Text(
                      "Company Name : ",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${qrtext[1]}",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ], mainAxisAlignment: MainAxisAlignment.center),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Row(children: [
                    Text(
                      "Email : ",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${qrtext[2]}",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ], mainAxisAlignment: MainAxisAlignment.center),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Row(children: [
                    Text(
                      "Phone : ",
                      /*"${widget.whtscall}",*/
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${qrtext[4]}",
                      /*"${widget.whtscall}",*/
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ], mainAxisAlignment: MainAxisAlignment.center),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 21.0, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //launch(('mailto:// ${widget.emaildata}'));
                        },
                        child: CircleAvatar(
                          child: Icon(
                            Icons.mail,
                            color: Colors.white,
                            size: 19,
                          ),
                          backgroundColor: appPrimaryMaterialColor,
                          radius: 19,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: GestureDetector(
                          onTap: () {
                            // launch(('tel:// ${widget.phonedata}'));
                          },
                          child: CircleAvatar(
                            child: Icon(
                              Icons.call,
                              color: Colors.white,
                              size: 19,
                            ),
                            backgroundColor: appPrimaryMaterialColor,
                            radius: 19,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          /* launchwhatsapp(
                              phone: "${widget.whtspdata}",
                              message: "${widget.whtscall}");*/
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: CircleAvatar(
                            child: Image.asset(
                              "assets/whatsapp.png",
                              width: 21,
                              color: Colors.white,
                            ),
                            backgroundColor: appPrimaryMaterialColor,
                            radius: 19,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    dbHelper.insertVisitor(Visitorclass(
                        qrtext[0].toString(),
                        qrtext[1].toString(),
                        qrtext[2].toString(),
                        qrtext[3].toString(),
                        qrtext[4].toString()));
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 13.0, bottom: 25, left: 9, right: 9),
                    child: Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: appPrimaryMaterialColor, width: 1)),
                      child: Center(
                        child: Text(
                          "Ok",
                          // "${widget.contactdata}",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 4,
                  color: appPrimaryMaterialColor,
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
            /*Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name : " + "${qrtext[0]}"),
                Text("Company Name : " + "${qrtext[1]}"),
                Text("Email : " + "${qrtext[2]}"),
                Text("Image : " + "${qrtext[3]}"),
                Text("Phone : " + "${qrtext[4]}"),
                Center(
                  child: RaisedButton(
                      child: Text("ok"),
                      onPressed: () {
                        dbHelper.insertVisitor(Visitorclass(
                            qrtext[0].toString(),
                            qrtext[1].toString(),
                            qrtext[2].toString(),
                            qrtext[3].toString(),
                            qrtext[4].toString()));
                      }),
                )
              ],
            ),*/
          );
        },
      );
    } catch (e) {
      setState(() => this.barCode = 'Unknown error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    _bannerImage();
    _profile();
    _firebaseMessaging.configure(onMessage: (Map<String, dynamic> message) {
      print("onMessage");
      print(message);
    }, onResume: (Map<String, dynamic> message) {
      print("onResume");
      print(message);
    }, onLaunch: (Map<String, dynamic> message) {
      print("onLaunch");
      print(message);
    });
  }

  List listB = [
    {
      "lable": "Daily News",
      "image": "assets/news.png",
      "screenName": "/DailyNewScreen",
    },
    {
      "lable": "Networking",
      "image": "assets/network.png",
      "screenName": "/NetworkScreen",
    },
    {
      "lable": " Directory",
      "image": "assets/directory.png",
      "screenName": "/DirectoryScreen",
    },
    {
      "lable": "Offers",
      "image": "assets/offers.png",
      "screenName": "/OfferScreen",
    },
    {
      "lable": "Success Stories",
      "image": "assets/success.png",
      "screenName": "/StoriesScreen",
    },
    {
      "lable": "Calendar",
      "image": "assets/calender.png",
      "screenName": "/CalenderScreen",
    },
    {
      "lable": "Business Card",
      "image": "assets/news.png",
      "screenName": "/BusinessCardScreen",
    },
    {
      "lable": "Bookmark",
      "image": "assets/bookmark.png",
      "screenName": "/BookMarkScreen",
    },
    {
      "lable": "Category",
      "image": "assets/category.png",
      "screenName": "/CategoryScreen",
    },
  ];

  List imgList = [];
  bool isBannerLoading = true;

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertboxLogout();
      },
    );
  }

  _scanDialog(var data) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: FittedBox(
          child: Row(
            children: [
              Text(
                "The",
                style: TextStyle(
                    color: appPrimaryMaterialColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5),
                child: Text(
                  "National",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Dawn",
                style: TextStyle(
                    color: appPrimaryMaterialColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              _settingModalBottomSheet(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 18, bottom: 19),
              child: Image.asset("assets/scan.png"),
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/NotificationScreen');
              },
              child: Image.asset("assets/bell.png")),
        ],
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Container(
          color: Colors.white,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Image.asset(
                  'assets/splash.png',
                  fit: BoxFit.cover,
                ),
                decoration: BoxDecoration(
                  color: appPrimaryMaterialColor[200],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed('/ProfileScreen');
                },
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 4),
                    child: Container(
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          "assets/user.png",
                          color: appPrimaryMaterialColor,
                        )),
                  ),
                  title: Text(
                    "Profile",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Divider(),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed('/ReferEarnScreen');
                },
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 4),
                    child: Container(
                        height: 26,
                        width: 26,
                        child: Image.asset(
                          "assets/hand-shake.png",
                          color: appPrimaryMaterialColor,
                        )),
                  ),
                  title: Text(
                    "Refer & Earn",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Divider(),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed('/MyEcardScreen');
                },
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 4),
                    child: Container(
                        height: 26,
                        width: 26,
                        child: Image.asset(
                          "assets/visitor-card.png",
                          color: appPrimaryMaterialColor,
                        )),
                  ),
                  title: Text(
                    "My E-Card",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Divider(),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).pop();
                  _showDialog(context);
                },
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 4),
                    child: Container(
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          "assets/logout.png",
                          color: appPrimaryMaterialColor,
                        )),
                  ),
                  title: Text(
                    "Logout",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Divider(
              color: appPrimaryMaterialColor,
            ),
            Container(
              height: 180,
              //margin: EdgeInsets.all(10),
//                decoration: BoxDecoration(
//                    //borderRadius: BorderRadius.circular(10),
//                    border:
//                        Border.all(width: 2, color: appPrimaryMaterialColor)),
              child: isBannerLoading == true
                  ? Center(child: LoadingBlueComponent())
                  : ImageSlider(
                      /// Shows the tab indicating circles at the bottom
                      showTabIndicator: true,

                      /// Cutomize tab's colors
                      tabIndicatorColor: Colors.grey[400],

                      /// Customize selected tab's colors
                      tabIndicatorSelectedColor: Colors.black,

                      /// Height of the indicators from the bottom
                      tabIndicatorHeight: 16,

                      /// Size of the tab indicator circles
                      tabIndicatorSize: 12,

                      /// tabController for walkthrough or other implementations
                      tabController: tabController,

                      /// Animation curves of sliding
                      curve: Curves.fastOutSlowIn,

                      /// Width of the slider
                      width: MediaQuery.of(context).size.width,

                      /// Height of the slider
                      height: 200,

                      /// If automatic sliding is required
                      autoSlide: true,

                      /// Time for automatic sliding
                      duration: new Duration(seconds: 7),

                      /// If manual sliding is required
                      allowManualSlide: true,

                      /// Children in slideView to slide
                      children: imgList.map((link) {
                        return new ClipRRect(
                            // borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                          link["image"],
                          width: MediaQuery.of(context).size.width,
                          height: 220,
                          fit: BoxFit.contain,
                        ));
                      }).toList(),
                    ),
            ),
            Divider(
              color: appPrimaryMaterialColor,
            ),
            // for (int i = 0; i < listB.length; i++) ...[
            //   custombox(
            //       listB[i]["lable"], listB[i]["image"], listB[i]["screenName"]),
            // ],
            // GridView.builder(
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 3,
            //     childAspectRatio: 1.1,
            //   ),
            //   itemCount: listB.length,
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) => custombox(
            //     listB[index]["lable"],
            //     listB[index]["image"],
            //     listB[index]["screenName"],
            //   ),
            // ),
            StaggeredGridView.countBuilder(
              crossAxisCount: 3,
              itemCount: listB.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, int index) => custombox(
                listB[index]["lable"],
                listB[index]["image"],
                listB[index]["screenName"],
              ),
              staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
              // mainAxisSpacing: 4.0,
              // crossAxisSpacing: 4.0,
            )
//              Padding(
//                padding: const EdgeInsets.only(left: 35.0, right: 35, top: 25),
//                child: Container(
//                  height: 35,
//                  child: TextFormField(
//                    keyboardType: TextInputType.text,
//                    style: TextStyle(fontSize: 15),
//                    cursorColor: appPrimaryMaterialColor,
//                    decoration: InputDecoration(
//                      suffixIcon: Icon(
//                        Icons.search,
//                        size: 25,
//                        color: Colors.black,
//                      ),
//
////                    Padding(
////                      padding: const EdgeInsets.only(right: 5.0, top: 0),
////                      child: Image.asset("assets/search.png"),
////                    ),
//                      counterText: "",
//                      contentPadding: EdgeInsets.only(
//                          top: 0.0, bottom: 0, left: 15, right: 5),
//                      hintText: "Type to Search...",
//                      hintStyle: TextStyle(
//                          color: Colors.grey[400], fontWeight: FontWeight.w500),
//                      enabledBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
//                        borderSide: BorderSide(color: Colors.black),
//                      ),
//                      focusedBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
//                        borderSide: BorderSide(color: Colors.black),
//                      ),
//                    ),
//                  ),
//                ),
//              ),

//               Padding(
//                 padding: const EdgeInsets.only(left: 25.0, right: 25, top: 35),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).pushNamed('/DailyNewScreen');
//                         },
//                         child: Container(
//                           height: 72,
//                           width: 72,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                   color: Color(0xff16B8FF), width: 1),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(16.0)),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: appPrimaryMaterialColor
//                                         .withOpacity(0.2),
//                                     blurRadius: 2.0,
//                                     spreadRadius: 2.0,
//                                     offset: Offset(3.0, 5.0))
//                               ]),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "assets/news.png",
//                                 // color: appPrimaryMaterialColor,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 5.0),
//                                 child: Text(
//                                   "Daily News",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: appPrimaryMaterialColor,
//                                       fontSize: 12),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),

//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).pushNamed('/NetworkScreen');
//                         },
//                         child: Container(
//                           height: 72,
//                           width: 72,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                   color: Color(0xff16B8FF), width: 1),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(16.0)),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: appPrimaryMaterialColor
//                                         .withOpacity(0.2),
//                                     blurRadius: 2.0,
//                                     spreadRadius: 2.0,
//                                     offset: Offset(3.0, 5.0))
//                               ]),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "assets/network.png",
//                                 // color: appPrimaryMaterialColor,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 5.0),
//                                 child: Text(
//                                   "Networking",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: appPrimaryMaterialColor,
//                                       fontSize: 12),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),

//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).pushNamed('/DirectoryScreen');
//                         },
//                         child: Container(
//                           height: 72,
//                           width: 72,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                   color: Color(0xff16B8FF), width: 1),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(16.0)),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: appPrimaryMaterialColor
//                                         .withOpacity(0.2),
//                                     blurRadius: 2.0,
//                                     spreadRadius: 2.0,
//                                     offset: Offset(3.0, 5.0))
//                               ]),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "assets/directory.png",
//                                 // color: appPrimaryMaterialColor,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 5.0),
//                                 child: Text(
//                                   "Directory",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: appPrimaryMaterialColor,
//                                       fontSize: 12),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               Padding(
//                 padding: const EdgeInsets.only(left: 25.0, right: 25, top: 5),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).pushNamed('/OfferScreen');
//                         },
//                         child: Container(
//                           height: 72,
//                           width: 72,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                   color: Color(0xff16B8FF), width: 1),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(16.0)),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: appPrimaryMaterialColor
//                                         .withOpacity(0.2),
//                                     blurRadius: 2.0,
//                                     spreadRadius: 2.0,
//                                     offset: Offset(3.0, 5.0))
//                               ]),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "assets/offers.png",
//                                 // color: appPrimaryMaterialColor,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 5.0),
//                                 child: Text(
//                                   "Offers",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: appPrimaryMaterialColor,
//                                       fontSize: 12),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).pushNamed('/StoriesScreen');
//                         },
//                         child: Container(
//                           height: 72,
//                           width: 72,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                   color: Color(0xff16B8FF), width: 1),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(16.0)),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: appPrimaryMaterialColor
//                                         .withOpacity(0.2),
//                                     blurRadius: 2.0,
//                                     spreadRadius: 2.0,
//                                     offset: Offset(3.0, 5.0))
//                               ]),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "assets/success.png",
//                                 // color: appPrimaryMaterialColor,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 2.0),
//                                 child: Text(
//                                   "Success Stories",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: appPrimaryMaterialColor,
//                                       fontSize: 12),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),

//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).pushNamed('/CalenderScreen');
//                         },
//                         child: Container(
//                           height: 72,
//                           width: 72,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                   color: Color(0xff16B8FF), width: 1),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(16.0)),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: appPrimaryMaterialColor
//                                         .withOpacity(0.2),
//                                     blurRadius: 2.0,
//                                     spreadRadius: 2.0,
//                                     offset: Offset(3.0, 5.0))
//                               ]),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "assets/calender.png",
//                                 // color: appPrimaryMaterialColor,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 5.0),
//                                 child: Text(
//                                   "Calendar",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: appPrimaryMaterialColor,
//                                       fontSize: 12),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               Padding(
//                 padding: const EdgeInsets.only(
//                     left: 25.0, right: 25, top: 5, bottom: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.of(context)
//                               .pushNamed('/BusinessCardScreen');
//                         },
//                         child: Container(
//                           height: 72,
//                           width: 72,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                   color: Color(0xff16B8FF), width: 1),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(16.0)),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: appPrimaryMaterialColor
//                                         .withOpacity(0.2),
//                                     blurRadius: 2.0,
//                                     spreadRadius: 2.0,
//                                     offset: Offset(3.0, 5.0))
//                               ]),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "assets/news.png",
//                                 // color: appPrimaryMaterialColor,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 2.0),
//                                 child: Text(
//                                   "Business Card",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: appPrimaryMaterialColor,
//                                       fontSize: 12),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),

//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).pushNamed('/BookMarkScreen');
//                         },
//                         child: Container(
//                           height: 72,
//                           width: 72,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                   color: Color(0xff16B8FF), width: 1),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(16.0)),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: appPrimaryMaterialColor
//                                         .withOpacity(0.2),
//                                     blurRadius: 2.0,
//                                     spreadRadius: 2.0,
//                                     offset: Offset(3.0, 5.0))
//                               ]),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "assets/bookmark.png",
//                                 // color: appPrimaryMaterialColor,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 5.0),
//                                 child: Text(
//                                   "Bookmark",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: appPrimaryMaterialColor,
//                                       fontSize: 12),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),

//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).pushNamed('/CategoryScreen');
//                         },
//                         child: Container(
//                           height: 72,
//                           width: 72,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                   color: Color(0xff16B8FF), width: 1),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(16.0)),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: appPrimaryMaterialColor
//                                         .withOpacity(0.2),
//                                     blurRadius: 2.0,
//                                     spreadRadius: 2.0,
//                                     offset: Offset(3.0, 5.0))
//                               ]),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "assets/category.png",
//                                 // color: appPrimaryMaterialColor,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 5.0),
//                                 child: Text(
//                                   "Category",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: appPrimaryMaterialColor,
//                                       fontSize: 12),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
          ],
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 20),
                        color: Colors.white,
                        child: QrImage(
                          data: "${qrData}",
                          size: 230.0,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Text(
                        "Scan this QRCode to get contact information.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    margin: EdgeInsets.only(bottom: 20, top: 5),
                    child: MaterialButton(
                      color: appPrimaryMaterialColor,
                      onPressed: () {
                        scanVisitor();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Scan QRCode",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  /*Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 2.3,
                          child: RaisedButton(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              elevation: 5,
                              textColor: Colors.white,
                              color: appPrimaryMaterialColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("Share",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15)),
                                  )
                                ],
                              ),
                              onPressed: () {
                                //_getViewCardId("no");
                                // bool val = true;
                                */ /*  if (val != null && val == true)
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      opaque: false,
                                      pageBuilder:
                                          (BuildContext context, _, __) =>
                                              CardShareComponent(
                                        memberId: cardData,
                                        memberName: name,
                                        isRegular: val,
                                        memberType: MemberType,
                                        shareMsg: ShareMsg,
                                        IsActivePayment: IsActivePayment,
                                      ),
                                    ),
                                  );
                                else
                                  showMsg(
                                      'Your trial is expired please contact to digital card team for renewal.\n\nThank you,\nRegards\nDigital Card');

                        },*/ /*
                              },
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0))),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.3,
                          child: RaisedButton(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              elevation: 5,
                              textColor: Colors.white,
                              color: appPrimaryMaterialColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("View Card",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15)),
                                  )
                                ],
                              ),
                              onPressed: () async {
                                // _getViewCardId("yes");
                              },
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0))),
                        )
                      ],
                    ),
                  ),*/
                ],
              ),
            ),
          );
        });
  }

  Widget custombox(
    String lable,
    String image,
    String screenName,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(screenName);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.13,
          width: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xff16B8FF), width: 1),
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              boxShadow: [
                BoxShadow(
                    color: appPrimaryMaterialColor.withOpacity(0.2),
                    blurRadius: 2.0,
                    spreadRadius: 2.0,
                    offset: Offset(3.0, 5.0))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                // color: appPrimaryMaterialColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: FittedBox(
                  // fit: BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      lable,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: appPrimaryMaterialColor, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _bannerImage() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          isBannerLoading = true;
        });
        var body = {};
        Services.PostForList(api_name: 'admin/getAllBanner').then(
            (bannerresponselist) async {
          setState(() {
            isBannerLoading = false;
          });
          if (bannerresponselist.length > 0) {
            setState(() {
              imgList = bannerresponselist;
              tabController =
                  TabController(length: imgList.length, vsync: this);
              //set "data" here to your variable
            });
          } else {
            Fluttertoast.showToast(msg: "Banner Not Found");
            //show "data not found" in dialog
          }
        }, onError: (e) {
          setState(() {
            isBannerLoading = false;
          });
          print("error on call -> ${e.message}");
          Fluttertoast.showToast(msg: "Something Went Wrong");
        });
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(msg: "No Internet Connection.");
    }
  }
}

class AlertboxLogout extends StatefulWidget {
  @override
  _AlertboxLogoutState createState() => _AlertboxLogoutState();
}

class _AlertboxLogoutState extends State<AlertboxLogout> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(
        "Logout",
        style: TextStyle(
          fontSize: 22,
          color: appPrimaryMaterialColor,
          // fontWeight: FontWeight.bold
        ),
      ),
      content: new Text(
        "Are you sure want to Logout!",
        style: TextStyle(
            fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        FlatButton(
          child: new Text(
            "Cancel",
            style: TextStyle(color: appPrimaryMaterialColor, fontSize: 18),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        new FlatButton(
          child: new Text(
            "Ok",
            style: TextStyle(color: appPrimaryMaterialColor, fontSize: 18),
          ),
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.clear();
            Navigator.pushNamedAndRemoveUntil(
                context, '/LoginScreen', (route) => false);
          },
        ),
      ],
    );
  }
}

class ScanAlert extends StatefulWidget {
  @override
  _ScanAlertState createState() => _ScanAlertState();
}

class _ScanAlertState extends State<ScanAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(
        "Scan",
        style: TextStyle(
          fontSize: 22,
          color: appPrimaryMaterialColor,
          // fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
