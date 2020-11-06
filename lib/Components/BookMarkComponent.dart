import 'package:flutter/material.dart';

class BookMarkComponent extends StatefulWidget {
  @override
  _BookMarkComponentState createState() => _BookMarkComponentState();
}

class _BookMarkComponentState extends State<BookMarkComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        height: 150,
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
                        "Developer pays Due due to corona pandemic",
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
                          borderRadius: BorderRadius.all(Radius.circular(14.0)),
                        ),
                        child: Center(
                            child: Text(
                          "Mr. Arpit Shah",
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
                    Padding(
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
                            "11 September 2020",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
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
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    "assets/z.jpeg",
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
    );
  }
}
