import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_slider/image_slider.dart';
import 'package:the_national_dawn/Common/Constants.dart';
import 'package:the_national_dawn/Common/Services.dart';
import 'package:the_national_dawn/Components/LoadingBlueComponent.dart';
import 'package:the_national_dawn/Screens/NewsBannerDetail.dart';

class GuestBannerScreen extends StatefulWidget {
  List newsData;
  GuestBannerScreen({this.newsData});
  @override
  _GuestBannerScreenState createState() => _GuestBannerScreenState();
}

class _GuestBannerScreenState extends State<GuestBannerScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List imgList = [];
  bool isBannerLoading = true;

  @override
  void initState() {
    print("==================${widget.newsData}");
    tabController = TabController(length: widget.newsData.length, vsync: this);
    print("=========${widget.newsData.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [crousalContainer(), horizontalContainerList()],
    );
  }

  horizontalContainerList() {
    return Container(
      height: 220,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.newsData.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsBannerDetail(
                          newsData: widget.newsData[index],
                        ),
                      ));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 6.0, top: 6.0, bottom: 6.0),
                  child: Stack(children: [
                    Container(
                        height: 200,
                        width: 180,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[200],
                            //width: 8,
                          ),
                        ),
                        child:
                            widget.newsData[index]['featured_img_src'] == null
                                ? Image.asset('assets/LOGO1.png')
                                : Image.network(
                                    widget.newsData[index]['featured_img_src'],
                                    //width: MediaQuery.of(context).size.width,
                                    // height: MediaQuery.of(context).size.height * 0.5,
                                    fit: BoxFit.fill,
                                    // color: Color.fromRGBO(255, 255, 255, 0.5),
                                    // colorBlendMode: BlendMode.colorDodge
                                  )),
                    Positioned(
                        bottom: 10.0,
                        // / left: 0.0,
                        child: Container(
                          color: Colors.black54.withOpacity(0.3),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "${widget.newsData[index]["title"]}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ))
                  ]),
                ),
              )),
    );
  }

  crousalContainer() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      child: ImageSlider(
        /// Shows the tab indicating circles at the bottom
        showTabIndicator: true,

        /// Cutomize tab's colors
        tabIndicatorColor: Colors.grey[400],

        /// Customize selected tab's colors
        tabIndicatorSelectedColor: Colors.black,

        /// Height of the indicators from the bottom
        tabIndicatorHeight: 5,

        /// Size of the tab indicator circles
        tabIndicatorSize: 7,

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
        children: widget.newsData.map((link) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsBannerDetail(
                        newsData: link,
                      ),
                    ));
              },
              child: new Stack(
                children: [
                  ClipRRect(
                      // borderRadius: BorderRadius.circular(8.0),
                      child: link['featured_img_src'] == null
                          ? Center(child: Image.asset('assets/LOGO1.png'))
                          : Image.network(
                              link['featured_img_src'],
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.5,
                              fit: BoxFit.fill,
                            )),
                  Positioned(
                      bottom: 0.0,
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(left: 8, right: 8),
                        decoration: BoxDecoration(
                          color: Color(0xff4B4B4B4A),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              link["title"],
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  letterSpacing: 0.1),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      )),
                ],
              ));
        }).toList(),
      ),
    );
  }

  // _bannerImage() async {
  //   try {
  //     final result = await InternetAddress.lookup('google.com');
  //     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //       setState(() {
  //         isBannerLoading = true;
  //       });
  //       FormData body = FormData.fromMap({"news_category": "local-news"});
  //       Services.PostForList1(api_name: 'custom/slider_news', body: body).then(
  //           (bannerresponselist) async {
  //         setState(() {
  //           isBannerLoading = false;
  //         });
  //         if (bannerresponselist.length > 0) {
  //           setState(() {
  //             widget.newsData = bannerresponselist;
  //             tabController =
  //                 TabController(length: widget.newsData.length, vsync: this);
  //             //set "data" here to your variable
  //           });
  //           log("My Data" + widget.newsData.toString());
  //         } else {
  //           Fluttertoast.showToast(msg: "Banner Not Found");
  //           //show "data not found" in dialog
  //         }
  //       }, onError: (e) {
  //         setState(() {
  //           isBannerLoading = false;
  //         });
  //         print("error on call -> ${e.message}");
  //         Fluttertoast.showToast(msg: "Something Went Wrong");
  //       });
  //     }
  //   } on SocketException catch (_) {
  //     Fluttertoast.showToast(msg: "No Internet Connection.");
  //   }
  // }
}
