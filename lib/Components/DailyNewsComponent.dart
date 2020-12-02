import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_national_dawn/Common/Constants.dart';
import 'package:the_national_dawn/Screens/PopularNewsScreen.dart';

class DailyNewsComponent extends StatefulWidget {
  var newsData;

  DailyNewsComponent({this.newsData});

  @override
  _DailyNewsComponentState createState() => _DailyNewsComponentState();
}

class _DailyNewsComponentState extends State<DailyNewsComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PopularNewsScreen(
                newsData: widget.newsData,
              ),
            ),
          );
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 10.0, right: 5),
                        child: Text(
                          "${widget.newsData["headline"]} ",
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
                        padding: const EdgeInsets.only(left: 13.0, right: 0),
                        child: Container(
                          height: 22,
                          width: 120,
                          decoration: BoxDecoration(
                            //color: Color(0xff4B4B4BE6),
                            color: Colors.grey[600],
                            borderRadius:
                                BorderRadius.all(Radius.circular(14.0)),
                          ),
                          child: Center(
                              child: Text(
                            "${widget.newsData["newsType"]["newsType"]} ",
                            overflow: TextOverflow.ellipsis,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
//                                      mainAxisAlignment:
//                                          MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.timer,
                              size: 14,
                              color: Colors.grey,
                            ),
                            Text(
                              "${widget.newsData["newsDate"] + widget.newsData["newsTime"]}",
                              style: TextStyle(color: Colors.grey, fontSize: 8),
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
                    padding:
                        const EdgeInsets.only(right: 8.0, bottom: 3, top: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.network(
                            "${widget.newsData["newsImage"]} ",
                            height: 91,
                            width: 95,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                height: 13,
                                child: Image.asset("assets/whatsapp.png")),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                                height: 13,
                                child: Image.asset("assets/share.png")),
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
  }
}
