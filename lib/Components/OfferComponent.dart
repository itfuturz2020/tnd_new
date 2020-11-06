import 'package:flutter/material.dart';
import 'package:the_national_dawn/Screens/OfferDetailScreen.dart';

class OfferComponent extends StatefulWidget {
  @override
  _OfferComponentState createState() => _OfferComponentState();
}

class _OfferComponentState extends State<OfferComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OfferDetailScreen()));
            },
            child: Container(
              height: 179,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/10.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            child: Container(
              height: 24,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                    topLeft: Radius.circular(12.0)),
                color: Color(0xff16B8FF3D),
              ),
              child: Center(
                  child: Text(
                "Category",
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: Container(
              height: 24,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12.0),
                    topLeft: Radius.circular(12.0)),
                color: Color(0xff16B8FF3D),
                //color: ColorUtils.buttonDarkBlueColor,
              ),
              child: Center(
                  child: Text(
                "Expires on: 12-Dec-2020",
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
