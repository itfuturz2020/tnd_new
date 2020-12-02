import 'package:flutter/material.dart';
import 'package:the_national_dawn/Common/Constants.dart';
import 'package:the_national_dawn/Screens/BookMarkDetailScreen.dart';

class BookMarkComponent extends StatefulWidget {
  var bookmarkData;
  BookMarkComponent({this.bookmarkData});

  @override
  _BookMarkComponentState createState() => _BookMarkComponentState();
}

class _BookMarkComponentState extends State<BookMarkComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/BookMarkDetailScreen');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => new BookMarkDetailScreen(
                        bookmarkData: widget.bookmarkData,
                      )));
        },
        child: Container(
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
                        padding: const EdgeInsets.only(left: 16.0, top: 15.0),
                        child: Text(
                          "${widget.bookmarkData["newsId"]["headline"]}",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
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
                          height: 30,
                          width: 120,
                          decoration: BoxDecoration(
                            //color: Color(0xff4B4B4BE6),
                            color: Colors.grey[600],
                            borderRadius:
                                BorderRadius.all(Radius.circular(14.0)),
                          ),
                          child: Center(
                              child: Text(
                            "${widget.bookmarkData["userId"]["name"]}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                Icons.timer,
                                size: 16,
                                color: Colors.grey,
                              ),
                              Text(
                                "${widget.bookmarkData["newsId"]["newsDate"] + widget.bookmarkData["newsId"]["newsTime"]}}",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(
                      "${widget.bookmarkData["newsId"]["newsImage"]}",
                      height: 150,
                      width: 130,
                      fit: BoxFit.cover,
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
