import 'dart:io';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:the_national_dawn/Common/Constants.dart';
import 'package:the_national_dawn/Common/Services.dart';
import 'package:the_national_dawn/Components/LoadingBlueComponent.dart';
import 'package:the_national_dawn/Components/SocialMediaComponent.dart';
import 'package:url_launcher/url_launcher.dart';

class BussinessStoryScreen extends StatefulWidget {
  @override
  _BussinessStoryScreenState createState() => _BussinessStoryScreenState();
}

class _BussinessStoryScreenState extends State<BussinessStoryScreen>
    with TickerProviderStateMixin {
  TabController _tabController;
  TabController tabController;
  List subCategoriesTab = [];
  List subCategoriesList = [];
  bool isLoadingCat = true;
  bool isLoadingNews = false;

  @override
  void initState() {
    super.initState();
    _newsCatTab();
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

  void launchwhatsapp({
    @required String phone,
    @required String message,
  }) async {
    String url() {
      if (Platform.isIOS) {
        return "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}";
      } else {
        return "whatsapp://send?phone=$phone&text=${Uri.parse(message)}";
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Business Stories",
            style: TextStyle(
              color: appPrimaryMaterialColor,
              fontSize: 18,
              //fontWeight: FontWeight.bold
            ),
          ),
        ),
        leading: Padding(
          padding:
              const EdgeInsets.only(top: 8.0, right: 0, left: 10, bottom: 8),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
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
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: isLoadingCat
          ? LoadingBlueComponent()
          : Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
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
                          tabs: List<Widget>.generate(subCategoriesTab.length,
                              (int index) {
                            return Tab(
                              child: Text(
                                subCategoriesTab[index]["categoryType"],
                                style: TextStyle(fontSize: 14.0),
                              ),
                            );
                          }),
                        ),
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
                                          isLoadingCat
                                              ? Center(
                                                  child: LoadingBlueComponent())
                                              : subCategoriesList.length > 0 &&
                                                      subCategoriesList != null
                                                  ? ListView.builder(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      // scrollDirection: Axis.horizontal,
                                                      itemCount:
                                                          subCategoriesList
                                                              .length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Flexible(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom:
                                                                        15.0),
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .padding
                                                                          .top +
                                                                      2,
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomCenter,
                                                                      children: [
                                                                        Container(
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                420,
                                                                            width:
                                                                                MediaQuery.of(context).size.width,
                                                                            child:
                                                                                Image.network(
                                                                              // "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202101/WhatsApp_Image_2021-01-02_at_1_1200x768.jpeg?size=483:271",
                                                                              "${subCategoriesList[index]["bussImage"]}",

                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                            height:
                                                                                40,
                                                                            width:
                                                                                MediaQuery.of(context).size.width,
                                                                            color: Colors.white,
                                                                            child: Padding(padding: const EdgeInsets.only(left: 15.0, right: 15, top: 25), child: Text(""))),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                    left: 15.0,
                                                                    right: 15.0,
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: <
                                                                          Widget>[
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(bottom: 8.0),
                                                                          child: Container(
//                                    height: 80,
                                                                              color: Colors.white,
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: <Widget>[
                                                                                  Container(
                                                                                    width: 80,
                                                                                    height: 80,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Colors.white,
                                                                                      border: Border.all(color: Colors.grey[200], width: 1),
                                                                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                                                    ),
                                                                                    child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(20),
                                                                                        child: Image.network(
                                                                                          //"https://akm-img-a-in.tosshub.com/indiatoday/images/story/202101/WhatsApp_Image_2021-01-02_at_1_1200x768.jpeg?size=483:271",
                                                                                          "${subCategoriesList[index]["bussImage"]}",
                                                                                          fit: BoxFit.cover,
                                                                                        )),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.only(left: 6.0),
                                                                                      child: Text(
                                                                                        //"Sourav Ganguly stable after primary angioplasty at Kolkata hospital",
                                                                                        "${subCategoriesList[index]["headline"]}",
//                                            maxLines: 2,
//                                            overflow: TextOverflow.ellipsis,
                                                                                        style: TextStyle(color: appPrimaryMaterialColor, fontWeight: FontWeight.w500, fontSize: 20),
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              )),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        SocialMediaComponent(
                                                                          facebook:
                                                                              "",
                                                                          instagram:
                                                                              "",
                                                                          linkedIn:
                                                                              "",
                                                                          twitter:
                                                                              "",
                                                                          whatsapp:
                                                                              "",
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text("Social Media links",
                                                                                style: TextStyle(fontSize: 12, color: Colors.grey)),
                                                                          ],
                                                                        ),
                                                                        Divider(),
                                                                        Text(
                                                                            //"Five Indian players have been placed in isolation after video emerged on social media of the group appearing to eat at an indoor venue on Friday in Melbourne Five Indian players have been placed in isolation after video emerged on social media of the group appearing to eat at an indoor venue on Friday in Melbourne.",
                                                                            "${subCategoriesList[index]["content"]}",
                                                                            textAlign: TextAlign
                                                                                .justify,
                                                                            style: TextStyle(
                                                                                color: Color(0xff010101),
                                                                                fontSize: 14,
                                                                                letterSpacing: 0)),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Divider(
                                                                          color:
                                                                              Colors.grey[200],
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      })
                                                  : Center(
                                                      child: Container(
                                                        //color: Color.fromRGBO(0, 0, 0, 0.6),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20,
                                                                vertical: 10),
                                                        child: Text(
                                                            "No Data Available",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color:
                                                                    appPrimaryMaterialColor)),
                                                      ),
                                                    )
                                        ],
                                      ),
                                    ),
                                  );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
//         ListView.builder(
//             physics: BouncingScrollPhysics(),
//             // scrollDirection: Axis.horizontal,
//             itemCount: 5,
//             itemBuilder: (BuildContext context,
//                 int index) {
//               return Padding(
//                 padding: const EdgeInsets.only(
//                     bottom: 15.0),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height:
//                       MediaQuery.of(context)
//                           .padding
//                           .top +
//                           2,
//                     ),
//                     Padding(
//                       padding:
//                       const EdgeInsets.all(
//                           8.0),
//                       child: Container(
//                         child: Stack(
//                           alignment: Alignment
//                               .bottomCenter,
//                           children: [
//                             Container(
//                               child: Container(
//                                 height: 420,
//                                 width:
//                                 MediaQuery.of(
//                                     context)
//                                     .size
//                                     .width,
//                                 child:
//                                 Image.network(
//                                   "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202101/WhatsApp_Image_2021-01-02_at_1_1200x768.jpeg?size=483:271",
//                                   //"${successStoriesList[index]["storyImage"]}",
//
//                                   fit: BoxFit
//                                       .contain,
//                                 ),
//                               ),
//                             ),
//                             Container(
//                                 height: 40,
//                                 width: MediaQuery
//                                     .of(
//                                     context)
//                                     .size
//                                     .width,
//                                 color:
//                                 Colors.white,
//                                 child: Padding(
//                                     padding: const EdgeInsets
//                                         .only(
//                                         left:
//                                         15.0,
//                                         right: 15,
//                                         top: 25),
//                                     child: Text(
//                                         ""))),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                       const EdgeInsets.only(
//                         left: 15.0,
//                         right: 15.0,
//                       ),
//                       child: Container(
//                         child: Column(
//                           crossAxisAlignment:
//                           CrossAxisAlignment
//                               .start,
//                           children: <Widget>[
//                             Padding(
//                               padding:
//                               const EdgeInsets
//                                   .only(
//                                   bottom:
//                                   8.0),
//                               child: Container(
// //                                    height: 80,
//                                   color: Colors
//                                       .white,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment
//                                         .spaceBetween,
//                                     children: <
//                                         Widget>[
//                                       Container(
//                                         width: 80,
//                                         height:
//                                         80,
//                                         decoration:
//                                         BoxDecoration(
//                                           color: Colors
//                                               .white,
//                                           border: Border.all(
//                                               color:
//                                               Colors.grey[200],
//                                               width: 1),
//                                           borderRadius:
//                                           BorderRadius.all(Radius.circular(20.0)),
//                                         ),
//                                         child: ClipRRect(
//                                             borderRadius: BorderRadius.circular(20),
//                                             child: Image.network(
//                                               "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202101/WhatsApp_Image_2021-01-02_at_1_1200x768.jpeg?size=483:271",
//                                               // "${successStoriesList[index]["storyImage"]}",
//                                               fit:
//                                               BoxFit.cover,
//                                             )),
//                                       ),
//                                       Expanded(
//                                         child:
//                                         Padding(
//                                           padding:
//                                           const EdgeInsets.only(left: 6.0),
//                                           child:
//                                           Text(
//                                             "Sourav Ganguly stable after primary angioplasty at Kolkata hospital",
//                                             // "${successStoriesList[index]["headline"]}",
// //                                            maxLines: 2,
// //                                            overflow: TextOverflow.ellipsis,
//                                             style: TextStyle(
//                                                 color: appPrimaryMaterialColor,
//                                                 fontWeight: FontWeight.w500,
//                                                 fontSize: 20),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   )),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             SocialMediaComponent(
//                               facebook: "",
//                               instagram: "",
//                               linkedIn: "",
//                               twitter: "",
//                               whatsapp: "",
//                             ),
//                             Row(
//                               mainAxisAlignment:
//                               MainAxisAlignment
//                                   .center,
//                               children: [
//                                 Text(
//                                     "Social Media links",
//                                     style: TextStyle(
//                                         fontSize:
//                                         12,
//                                         color: Colors
//                                             .grey)),
//                               ],
//                             ),
//                             Divider(),
//                             Text(
//                                 "Five Indian players have been placed in isolation after video emerged on social media of the group appearing to eat at an indoor venue on Friday in Melbourne Five Indian players have been placed in isolation after video emerged on social media of the group appearing to eat at an indoor venue on Friday in Melbourne.",
//                                 //  "${successStoriesList[index]["storyContent"]}",
//                                 textAlign:
//                                 TextAlign
//                                     .justify,
//                                 style: TextStyle(
//                                     color: Color(
//                                         0xff010101),
//                                     fontSize: 14,
//                                     letterSpacing:
//                                     0)),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Divider(
//                               color: Colors
//                                   .grey[200],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             })
      /*ListView.builder(
            physics: BouncingScrollPhysics(),
            // scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).padding.top + 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              child: Container(
                                height: 420,
                                width: MediaQuery.of(context).size.width,
                                child: Image.network(
                                  "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202101/WhatsApp_Image_2021-01-02_at_1_1200x768.jpeg?size=483:271",
                                  //"${successStoriesList[index]["storyImage"]}",

                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 15, top: 25),
                                    child: Text(""))),
//                               Positioned(
//                                   bottom: 15.0,
//                                   right: 10.0,
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       // Navigator.push(context,MaterialPageRoute(builder:(context) =>Offers()));
//                                     },
//                                     child: Container(
//                                       height: 74,
//                                       width: 74,
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         shape: BoxShape.circle,
//                                         boxShadow: [
//                                           BoxShadow(
//                                               blurRadius: 2,
//                                               color: Color(0xff16B8FF)
//                                                   .withOpacity(0.2),
//                                               spreadRadius: 3,
//                                               offset: Offset(1, 6))
//                                         ],
//                                       ),
//                                       child: CircleAvatar(
//                                           radius: 30.0,
//                                           backgroundColor: Colors.white,
//                                           child: Icon(Icons.star,
//                                               color: appPrimaryMaterialColor,
//                                               size: 45.0)
// //                            Image.asset("assets/Lheart.png"),
//                                           //Icon(Icons.favorite,color: Colors.red,size: 45.0,),
//                                           ),
//                                     ),
//                                   )
// //                      child: CircleAvatar(
// //                        radius: 40,
// //                          backgroundColor: Colors.white,
// //                          child: Icon(Icons.favorite,color: Colors.red,size: 45.0,))
//                                   ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                      ),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Container(
//                                    height: 80,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey[200],
                                              width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                        ),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202101/WhatsApp_Image_2021-01-02_at_1_1200x768.jpeg?size=483:271",
                                              // "${successStoriesList[index]["storyImage"]}",
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 6.0),
                                          child: Text(
                                            "Sourav Ganguly stable after primary angioplasty at Kolkata hospital",
                                            // "${successStoriesList[index]["headline"]}",
//                                            maxLines: 2,
//                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: appPrimaryMaterialColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SocialMediaComponent(
                              facebook: "",
                              instagram: "",
                              linkedIn: "",
                              twitter: "",
                              whatsapp: "",
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Social Media links",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey)),
                              ],
                            ),
                            Divider(),
                            Text(
                                "Five Indian players have been placed in isolation after video emerged on social media of the group appearing to eat at an indoor venue on Friday in Melbourne Five Indian players have been placed in isolation after video emerged on social media of the group appearing to eat at an indoor venue on Friday in Melbourne.",
                                //  "${successStoriesList[index]["storyContent"]}",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: Color(0xff010101),
                                    fontSize: 14,
                                    letterSpacing: 0)),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: Colors.grey[200],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            })
       */
    );
  }

  _newsCatTab() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Services.PostForList(api_name: 'admin/getbussCategory').then(
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
            print("===================");
            print(tabResponseList[0]["_id"]);
            _tabCon();
          } else {
            setState(() {
              isLoadingCat = false;
            });
            Fluttertoast.showToast(msg: "Data Not Found");
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

        var body = {
          "categoryid": "${subcatId}",
        };

        // print(body.fields);
        Services.PostForList(api_name: 'admin/getstorybyid', body: body).then(
            (subCatResponseList) async {
          setState(() {
            isLoadingNews = false;
          });
          if (subCatResponseList.length > 0) {
            setState(() {
              subCategoriesList = subCatResponseList;

              //set "data" here to your variable
            });
            // for (var i = 0; i <= subCatResponseList.length; i++) {
            //   if (subCatResponseList[i]["trending"] == true) {
            //     setState(() {
            //       imgList.add(subCatResponseList[i]);
            //       tabController =
            //           TabController(length: imgList.length, vsync: this);
            //     });
            //   }
            // }
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
