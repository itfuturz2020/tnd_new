import 'package:flutter/material.dart';
import 'package:the_national_dawn/Common/Constants.dart';

class OfferDetailScreen extends StatefulWidget {
  @override
  _OfferDetailScreenState createState() => _OfferDetailScreenState();
}

class _OfferDetailScreenState extends State<OfferDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Offers Details",
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
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
        child: ListView(
          children: [
            SizedBox(
              height: 18,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(context,MaterialPageRoute(builder:(context) =>Networking()));
              },
              child: Container(
                height: 180,
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
            SizedBox(
              height: 16,
            ),
            Text(
              "Offer Created By",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 250.0),
              child: Container(
                color: appPrimaryMaterialColor,
                height: 3,
              ),
            ),
            SizedBox(
              height: 15,
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                  height: 80,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey[200], width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/pic.png',
                              fit: BoxFit.cover,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text(
                          "IT Futurz InfoSolution",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: appPrimaryMaterialColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 22),
                        ),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Offer Expires On",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 250.0),
              child: Container(
                height: 3,
                width: 40,
                color: appPrimaryMaterialColor,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 35,
                      color: Color(0xff367a98),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Container(
                        height: 45,
                        child: Card(
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("16-Dec-2020",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18)),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    height: 45,
                    child: Card(
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("36 Days to Go",
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                      )),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Description",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 250.0),
              child: Container(
                height: 3,
                width: 40,
                color: appPrimaryMaterialColor,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur"
              " adipiscing elit. Donec blandit augue et "
              "leo condimentum imperdiet. In id suscipit augue. "
              "Aenean porttitor quis lacus eget molestie. Integer "
              "sodales quam ante, vel egestas ipsum luctus et. Fusce "
              "bibendum, dolor vel blandit pellentesque, ex justo "
              "posuere dui, a lobortis nisl ipsum nec libero. "
              "Aenean porttitor quis lacus eget molestie. Integer "
              "sodales quam ante, vel egestas ipsum luctus et. Fusce "
              "bibendum, dolor vel blandit pellentesque, ex justo "
              "posuere dui, a lobortis nisl ipsum nec libero. "
              "Aenean porttitor quis lacus eget molestie. Integer "
              "sodales quam ante, vel egestas ipsum luctus et. Fusce "
              "bibendum, dolor vel blandit pellentesque, ex justo "
              "posuere dui, a lobortis nisl ipsum nec libero. "
              "Aliquam non leo elit. Aliquam erat volutpat."
              " Vestibulum vestibulum dignissim scelerisque.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black, fontSize: 14, letterSpacing: 0.2),
            ),
          ],
        ),
      ),
    );
  }
}
