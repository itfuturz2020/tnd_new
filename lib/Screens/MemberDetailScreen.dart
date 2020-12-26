import 'package:avatar_glow/avatar_glow.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_national_dawn/Common/Constants.dart';

class MemberDetailScreen extends StatefulWidget {
  @override
  _MemberDetailScreenState createState() => _MemberDetailScreenState();
}

class _MemberDetailScreenState extends State<MemberDetailScreen> {
  String memberImg = "";
  bool isEditable = false;

  @override
  void initState() {
    _profile();
  }

  var _name;
  var _comp_name;
  var _mobileNo;
  var _email;
  var img;
  var company_name;
  var business_category;
  var address;
  var about_business;
  var achievement;

  _profile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString(Session.CustomerName);
      _comp_name = prefs.getString(Session.CustomerCompanyName);
      _email = prefs.getString(Session.CustomerEmailId);
      img = prefs.getString(Session.CustomerImage);
      _mobileNo = prefs.getString(Session.CustomerPhoneNo);
      business_category = prefs.getString(Session.business_category);
      address = prefs.getString(Session.address);
      about_business = prefs.getString(Session.about_business);
      achievement = prefs.getString(Session.achievement);
    });
    /*setState(() {
      qrData =
          _name + "," + _comp_name + "," + _email + "," + img + "," + _mobileNo;
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            "My Profile Detail",
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
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(top: 8.0, right: 18, left: 10, bottom: 8),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/UpdateProfileScreen');
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
                  Icons.edit,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 5,
            ),
            Material(
              color: Colors.white,
              child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: new BubbleTabIndicator(
                    indicatorHeight: 43,
                    indicatorRadius: 6,
                    indicatorColor: appPrimaryMaterialColor[700],
                    tabBarIndicatorSize: TabBarIndicatorSize.tab,
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        'Personal',
                      ),
                    ),
                    Tab(
                      child: Text('Business'),
                    ),
                    Tab(
                      child: Text('More Info'),
                    ),
                  ]),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 15.0, bottom: 25.0),
                      child: Column(
                        children: <Widget>[
                          img != ""
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80.0),
                                    color: Colors.blue,
                                    //shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 2,
                                          color: appPrimaryMaterialColor
                                              .withOpacity(0.2),
                                          spreadRadius: 2,
                                          offset: Offset(3, 5)),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 65,
                                    backgroundImage: img != null
                                        ? NetworkImage(img)
                                        : AssetImage('assets/user2.png'),
                                    //child: Image.asset("assets/10.jpeg",fit: BoxFit.cover,),
                                  ))
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80.0),
                                    color: Colors.blue,
                                    //shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 2,
                                          color: appPrimaryMaterialColor
                                              .withOpacity(0.2),
                                          spreadRadius: 2,
                                          offset: Offset(3, 5)),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 80,
                                    backgroundImage: AssetImage(
                                      "assets/051-user.png",
                                    ),
                                    //child: Image.asset("assets/10.jpeg",fit: BoxFit.cover,),
                                  )),
                          SizedBox(
                            height: 22,
                          ),
                          Container(
                            height: 131,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: appPrimaryMaterialColor[50],
                                    width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22.0)),
                                boxShadow: [
                                  BoxShadow(
                                      color: appPrimaryMaterialColor
                                          .withOpacity(0.2),
                                      blurRadius: 2.0,
                                      spreadRadius: 2.0,
                                      offset: Offset(3.0, 5.0))
                                ]),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    // "Mr. Natasha Goel",
                                    "${_name}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("Manager",
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
//                                          "Future Group Info Soft",
                                      "${_comp_name}",
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 133,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: appPrimaryMaterialColor[50],
                                    width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22.0)),
                                boxShadow: [
                                  BoxShadow(
                                      color: appPrimaryMaterialColor
                                          .withOpacity(0.2),
                                      blurRadius: 2.0,
                                      spreadRadius: 2.0,
                                      offset: Offset(3.0, 5.0))
                                ]),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 24, top: 4, bottom: 4),
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Icon(
                                          Icons.phone,
                                          color: Color(0xff16B8FF),
                                          size: 22,
                                        ),
                                        Image.asset("assets/whatsapp.png"),
                                        Icon(
                                          Icons.email,
                                          color: Colors.redAccent,
                                          size: 22,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
//                                              "+91-8488848476",
                                          "${_mobileNo}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1),
                                        ),
                                        Text(
//                                                "+91-9723131314",
                                            "${_mobileNo}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        Text(
//                                                "xsantosh7@gmail.com",
                                            "${_email}",
                                            style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          /* SizedBox(
                height: 18,
              ),
              Container(
                height: 42,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[500], width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                  BoxShadow(
                    color: appPrimaryMaterialColor.withOpacity(0.2),
                    blurRadius: 2.0,
                    spreadRadius: 2.0,
                    offset: Offset(3.0, 5.0))
                    ]),
                child: Center(
                    child: Text(
                  "Share QR to scan",
                  style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                  fontSize: 21),
                )),
              ),*/
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 35,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: appPrimaryMaterialColor[50],
                                      width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(22.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: appPrimaryMaterialColor
                                            .withOpacity(0.2),
                                        blurRadius: 2.0,
                                        spreadRadius: 2.0,
                                        offset: Offset(3.0, 5.0))
                                  ]),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.business,
                                            color: appPrimaryMaterialColor,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              'Business Info',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18.0, top: 12),
                                          child: Text(
                                            // "Mr. Natasha Goel",
                                            "Company Name  : ",
                                            style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 12),
                                          child: Text(
                                            // "Mr. Natasha Goel",
                                            "${_comp_name ?? "-"}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18.0),
                                          child: Text(
                                            // "Mr. Natasha Goel",
                                            "About Bussiness  : ",
                                            style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                              "${about_business ?? "-"}",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18.0),
                                          child: Text(
                                            // "Mr. Natasha Goel",
                                            "Business Category  : ",
                                            style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                              "${business_category ?? "-"}",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18.0),
                                          child: Text(
                                            // "Mr. Natasha Goel",
                                            "Address : ",
                                            style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
//                                          "Future Group Info Soft",
                                              "${address ?? "-"}",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      /*Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              //Make Design
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Column(
                                  children: <Widget>[
                                    Card(
                                      margin: EdgeInsets.all(10),
                                      elevation: 3,
                                      child: Container(
                                        //padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 20, bottom: 20),
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                height: 50,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.business,
                                                          color:
                                                              appPrimaryMaterialColor,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 5),
                                                          child: Text(
                                                            'Business Info',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 19,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                color: Colors.grey,
                                              ),
                                              TextFormField(
                                                //   controller: edtCmpName,
                                                scrollPadding:
                                                    EdgeInsets.all(0),
                                                decoration: InputDecoration(
                                                    labelText: "Company",
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    hintText: "Company"),
                                                minLines: 1,
                                                maxLines: 4,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                              TextFormField(
                                                scrollPadding:
                                                    EdgeInsets.all(0),
                                                decoration: InputDecoration(
                                                    labelText:
                                                        "Business Category:",
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    hintText:
                                                        "Business Category"),
                                                keyboardType:
                                                    TextInputType.multiline,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                              TextFormField(
                                                scrollPadding:
                                                    EdgeInsets.all(0),
                                                decoration: InputDecoration(
                                                    labelText: "Address",
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    hintText: "Address"),
                                                // enabled: isBusinessEditable,
                                                minLines: 1,
                                                maxLines: 4,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                              TextFormField(
                                                //  controller: edtBusinessAbout,
                                                scrollPadding:
                                                    EdgeInsets.all(0),
                                                decoration: InputDecoration(
                                                    labelText: "About Business",
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    hintText: "About Business"),
                                                //  enabled: isBusinessEditable,
                                                minLines: 1,
                                                maxLines: 4,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),*/
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 35,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: appPrimaryMaterialColor[50],
                                      width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(22.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: appPrimaryMaterialColor
                                            .withOpacity(0.2),
                                        blurRadius: 2.0,
                                        spreadRadius: 2.0,
                                        offset: Offset(3.0, 5.0))
                                  ]),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.info,
                                            color: appPrimaryMaterialColor,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              'More Info',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18.0, top: 12),
                                          child: Text(
                                            // "Mr. Natasha Goel",
                                            "Achievement  : ",
                                            style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 12),
                                          child: Text(
                                            // "Mr. Natasha Goel",
                                            "${achievement ?? "-"}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      /*Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              //Make Design
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Column(
                                  children: <Widget>[
                                    Card(
                                      margin: EdgeInsets.all(10),
                                      elevation: 3,
                                      child: Container(
                                        //padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 20, bottom: 20),
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                height: 50,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.business,
                                                          color:
                                                              appPrimaryMaterialColor,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 5),
                                                          child: Text(
                                                            'Business Info',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 19,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                color: Colors.grey,
                                              ),
                                              TextFormField(
                                                //   controller: edtCmpName,
                                                scrollPadding:
                                                    EdgeInsets.all(0),
                                                decoration: InputDecoration(
                                                    labelText: "Company",
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    hintText: "Company"),
                                                minLines: 1,
                                                maxLines: 4,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                              TextFormField(
                                                scrollPadding:
                                                    EdgeInsets.all(0),
                                                decoration: InputDecoration(
                                                    labelText:
                                                        "Business Category:",
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    hintText:
                                                        "Business Category"),
                                                keyboardType:
                                                    TextInputType.multiline,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                              TextFormField(
                                                scrollPadding:
                                                    EdgeInsets.all(0),
                                                decoration: InputDecoration(
                                                    labelText: "Address",
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    hintText: "Address"),
                                                // enabled: isBusinessEditable,
                                                minLines: 1,
                                                maxLines: 4,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                              TextFormField(
                                                //  controller: edtBusinessAbout,
                                                scrollPadding:
                                                    EdgeInsets.all(0),
                                                decoration: InputDecoration(
                                                    labelText: "About Business",
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    hintText: "About Business"),
                                                //  enabled: isBusinessEditable,
                                                minLines: 1,
                                                maxLines: 4,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),*/
                    ),
                  ),
                  /* Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              children: <Widget>[
                                Card(
                                  margin: EdgeInsets.all(10),
                                  elevation: 3,
                                  child: Container(
                                    //padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 20, bottom: 20),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            height: 50,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.info,
                                                      color:
                                                          appPrimaryMaterialColor,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: Text(
                                                        'More Info',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                          ),
                                          */ /*TextFormField(
                                              controller: edtTestimonial,
                                              scrollPadding:
                                                  EdgeInsets.all(0),
                                              decoration: InputDecoration(
                                                  labelText: "Testimonial",
                                                  labelStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  hintText: "Testimonial"),
                                              enabled: isMoreEditable,
                                              minLines: 1,
                                              maxLines: 4,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),*/ /*
                                          TextFormField(
                                            //controller: edtAchievement,
                                            scrollPadding: EdgeInsets.all(0),
                                            decoration: InputDecoration(
                                                labelText: "Achievement",
                                                labelStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                hintText: "Achievement"),
                                            // enabled: isMoreEditable,
                                            minLines: 1,
                                            maxLines: 4,
                                            keyboardType:
                                                TextInputType.multiline,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          TextFormField(
                                            // controller: edtExperienceOfWork,
                                            scrollPadding: EdgeInsets.all(0),
                                            decoration: InputDecoration(
                                                labelText: "Experience Of Work",
                                                labelStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                hintText: "Experience Of Work"),
                                            //enabled: isMoreEditable,
                                            minLines: 1,
                                            maxLines: 4,
                                            keyboardType:
                                                TextInputType.multiline,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          TextFormField(
                                            //controller: edtAskForPeople,
                                            scrollPadding: EdgeInsets.all(0),
                                            decoration: InputDecoration(
                                                labelText: "Ask For People",
                                                labelStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                hintText: "Ask For People"),
                                            //  enabled: isMoreEditable,
                                            minLines: 1,
                                            maxLines: 4,
                                            keyboardType:
                                                TextInputType.multiline,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          TextFormField(
                                            //controller: edtIntroducer,
                                            scrollPadding: EdgeInsets.all(0),
                                            decoration: InputDecoration(
                                                labelText: "Introducer",
                                                labelStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                hintText: "Introducer"),
                                            // enabled: isMoreEditable,
                                            minLines: 1,
                                            maxLines: 4,
                                            keyboardType:
                                                TextInputType.multiline,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
