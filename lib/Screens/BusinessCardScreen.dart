import 'package:flutter/material.dart';
import 'package:the_national_dawn/Common/Constants.dart';

class BusinessCardScreen extends StatefulWidget {
  @override
  _BusinessCardScreenState createState() => _BusinessCardScreenState();
}

class _BusinessCardScreenState extends State<BusinessCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          "No Data Found",
          style: TextStyle(
            color: appPrimaryMaterialColor,
            fontSize: 20,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
