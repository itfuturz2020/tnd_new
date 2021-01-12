import 'dart:io';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:the_national_dawn/Common/Constants.dart';
import 'package:the_national_dawn/Components/SocialMediaComponent.dart';
import 'package:url_launcher/url_launcher.dart';

class BussinessStoryScreen extends StatefulWidget {
  @override
  _BussinessStoryScreenState createState() => _BussinessStoryScreenState();
}

class _BussinessStoryScreenState extends State<BussinessStoryScreen> {
  TabController _tabController;
  launchSocialMediaUrl(var url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch ${url}';
    }
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
        body: ListView.builder(
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
        //Center(child: Text("Business Stories coming soon...!")),
        /* DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 5,
            ),
            Material(
              color: Colors.white,
              child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: new BubbleTabIndicator(
                    indicatorHeight: 43,
                    indicatorRadius: 6,
                    indicatorColor: appPrimaryMaterialColor[700],
                    tabBarIndicatorSize: TabBarIndicatorSize.tab,
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        'Personal',
                      ),
                    ),
                    Tab(
                      child: Text('Business'),
                    ),
                    Tab(
                      child: Text('More Info'),
                    ),
                  ]),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, top: 25),
                          child: Image.network(
                            "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202101/WhatsApp_Image_2021-01-02_at_1_1200x768.jpeg?size=483:271",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 20, right: 20),
                          child: Text(
                            "Sourav Ganguly stable after primary angioplasty at Kolkata hospital",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 20, right: 20),
                          child: Text(
                            "Five Indian players have been placed in isolation after video emerged on social media of the group appearing to eat at an indoor venue on Friday in Melbourne Five Indian players have been placed in isolation after video emerged on social media of the group appearing to eat at an indoor venue on Friday in Melbourne.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: SocialMediaComponent(
                            facebook: "",
                            instagram: "",
                            linkedIn: "",
                            twitter: "",
                            whatsapp: "",
                            mail: "",
                          ),
                        ),
                        */ /* Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Container(
                                  height: 40,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey[200], width: 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey[600]
                                                .withOpacity(0.2),
                                            blurRadius: 1.0,
                                            spreadRadius: 1.0,
                                            offset: Offset(3.0, 5.0))
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 3.0, right: 3, top: 3, bottom: 3),
                                    child: Image.asset('assets/whats.png'),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                */ /* */ /* _launchURL(
                                    widget.directoryData["email"], '', '');*/ /* */ /*
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Container(
                                  height: 40,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey[300], width : 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0, right: 4, top: 5, bottom: 5),
                                    child: Image.asset('assets/gmail.png'),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                */ /* */ /* launch(
                                    ('tel:// ${widget.directoryData["mobile"]}'));*/ /* */ /*
                              },
                              child: Container(
                                height: 40,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.grey[300], width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
//                                boxShadow: [
//                                  BoxShadow(
//                                      color: Colors.grey[600].withOpacity(0.2),
//                                      blurRadius: 1.0,
//                                      spreadRadius: 1.0,
//                                      offset: Offset(3.0, 5.0))
//                                ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4.0, right: 4, top: 4, bottom: 4),
                                  child: Image.asset(
                                    'assets/phone-call.png',
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),*/ /*
                      ],
                    ),
                  ),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),*/
        );
  }
}
