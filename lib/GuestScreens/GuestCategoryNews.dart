import 'package:flutter/material.dart';
import 'package:the_national_dawn/Common/Constants.dart';

class GuestCategoryNews extends StatefulWidget {
  var title;

  GuestCategoryNews({this.title});

  @override
  _GuestCategoryNewsState createState() => _GuestCategoryNewsState();
}

class _GuestCategoryNewsState extends State<GuestCategoryNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        // elevation: 0,
        title: FittedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5),
            child: Text(
              "${widget.title}",
              style: TextStyle(
                  color: appPrimaryMaterialColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        iconTheme: new IconThemeData(color: Colors.black),
      ),
    );
  }
}
