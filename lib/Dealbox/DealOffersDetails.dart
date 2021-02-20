import 'package:flutter/material.dart';
import 'package:the_national_dawn/Common/Constants.dart';

class DealOffersDetails extends StatefulWidget {
  @override
  _DealOffersDetailsState createState() => _DealOffersDetailsState();
}

class _DealOffersDetailsState extends State<DealOffersDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Offer Description",
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
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
     Padding(
         padding: const EdgeInsets.all(12.0),
         child: Container(
           height: 100,
           decoration: BoxDecoration(
             color: Colors.grey[200],
             border: Border.all(color: Colors.grey[100])
           ),
           child:  Padding(
             padding: const EdgeInsets.all(20.0),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 CircleAvatar(
                   radius: 30,
                   backgroundImage: AssetImage("assets/z.jpeg"),
                 ),
                 SizedBox(width: 30,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("John Wick",
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
           ),
         ),
     ),
              listContainer()
          ] ),
      ));
  }

  listContainer(){
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 1,
        itemBuilder: (context,index)=>
    Container(
      height: 120,
      child: Card(
        elevation: 0.5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Description Item ${index}"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 35,
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(
                      child: Text("Details",style: TextStyle(color: Colors.black),),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(
                      child: Text("Buy",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }


}
