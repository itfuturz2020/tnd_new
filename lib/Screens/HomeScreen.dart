import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_slider/image_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_national_dawn/Common/Constants.dart';
import 'package:the_national_dawn/Common/Services.dart';
import 'package:the_national_dawn/Components/LoadingBlueComponent.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    _bannerImage();
    // tabController = TabController(length: 3, vsync: this);
  }

  List imgList = [];
  bool isBannerLoading = true;

  List<String> links = [
    "assets/splash.png",
    "assets/splash.png",
    "assets/splash.png",
  ];

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertboxLogout();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 18, bottom: 19),
              child: Image.asset("assets/scan.png"),
            ),
            Image.asset("assets/bell.png"),
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
                            Image_URL + link["image"],
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
              Padding(
                padding: const EdgeInsets.only(left: 35.0, right: 35, top: 25),
                child: Container(
                  height: 35,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 15),
                    cursorColor: appPrimaryMaterialColor,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        size: 25,
                        color: Colors.black,
                      ),

//                    Padding(
//                      padding: const EdgeInsets.only(right: 5.0, top: 0),
//                      child: Image.asset("assets/search.png"),
//                    ),
                      counterText: "",
                      contentPadding: EdgeInsets.only(
                          top: 0.0, bottom: 0, left: 15, right: 5),
                      hintText: "Type to Search...",
                      hintStyle: TextStyle(
                          color: Colors.grey[400], fontWeight: FontWeight.w500),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/DailyNewScreen');
                        },
                        child: Container(
                          height: 72,
                          width: 72,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color(0xff16B8FF), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: appPrimaryMaterialColor
                                        .withOpacity(0.2),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(3.0, 5.0))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/news.png",
                                // color: appPrimaryMaterialColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "Daily News",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: appPrimaryMaterialColor,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/NetworkScreen');
                        },
                        child: Container(
                          height: 72,
                          width: 72,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color(0xff16B8FF), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: appPrimaryMaterialColor
                                        .withOpacity(0.2),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(3.0, 5.0))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/network.png",
                                // color: appPrimaryMaterialColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "Networking",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: appPrimaryMaterialColor,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/DirectoryScreen');
                        },
                        child: Container(
                          height: 72,
                          width: 72,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color(0xff16B8FF), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: appPrimaryMaterialColor
                                        .withOpacity(0.2),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(3.0, 5.0))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/directory.png",
                                // color: appPrimaryMaterialColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "Directory",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: appPrimaryMaterialColor,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/OfferScreen');
                        },
                        child: Container(
                          height: 72,
                          width: 72,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color(0xff16B8FF), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: appPrimaryMaterialColor
                                        .withOpacity(0.2),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(3.0, 5.0))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/offers.png",
                                // color: appPrimaryMaterialColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "Offers",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: appPrimaryMaterialColor,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/StoriesScreen');
                        },
                        child: Container(
                          height: 72,
                          width: 72,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color(0xff16B8FF), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: appPrimaryMaterialColor
                                        .withOpacity(0.2),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(3.0, 5.0))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/success.png",
                                // color: appPrimaryMaterialColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(
                                  "Success Stories",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: appPrimaryMaterialColor,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/CalenderScreen');
                        },
                        child: Container(
                          height: 72,
                          width: 72,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color(0xff16B8FF), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: appPrimaryMaterialColor
                                        .withOpacity(0.2),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(3.0, 5.0))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/calender.png",
                                // color: appPrimaryMaterialColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "Calendar",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: appPrimaryMaterialColor,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25, top: 5, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/BusinessCardScreen');
                        },
                        child: Container(
                          height: 72,
                          width: 72,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color(0xff16B8FF), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: appPrimaryMaterialColor
                                        .withOpacity(0.2),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(3.0, 5.0))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/news.png",
                                // color: appPrimaryMaterialColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(
                                  "Business Card",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: appPrimaryMaterialColor,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/BookMarkScreen');
                        },
                        child: Container(
                          height: 72,
                          width: 72,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color(0xff16B8FF), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: appPrimaryMaterialColor
                                        .withOpacity(0.2),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(3.0, 5.0))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/bookmark.png",
                                // color: appPrimaryMaterialColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "Bookmark",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: appPrimaryMaterialColor,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/CategoryScreen');
                        },
                        child: Container(
                          height: 72,
                          width: 72,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color(0xff16B8FF), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: appPrimaryMaterialColor
                                        .withOpacity(0.2),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(3.0, 5.0))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/category.png",
                                // color: appPrimaryMaterialColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "Category",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: appPrimaryMaterialColor,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
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
