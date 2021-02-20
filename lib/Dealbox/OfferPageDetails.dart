import 'package:flutter/material.dart';
import 'package:the_national_dawn/Common/Constants.dart';

import 'DealOffersDetails.dart';

class OfferPageDetails extends StatefulWidget {
  String image;
  String name;
  OfferPageDetails({this.image,this.name});
  @override
  _OfferPageDetailsState createState() => _OfferPageDetailsState();
}

class _OfferPageDetailsState extends State<OfferPageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Deal Offers",
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
      body: ListView.builder(
        itemCount: 1,
          itemBuilder: (context,index) =>
      Container(
        height: 200,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(widget.image),
                    ),
                    SizedBox(width: 30,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.name.toString(),
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                        SizedBox(
                          height: 3.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on,size: 20,color: Colors.grey[300],),
                            Text("Vip Road",style: TextStyle(color: Colors.grey[600]))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Description about offers",style: TextStyle(color: Colors.grey[600],),
                    maxLines: 3 ,),
                ),
                Divider(),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DealOffersDetails()));
                  },
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Center(
                        child: Text("VIEW MORE",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                )


              ],
            ),
          )

        ),
      )),
    );
  }
}
