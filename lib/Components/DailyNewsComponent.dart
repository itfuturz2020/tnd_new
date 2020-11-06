import 'dart:developer';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_national_dawn/Common/Constants.dart';
import 'package:the_national_dawn/Screens/PopularNewsScreen.dart';

class DailyNewsComponent extends StatefulWidget {
  @override
  _DailyNewsComponentState createState() => _DailyNewsComponentState();
}

class _DailyNewsComponentState extends State<DailyNewsComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, top: 3),
            child: Text(
              "Featured",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              height: 170,
              decoration: BoxDecoration(
                //color: Colors.grey[100],
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Carousel(
                    boxFit: BoxFit.fill,
                    autoplay: false,
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(milliseconds: 1500),
                    dotSize: 0.0,
                    borderRadius: true,
                    dotIncreasedColor: Color(0xFF9f782d),
                    dotBgColor: Colors.transparent,
                    dotPosition: DotPosition.bottomCenter,
                    dotVerticalPadding: 10.0,
                    showIndicator: false,
                    indicatorBgPadding: 7.0,
                    dotColor: Colors.grey,
                    onImageChange: (a, b) {
                      log(a.toString());
                      log(b.toString());
                      setState(() {
                        //skip = b;
                      });
                    },
                    images: [
                      AssetImage("assets/z.jpeg"),
                      AssetImage("assets/z.jpeg"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 22,
                      decoration: BoxDecoration(
                        color: appPrimaryMaterialColor,
                        // border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      width: 80,
                      child: Center(
                        child: Text(
                          "celebrity",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 22,
                        decoration: BoxDecoration(
                          color: Colors.transparent.withBlue(2),
                          // border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        width: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 14,
                            ),
                            Text(
                              "10k",
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xff4B4B4B4A),
                          //color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(18.0),
                              bottomRight: Radius.circular(18.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Text(
                                  "Katrina kaif goes in long drive that does not make me \nsmile.",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      letterSpacing: 0.1),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.timer,
                                    size: 14,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "11 september 2019",
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 0.5,
                                        fontSize: 8),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular News",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 23,
                )
              ],
            ),
          ),
          ListView.builder(
              //scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PopularNewsScreen()));
                    },
                    child: Container(
                      height: 121,
                      decoration: BoxDecoration(
                        //color: ColorUtils.buttonDarkBlueColor,
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.white,
                            blurRadius: 4.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      child: Card(
                        elevation: 02.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, top: 10.0, right: 5),
                                    child: Text(
                                      "Developer pays Due due to corona pandemic ",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.4),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13.0),
                                    child: Container(
                                      height: 22,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        //color: Color(0xff4B4B4BE6),
                                        color: Colors.grey[600],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14.0)),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "Explore",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
//                                    SizedBox(
//                                      height: 8,
//                                    ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 13.0,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
//                                      mainAxisAlignment:
//                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.timer,
                                          size: 14,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "11 September 2020",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 8),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 121,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 8.0, bottom: 3, top: 3),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: Image.asset(
                                        "assets/10.jpeg",
                                        height: 91,
                                        width: 95,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                            height: 13,
                                            child: Image.asset(
                                                "assets/whatsapp.png")),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                            height: 13,
                                            child: Image.asset(
                                                "assets/share.png")),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                            height: 15,
                                            child: Icon(
                                              Icons.favorite,
                                              size: 14,
                                              color: Colors.red,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
