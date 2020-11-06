import 'package:flutter/material.dart';
import 'package:the_national_dawn/Common/Constants.dart';

class CategoryComponent extends StatefulWidget {
  @override
  _CategoryComponentState createState() => _CategoryComponentState();
}

class _CategoryComponentState extends State<CategoryComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: EdgeInsets.only(right: 5, left: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: appPrimaryMaterialColor[100], width: 1),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          boxShadow: [
            BoxShadow(
                color: appPrimaryMaterialColor.withOpacity(0.2),
                blurRadius: 2.0,
                spreadRadius: 2.0,
                offset: Offset(3.0, 5.0))
          ]),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.image,
              color: Colors.grey,
              size: 74,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Category Name",
              style: TextStyle(color: Colors.black, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
