import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_national_dawn/Common/Constants.dart';

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtCName = TextEditingController();
  TextEditingController txtPosition = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobileNumber = TextEditingController();
  TextEditingController txtWNumber = TextEditingController();
  TextEditingController txtGstNumber = TextEditingController();
  String img, userName = "";
  final _formkey = new GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void initState() {
    _profile();
  }

  _profile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      txtName.text = prefs.getString(Session.CustomerName);
      userName = prefs.getString(Session.CustomerName);
      txtCName.text = prefs.getString(Session.CustomerCompanyName);
      txtEmail.text = prefs.getString(Session.CustomerEmailId);
      txtMobileNumber.text = prefs.getString(Session.CustomerPhoneNo);
      txtWNumber.text = prefs.getString(Session.CustomerPhoneNo);
      //img = prefs.getString(Session.CustomerImage);
      print(img);
    });
  }
//  File _Image;
//
//  Future getFromCamera() async {
//    var image = await ImagePicker.pickImage(source: ImageSource.camera);
//    if (image != null) {
//      setState(() {
//        _Image = image;
//      });
//    }
//  }
//
//  Future getFromGallery() async {
//    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//    if (image != null) {
//      setState(() {
//        _Image = image;
//      });
//    }
//  }

//  void _settingModalBottomSheet() {
//    showModalBottomSheet(
//        context: context,
//        builder: (BuildContext bc) {
//          return Container(
//            child: new Wrap(
//              children: <Widget>[
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: [
//                    Padding(
//                      padding: const EdgeInsets.only(
//                          top: 15.0, left: 15, bottom: 10),
//                      child: Text(
//                        "Add Photo",
//                        style: TextStyle(
//                          fontSize: 22,
//                          color: appPrimaryMaterialColor,
//                          //fontWeight: FontWeight.bold
//                        ),
//                      ),
//                    ),
//                    GestureDetector(
//                      onTap: () {
//                        getFromCamera();
//                        Navigator.of(context).pop();
//                      },
//                      child: ListTile(
//                        leading: Padding(
//                          padding: const EdgeInsets.only(right: 10.0, left: 15),
//                          child: Container(
//                              height: 20,
//                              width: 20,
//                              child: Image.asset(
//                                "assets/camera.png",
//                                color: appPrimaryMaterialColor,
//                              )),
//                        ),
//                        title: Text(
//                          "Take Photo",
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(left: 15, right: 15),
//                      child: Divider(),
//                    ),
//                    GestureDetector(
//                      onTap: () {
//                        getFromGallery();
//                        Navigator.of(context).pop();
//                      },
//                      child: ListTile(
//                        leading: Padding(
//                          padding: const EdgeInsets.only(right: 10.0, left: 15),
//                          child: Container(
//                              height: 20,
//                              width: 20,
//                              child: Image.asset(
//                                "assets/gallery.png",
//                                color: appPrimaryMaterialColor,
//                              )),
//                        ),
//                        title: Text(
//                          "Choose from Gallery",
//                        ),
//                      ),
//                    ),
//                    Align(
//                      alignment: AlignmentDirectional.bottomEnd,
//                      child: Padding(
//                        padding: const EdgeInsets.only(right: 25.0, bottom: 5),
//                        child: FlatButton(
//                          onPressed: () {
//                            Navigator.of(context).pop();
//                          },
//                          child: Text(
//                            "Cancel",
//                            style: TextStyle(
//                              fontSize: 18,
//                              color: appPrimaryMaterialColor,
//                              //fontWeight: FontWeight.bold
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ],
//                )
//              ],
//            ),
//          );
//        });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            "Update Profile",
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
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 30.0, bottom: 25.0),
            child: Column(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      color: Colors.blue,
                      //shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2,
                            color: appPrimaryMaterialColor.withOpacity(0.2),
                            spreadRadius: 2,
                            offset: Offset(3, 5)),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage:
//                    NetworkImage(
//                        Image_URL + "${widget.directoryData["img"]}"),
                          AssetImage(
                        "assets/10.jpeg",
                      ),
                    )),
                SizedBox(
                  height: 22,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, left: 5, bottom: 5),
                      child: Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      height: 42,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          //border: Border.all(color: Colors.grey[500], width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          boxShadow: [
                            BoxShadow(
                                color: appPrimaryMaterialColor.withOpacity(0.2),
                                blurRadius: 2.0,
                                spreadRadius: 2.0,
                                offset: Offset(3.0, 5.0))
                          ]),
                      child: TextFormField(
                        controller: txtName,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 15),
                        cursorColor: appPrimaryMaterialColor,
                        validator: (name) {
                          if (name.length == 0) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(15),
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 5, bottom: 5),
                      child: Text(
                        'Position',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      height: 42,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          //border: Border.all(color: Colors.grey[500], width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          boxShadow: [
                            BoxShadow(
                                color: appPrimaryMaterialColor.withOpacity(0.2),
                                blurRadius: 2.0,
                                spreadRadius: 2.0,
                                offset: Offset(3.0, 5.0))
                          ]),
                      child: TextFormField(
                        //controller: txtName,
                        controller: txtPosition,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 15),
                        cursorColor: appPrimaryMaterialColor,
                        validator: (position) {
                          if (position.length == 0) {
                            return 'Please enter your position';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(15),
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 5, bottom: 5),
                      child: Text(
                        'Company Name',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      height: 42,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          //border: Border.all(color: Colors.grey[500], width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          boxShadow: [
                            BoxShadow(
                                color: appPrimaryMaterialColor.withOpacity(0.2),
                                blurRadius: 2.0,
                                spreadRadius: 2.0,
                                offset: Offset(3.0, 5.0))
                          ]),
                      child: TextFormField(
                        //controller: txtName,
                        controller: txtCName,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 15),
                        cursorColor: appPrimaryMaterialColor,
                        validator: (cname) {
                          if (cname.length == 0) {
                            return 'Please enter company name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(15),
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 5, bottom: 5),
                      child: Text(
                        'Mobile Number',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      height: 42,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          //border: Border.all(color: Colors.grey[500], width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          boxShadow: [
                            BoxShadow(
                                color: appPrimaryMaterialColor.withOpacity(0.2),
                                blurRadius: 2.0,
                                spreadRadius: 2.0,
                                offset: Offset(3.0, 5.0))
                          ]),
                      child: TextFormField(
                        //controller: txtName,
                        controller: txtMobileNumber,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(fontSize: 15),
                        cursorColor: appPrimaryMaterialColor,
                        maxLength: 10,
                        validator: (phone) {
                          Pattern pattern = r'(^(?:[+0]9)?[0-9]{10,}$)';
                          RegExp regExp = new RegExp(pattern);
                          if (phone.length == 0) {
                            return 'Please enter mobile number';
                          } else if (!regExp.hasMatch(phone)) {
                            return 'Please enter valid mobile number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          counterText: "",
                          contentPadding: const EdgeInsets.all(15),
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 5, bottom: 5),
                      child: Text(
                        'Whatsapp Number',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      height: 42,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          //border: Border.all(color: Colors.grey[500], width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          boxShadow: [
                            BoxShadow(
                                color: appPrimaryMaterialColor.withOpacity(0.2),
                                blurRadius: 2.0,
                                spreadRadius: 2.0,
                                offset: Offset(3.0, 5.0))
                          ]),
                      child: TextFormField(
                        //controller: txtName,
                        controller: txtWNumber,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(fontSize: 15),
                        cursorColor: appPrimaryMaterialColor,
                        maxLength: 10,
                        validator: (wphone) {
                          Pattern pattern = r'(^(?:[+0]9)?[0-9]{10,}$)';
                          RegExp regExp = new RegExp(pattern);
                          if (wphone.length == 0) {
                            return 'Please enter mobile number';
                          } else if (!regExp.hasMatch(wphone)) {
                            return 'Please enter valid mobile number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          counterText: "",
                          contentPadding: const EdgeInsets.all(15),
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 5, bottom: 5),
                      child: Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Container(
                        height: 42,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            //border: Border.all(color: Colors.grey[500], width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      appPrimaryMaterialColor.withOpacity(0.2),
                                  blurRadius: 2.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(3.0, 5.0))
                            ]),
                        child: TextFormField(
//                      controller: txtEmail,
                          controller: txtEmail,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(fontSize: 15),
                          cursorColor: Colors.black,
                          validator: (email) {
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = new RegExp(pattern);
                            print(email);
                            if (email.isEmpty) {
                              return 'Please enter email';
                            } else {
                              if (!regex.hasMatch(email))
                                return 'Enter valid Email Address';
                              else
                                return null;
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        height: 42,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: appPrimaryMaterialColor[500],
                          //border: Border.all(color: Colors.grey[500], width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                          boxShadow: [
//                            BoxShadow(
//                                color: appPrimaryMaterialColor.withOpacity(0.2),
//                                blurRadius: 2.0,
//                                spreadRadius: 2.0,
//                                offset: Offset(3.0, 5.0))
//                          ]
                        ),
                        child: Center(
                            child: Text('Update Profile',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500))),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
