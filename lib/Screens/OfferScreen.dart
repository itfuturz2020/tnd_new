import 'package:flutter/material.dart';
import 'package:the_national_dawn/Common/Constants.dart';
import 'package:the_national_dawn/Components/OfferComponent.dart';

class OfferScreen extends StatefulWidget {
  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "Offers",
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
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 15, top: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 15),
                child: Container(
                    height: 38,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: appPrimaryMaterialColor)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: dropdownValue == null
                              ? Text(
                                  "Select category",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )
                              : Text(dropdownValue),
                          dropdownColor: Colors.white,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            size: 40,
                            color: Colors.black,
                          ),
                          isExpanded: true,
                          value: dropdownValue,
                          items: [
                            "Sports",
                            "Entertainment",
                            "Politics",
                            "Religion"
                          ].map((value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              dropdownValue = value;
                            });
                          },
                        ),
                      ),
                    )),
              ),
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    // scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return OfferComponent();
                    }),
              ),
            ],
          ),
        ));
  }
}
