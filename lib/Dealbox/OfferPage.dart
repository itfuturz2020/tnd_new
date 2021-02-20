import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:the_national_dawn/Common/Constants.dart';

import 'OfferPageDetails.dart';

class OfferPage extends StatefulWidget {
  @override
  _OfferPageState createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {

  List<String> listOfIcons = [
    "assets/z.jpeg",
    "assets/z.jpeg",
    "assets/z.jpeg",
    "assets/z.jpeg",
    "assets/z.jpeg",
    "assets/z.jpeg",

  ];

  List<String> listOfContent = [
    "Monil",
    "Rinki",
    "Chirag",
    "Divyan",
    "Girjesh",
    "Sunny",
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Offers",
          style: TextStyle(
            color: appPrimaryMaterialColor,
            fontSize: 18,
            //fontWeight: FontWeight.bold
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
      body: Column(
        children: [
          crousalContainer(),
          SizedBox(height: 20,),
          gridViewContainer()
        ],
      ),
    );
  }

  gridViewContainer(){
    return Expanded(
      child: Container(
        height: 300,
        child: GridView.builder(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0
            ),
            itemCount: 6,
            itemBuilder: (context,index) =>
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OfferPageDetails(
                      image: listOfIcons[index],
                      name: listOfContent[index],
                    )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey[700],width: 0.2)
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(listOfIcons[index],height: 60,width: 60,),
                          Text(listOfContent[index])
                        ],
                      ),
                    ),
                  ),
                )),
      ),
    );
  }

  crousalContainer() {
    return Container(
      height:MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      child: Carousel(
        dotPosition: DotPosition.bottomCenter,
        autoplay: true,
        dotColor: Colors.grey[200],
        dotIncreasedColor: Colors.white,
        dotBgColor: Colors.transparent,
        images: [
          new Image.asset(
            'assets/z.jpeg',
            fit: BoxFit.cover,
          ),
          new Image.asset(
            'assets/z.jpeg',
            fit: BoxFit.cover,
          ),
          new Image.asset(
            'assets/z.jpeg',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }



}
