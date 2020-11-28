import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_national_dawn/Common/Constants.dart';
import 'package:the_national_dawn/Components/DirectoryProfileComponent.dart';

class DirectoryComponent extends StatefulWidget {
  var directoryData;

  DirectoryComponent({this.directoryData});

  @override
  _DirectoryComponentState createState() => _DirectoryComponentState();
}

class _DirectoryComponentState extends State<DirectoryComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 22, left: 12, right: 12),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new DirectoryProfileComponent(
                        directoryData: widget.directoryData,
                      )));
        },
        child: Container(
          height: 140,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[100], width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400].withOpacity(0.2),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                    offset: Offset(3.0, 5.0))
              ]),
          child: Row(
            children: [
              Container(
                width: 130,
                height: 210,
                decoration: BoxDecoration(
                    // border: Border.all(color: Colors.grey[100]),
                    borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      Image_URL + "${widget.directoryData["img"]}",
                      fit: BoxFit.cover,
                    )),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.directoryData["name"]}",
                        // widget.directoryData["name"],
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text(
                          "${widget.directoryData["business_category"]}",
                          //widget.directoryData["business_category"],
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Container(
                            height: 25,
                            // width: 140,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: appPrimaryMaterialColor[100],
                                  width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/videocall.png'),
                                FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 3.0),
                                    child: Text(
                                      "Send 1-2-1 request",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            //  Navigator.of(context).pushNamed('/ViewDetailScreen');
                          },
                          child: Container(
                            height: 25,
                            width: 140,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: appPrimaryMaterialColor[100],
                                  width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.more_vert,
                                  color: appPrimaryMaterialColor,
                                ),

//
                                Text(
                                  "View details",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
