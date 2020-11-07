import 'package:flutter/material.dart';
import 'package:the_national_dawn/Common/Constants.dart';

class PopularNewsScreen extends StatefulWidget {
  var newsData;

  PopularNewsScreen({this.newsData});

  @override
  _PopularNewsScreenState createState() => _PopularNewsScreenState();
}

class _PopularNewsScreenState extends State<PopularNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 2,
            ),
            Container(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    child: Container(
                      height: 420,
                      width: MediaQuery.of(context).size.width,
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/TND Logo_PNG_Newspaper.png",
                        image: Image_URL + "${widget.newsData["newsImage"]}",
                      ),
                    ),
                  ),
                  Container(
                      height: 60,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 24,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: Colors.grey[100],
                                  ),
                                  child: Center(
                                      child: Text(
                                    "celebrity",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 11),
                                  )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 24,
                                  width: 65,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: Colors.grey[100],
                                  ),
                                  child: Center(
                                      child: Text(
                                    "ronaldo",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 11),
                                  )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.timer,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                Text(
                                  "12 september 2020",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 8),
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                  Positioned(
                      top: 8.0,
                      left: 8.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              color: Colors.grey[100],
                            ),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 30.0,
                            )),
                      )),
                  Positioned(
                      top: 8.0,
                      right: 8.0,
                      child: Container(
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Colors.grey[100],
                          ),
                          child: Icon(
                            Icons.share,
                            color: Colors.black,
                            size: 30.0,
                          ))),
                  Positioned(
                      bottom: 30.0,
                      right: 10.0,
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(context,MaterialPageRoute(builder:(context) =>Offers()));
                        },
                        child: Container(
                          height: 74,
                          width: 74,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: Color(0xff16B8FF).withOpacity(0.2),
                                  spreadRadius: 3,
                                  offset: Offset(1, 6))
                            ],
                          ),
                          child: CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.favorite,
                                  color: Colors.red, size: 45.0)
//                            Image.asset("assets/Lheart.png"),
                              //Icon(Icons.favorite,color: Colors.red,size: 45.0,),
                              ),
                        ),
                      )
//                      child: CircleAvatar(
//                        radius: 40,
//                          backgroundColor: Colors.white,
//                          child: Icon(Icons.favorite,color: Colors.red,size: 45.0,))
                      ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("${widget.newsData["headline"]}",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("${widget.newsData["content"]}",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Color(0xff010101),
                            fontSize: 14,
                            letterSpacing: 0)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
