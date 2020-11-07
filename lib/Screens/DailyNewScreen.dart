import 'dart:io';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:the_national_dawn/Common/Constants.dart';
import 'package:the_national_dawn/Common/Services.dart';
import 'package:the_national_dawn/Components/DailyNewsComponent.dart';
import 'package:the_national_dawn/Components/LoadingBlueComponent.dart';

class DailyNewScreen extends StatefulWidget {
  @override
  _DailyNewScreenState createState() => _DailyNewScreenState();
}

class _DailyNewScreenState extends State<DailyNewScreen>
    with TickerProviderStateMixin {
  TabController _tabController;
  TabController tabController;
  List subCategoriesTab = [];
  List subCategoriesList = [];
  List imgList = [];
  bool isLoadingCat = true;
  bool isLoadingNews = false;

  @override
  void initState() {
    super.initState();
    _newsCatTab();
//    _tabController = TabController(
//      vsync: this,
//      length: 5,
//      initialIndex: 0,
//    );
  }

  _tabCon() {
    _tabController = TabController(
      vsync: this,
      length: subCategoriesTab.length,
    );
    _tabController.addListener(() {
      _newsCategory(subCategoriesTab[_tabController.index]["_id"]);
    });
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
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
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
      body: isLoadingCat
          ? LoadingBlueComponent()
          : Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        //scroll tabbar
                        height: 50.0,
                        child: TabBar(
                          isScrollable: true,
                          controller: _tabController,
                          unselectedLabelColor: Colors.black,
                          labelColor: appPrimaryMaterialColor,
                          indicatorColor: appPrimaryMaterialColor,
                          onTap: (index) {
                            _newsCategory(subCategoriesTab[index]["_id"]);
                          },
                          //labelPadding: EdgeInsets.symmetric(horizontal: 8),
                          tabs: List<Widget>.generate(subCategoriesTab.length,
                              (int index) {
                            return Tab(
                              child: Text(
                                subCategoriesTab[index]["newsType"],
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 14.0),
                              ),
                            );
                          }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 35.0, right: 35, top: 25),
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
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.w500),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: TabBarView(
                          physics: BouncingScrollPhysics(),
                          controller: _tabController,
                          children: List<Widget>.generate(
                              subCategoriesTab.length, (int index) {
                            return isLoadingNews
                                ? Center(
                                    child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        appPrimaryMaterialColor),
                                  ))
                                : SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 18.0, left: 15, right: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
//                                          ImageSlider(
//                                            /// Shows the tab indicating circles at the bottom
//                                            showTabIndicator: true,
//
//                                            /// Cutomize tab's colors
//                                            tabIndicatorColor: Colors.grey[400],
//
//                                            /// Customize selected tab's colors
//                                            tabIndicatorSelectedColor:
//                                                Colors.black,
//
//                                            /// Height of the indicators from the bottom
//                                            tabIndicatorHeight: 16,
//
//                                            /// Size of the tab indicator circles
//                                            tabIndicatorSize: 12,
//
//                                            /// tabController for walkthrough or other implementations
//                                            tabController: tabController,
//
//                                            /// Animation curves of sliding
//                                            curve: Curves.fastOutSlowIn,
//
//                                            /// Width of the slider
//                                            width: MediaQuery.of(context)
//                                                .size
//                                                .width,
//
//                                            /// Height of the slider
//                                            height: 200,
//
//                                            /// If automatic sliding is required
//                                            autoSlide: true,
//
//                                            /// Time for automatic sliding
//                                            duration: new Duration(seconds: 7),
//
//                                            /// If manual sliding is required
//                                            allowManualSlide: true,
//
//                                            /// Children in slideView to slide
//                                            children: imgList.map((link) {
//                                              return Stack(
//                                                children: [
//                                                  FadeInImage.assetNetwork(
//                                                    placeholder:
//                                                        'assets/z.jpeg',
//                                                    image: Image_URL +
//                                                        link["newsImage"],
//                                                  ),
////                                                    Image.network(Image_URL +
////                                                        link["newsImage"]),
//                                                  Padding(
//                                                    padding:
//                                                        const EdgeInsets.all(
//                                                            8.0),
//                                                    child: Container(
//                                                      height: 22,
//                                                      decoration: BoxDecoration(
//                                                        color:
//                                                            appPrimaryMaterialColor,
//                                                        // border: Border.all(color: Colors.black, width: 1),
//                                                        borderRadius:
//                                                            BorderRadius.all(
//                                                                Radius.circular(
//                                                                    15.0)),
//                                                      ),
//                                                      width: 80,
//                                                      child: Center(
//                                                        child: Text(
//                                                          link["newsType"]
//                                                              ["newsType"],
//                                                          overflow: TextOverflow
//                                                              .ellipsis,
//                                                          style: TextStyle(
//                                                              color:
//                                                                  Colors.white,
//                                                              fontSize: 12),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                  ),
//                                                  Align(
//                                                    alignment:
//                                                        Alignment.topRight,
//                                                    child: Padding(
//                                                      padding:
//                                                          const EdgeInsets.all(
//                                                              8.0),
//                                                      child: Container(
//                                                        height: 22,
//                                                        decoration:
//                                                            BoxDecoration(
//                                                          color: Colors
//                                                              .transparent
//                                                              .withBlue(2),
//                                                          // border: Border.all(color: Colors.black, width: 1),
//                                                          borderRadius:
//                                                              BorderRadius.all(
//                                                                  Radius
//                                                                      .circular(
//                                                                          15.0)),
//                                                        ),
//                                                        width: 60,
//                                                        child: Row(
//                                                          mainAxisAlignment:
//                                                              MainAxisAlignment
//                                                                  .center,
//                                                          children: [
//                                                            Icon(
//                                                              Icons.star,
//                                                              color:
//                                                                  Colors.white,
//                                                              size: 14,
//                                                            ),
//                                                            Text(
//                                                              "10k",
//                                                              overflow:
//                                                                  TextOverflow
//                                                                      .ellipsis,
//                                                              style: TextStyle(
//                                                                  color: Colors
//                                                                      .white,
//                                                                  fontSize: 12),
//                                                            ),
//                                                          ],
//                                                        ),
//                                                      ),
//                                                    ),
//                                                  ),
//                                                  Positioned(
//                                                      bottom: 0.0,
//                                                      left: 0.0,
//                                                      child: Container(
//                                                        height: 60,
//                                                        width: MediaQuery.of(
//                                                                context)
//                                                            .size
//                                                            .width,
//                                                        decoration:
//                                                            BoxDecoration(
//                                                          color: Color(
//                                                              0xff4B4B4B4A),
//                                                          //color: Colors.transparent,
////                                                              borderRadius:
////                                                              BorderRadius.only(
////                                                                  bottomLeft: Radius
////                                                                      .circular(
////                                                                      18.0),
////                                                                  bottomRight: Radius
////                                                                      .circular(
////                                                                      18.0)),
//                                                        ),
//                                                        child: Padding(
//                                                          padding:
//                                                              const EdgeInsets
//                                                                      .only(
//                                                                  left: 12.0,
//                                                                  right: 14),
//                                                          child: Column(
//                                                            crossAxisAlignment:
//                                                                CrossAxisAlignment
//                                                                    .start,
//                                                            children: <Widget>[
//                                                              SizedBox(
//                                                                height: 5,
//                                                              ),
//                                                              Container(
//                                                                child: Text(
//                                                                  link[
//                                                                      "content"],
//                                                                  style: TextStyle(
//                                                                      color: Colors
//                                                                          .white,
//                                                                      fontSize:
//                                                                          11,
//                                                                      letterSpacing:
//                                                                          0.1),
//                                                                ),
//                                                              ),
//                                                              SizedBox(
//                                                                height: 5,
//                                                              ),
//                                                              Row(
//                                                                children: <
//                                                                    Widget>[
//                                                                  Icon(
//                                                                    Icons.timer,
//                                                                    size: 14,
//                                                                    color: Colors
//                                                                        .grey,
//                                                                  ),
//                                                                  Text(
//                                                                    "11 september 2019",
//                                                                    style: TextStyle(
//                                                                        color: Colors
//                                                                            .white,
//                                                                        letterSpacing:
//                                                                            0.5,
//                                                                        fontSize:
//                                                                            8),
//                                                                  )
//                                                                ],
//                                                              ),
//                                                              SizedBox(
//                                                                height: 5,
//                                                              ),
//                                                            ],
//                                                          ),
//                                                        ),
//                                                      )),
//                                                ],
//                                              );
//                                            }).toList(),
//                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0, top: 3),
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
                                              border: Border.all(
                                                  color: Colors.grey[200],
                                                  width: 2),
//                                                borderRadius: BorderRadius.all(
//                                                    Radius.circular(10.0)),
                                            ),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Carousel(
                                              boxFit: BoxFit.cover,
                                              autoplay: true,
                                              animationCurve:
                                                  Curves.fastOutSlowIn,
                                              animationDuration:
                                                  Duration(milliseconds: 1500),
                                              dotSize: 0.0,
                                              //  borderRadius: true,
                                              dotIncreasedColor:
                                                  Color(0xFF9f782d),
                                              dotBgColor: Colors.transparent,
                                              dotPosition:
                                                  DotPosition.bottomCenter,
                                              dotVerticalPadding: 10.0,
                                              showIndicator: false,
                                              indicatorBgPadding: 7.0,
                                              dotColor: Colors.grey,
                                              onImageChange: (a, b) {
//                                                    log(a.toString());
//                                                    log(b.toString());
                                                setState(() {
                                                  //skip = b;
                                                });
                                              },
                                              images: imgList.map((link) {
                                                return Stack(
                                                  children: [
                                                    FadeInImage.assetNetwork(
                                                      placeholder:
                                                          'assets/z.jpeg',
                                                      image: Image_URL +
                                                          link["newsImage"],
                                                    ),
//                                                    Image.network(Image_URL +
//                                                        link["newsImage"]),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        height: 22,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              appPrimaryMaterialColor,
                                                          // border: Border.all(color: Colors.black, width: 1),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15.0)),
                                                        ),
                                                        width: 80,
                                                        child: Center(
                                                          child: Text(
                                                            link["newsType"]
                                                                ["newsType"],
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          height: 22,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .transparent
                                                                .withBlue(2),
                                                            // border: Border.all(color: Colors.black, width: 1),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        15.0)),
                                                          ),
                                                          width: 60,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .white,
                                                                size: 14,
                                                              ),
                                                              Text(
                                                                "10k",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12),
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
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xff4B4B4B4A),
                                                            //color: Colors.transparent,
//                                                              borderRadius:
//                                                              BorderRadius.only(
//                                                                  bottomLeft: Radius
//                                                                      .circular(
//                                                                      18.0),
//                                                                  bottomRight: Radius
//                                                                      .circular(
//                                                                      18.0)),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 12.0,
                                                                    right: 14),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Container(
                                                                  child: Text(
                                                                    link[
                                                                        "content"],
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            11,
                                                                        letterSpacing:
                                                                            0.1),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Icon(
                                                                      Icons
                                                                          .timer,
                                                                      size: 14,
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                    Text(
                                                                      "11 september 2019",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          letterSpacing:
                                                                              0.5,
                                                                          fontSize:
                                                                              8),
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
                                                );
                                              }).toList(),

//                                              [
//                                                Stack(
//                                                  children: [
//                                                    Image.network(
//                                                        "assets/z.jpeg"),
//                                                    Padding(
//                                                      padding:
//                                                          const EdgeInsets.all(
//                                                              8.0),
//                                                      child: Container(
//                                                        height: 22,
//                                                        decoration:
//                                                            BoxDecoration(
//                                                          color:
//                                                              appPrimaryMaterialColor,
//                                                          // border: Border.all(color: Colors.black, width: 1),
//                                                          borderRadius:
//                                                              BorderRadius.all(
//                                                                  Radius
//                                                                      .circular(
//                                                                          15.0)),
//                                                        ),
//                                                        width: 80,
//                                                        child: Center(
//                                                          child: Text(
//                                                            "celebrity",
//                                                            overflow:
//                                                                TextOverflow
//                                                                    .ellipsis,
//                                                            style: TextStyle(
//                                                                color: Colors
//                                                                    .white,
//                                                                fontSize: 12),
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Align(
//                                                      alignment:
//                                                          Alignment.topRight,
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                .all(8.0),
//                                                        child: Container(
//                                                          height: 22,
//                                                          decoration:
//                                                              BoxDecoration(
//                                                            color: Colors
//                                                                .transparent
//                                                                .withBlue(2),
//                                                            // border: Border.all(color: Colors.black, width: 1),
//                                                            borderRadius:
//                                                                BorderRadius.all(
//                                                                    Radius.circular(
//                                                                        15.0)),
//                                                          ),
//                                                          width: 60,
//                                                          child: Row(
//                                                            mainAxisAlignment:
//                                                                MainAxisAlignment
//                                                                    .center,
//                                                            children: [
//                                                              Icon(
//                                                                Icons.star,
//                                                                color: Colors
//                                                                    .white,
//                                                                size: 14,
//                                                              ),
//                                                              Text(
//                                                                "10k",
//                                                                overflow:
//                                                                    TextOverflow
//                                                                        .ellipsis,
//                                                                style: TextStyle(
//                                                                    color: Colors
//                                                                        .white,
//                                                                    fontSize:
//                                                                        12),
//                                                              ),
//                                                            ],
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Positioned(
//                                                        bottom: 0.0,
//                                                        left: 0.0,
//                                                        child: Container(
//                                                          height: 60,
//                                                          width: MediaQuery.of(
//                                                                  context)
//                                                              .size
//                                                              .width,
//                                                          decoration:
//                                                              BoxDecoration(
//                                                            color: Color(
//                                                                0xff4B4B4B4A),
//                                                            //color: Colors.transparent,
////                                                              borderRadius:
////                                                              BorderRadius.only(
////                                                                  bottomLeft: Radius
////                                                                      .circular(
////                                                                      18.0),
////                                                                  bottomRight: Radius
////                                                                      .circular(
////                                                                      18.0)),
//                                                          ),
//                                                          child: Padding(
//                                                            padding:
//                                                                const EdgeInsets
//                                                                        .only(
//                                                                    left: 12.0,
//                                                                    right: 14),
//                                                            child: Column(
//                                                              crossAxisAlignment:
//                                                                  CrossAxisAlignment
//                                                                      .start,
//                                                              children: <
//                                                                  Widget>[
//                                                                SizedBox(
//                                                                  height: 5,
//                                                                ),
//                                                                Container(
//                                                                  child: Text(
//                                                                    "Katrina kaif goes in long drive that does not make me \nsmile.",
//                                                                    style: TextStyle(
//                                                                        color: Colors
//                                                                            .white,
//                                                                        fontSize:
//                                                                            11,
//                                                                        letterSpacing:
//                                                                            0.1),
//                                                                  ),
//                                                                ),
//                                                                SizedBox(
//                                                                  height: 5,
//                                                                ),
//                                                                Row(
//                                                                  children: <
//                                                                      Widget>[
//                                                                    Icon(
//                                                                      Icons
//                                                                          .timer,
//                                                                      size: 14,
//                                                                      color: Colors
//                                                                          .grey,
//                                                                    ),
//                                                                    Text(
//                                                                      "11 september 2019",
//                                                                      style: TextStyle(
//                                                                          color: Colors
//                                                                              .white,
//                                                                          letterSpacing:
//                                                                              0.5,
//                                                                          fontSize:
//                                                                              8),
//                                                                    )
//                                                                  ],
//                                                                ),
//                                                                SizedBox(
//                                                                  height: 5,
//                                                                ),
//                                                              ],
//                                                            ),
//                                                          ),
//                                                        )),
//                                                  ],
//                                                ),
//                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0, top: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Popular News",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              // scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  subCategoriesList.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return DailyNewsComponent(
                                                  newsData:
                                                      subCategoriesList[index],
                                                );
                                              }),
                                        ],
                                      ),
                                    ),
                                  );
                          }),
                        ),

//                  TabBarView(
//                    //contents
//                    controller: _tabController,
//                    children: [
//                      SingleChildScrollView(
//                        physics: BouncingScrollPhysics(),
//                        child: Container(
//                          child: Padding(
//                            padding: const EdgeInsets.only(
//                                top: 10.0, left: 15, right: 15),
//                            child: DailyNewsComponent(),
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  _newsCatTab() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Services.PostForList(api_name: 'admin/getNewsCategory').then(
            (tabResponseList) async {
          setState(() {
            isLoadingCat = false;
          });
          if (tabResponseList.length > 0) {
            setState(() {
              subCategoriesTab = tabResponseList;
              //set "data" here to your variable
            });

            _newsCategory(tabResponseList[0]["_id"]);
            _tabCon();
          } else {
            setState(() {
              isLoadingCat = false;
            });
            Fluttertoast.showToast(msg: "Product Not Found");
            //show "data not found" in dialog
          }
        }, onError: (e) {
          setState(() {
            isLoadingCat = false;
          });
          print("error on call -> ${e.message}");
          Fluttertoast.showToast(msg: "Something Went Wrong");
        });
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(msg: "No Internet Connection.");
    }
  }

  _newsCategory(var subcatId) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          isLoadingNews = true;
        });

        var body = {"id": "${subcatId}"};

        // print(body.fields);
        Services.PostForList(api_name: 'admin/getNewsOfCategory', body: body)
            .then((subCatResponseList) async {
          setState(() {
            isLoadingNews = false;
          });
          if (subCatResponseList.length > 0) {
            setState(() {
              subCategoriesList = subCatResponseList;

              //set "data" here to your variable
            });
            for (var i = 0; i <= subCatResponseList.length; i++) {
              if (subCatResponseList[i]["trending"] == true) {
                setState(() {
                  imgList.add(subCatResponseList[i]);
                  tabController =
                      TabController(length: imgList.length, vsync: this);
                });
              }
            }
          } else {
            setState(() {
              subCategoriesList = [];
            });
            Fluttertoast.showToast(msg: "Data Not Found");
            //show "data not found" in dialog
          }
        }, onError: (e) {
          setState(() {
            isLoadingNews = false;
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
