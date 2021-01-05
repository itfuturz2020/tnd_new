import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_national_dawn/Common/Constants.dart';

class EnquiryForm extends StatefulWidget {
  @override
  _EnquiryFormState createState() => _EnquiryFormState();
}

class _EnquiryFormState extends State<EnquiryForm> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();

  @override
  void initState() {
    setState(() {
      _profile();
    });
  }

  _profile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name.text = prefs.getString(Session.CustomerName);
      _email.text = prefs.getString(Session.CustomerEmailId);
      _phone.text = prefs.getString(Session.CustomerPhoneNo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            "Enquiry form",
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text("Please Complete the following details",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13)),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 22.0,
                ),
                child: Text("Name",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 7),
                child: TextFormField(
                  controller: _name,
                  keyboardType: TextInputType.text,
                  readOnly: true,
                  style: TextStyle(fontSize: 15),
                  cursorColor: appPrimaryMaterialColor,
                  decoration: InputDecoration(
                    counterText: "",
                    contentPadding: EdgeInsets.only(
                        top: 10.0, bottom: 10, left: 10, right: 1),
                    isDense: true,
                    // hintText: "Enter your Name",
                    hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide:
                          BorderSide(color: appPrimaryMaterialColor[400]),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: appPrimaryMaterialColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 22.0,
                ),
                child: Text("Email",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 7),
                child: TextFormField(
                  controller: _email,
                  readOnly: true,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(fontSize: 15),
                  cursorColor: appPrimaryMaterialColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        top: 10.0, bottom: 10, left: 10, right: 1),
                    isDense: true,
                    // hintText: "Enter your Email",
                    hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide:
                          BorderSide(color: appPrimaryMaterialColor[400]),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: appPrimaryMaterialColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 22.0,
                    ),
                    child: Text("Telephone",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 13)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 7),
                child: TextFormField(
                  controller: _phone,
                  keyboardType: TextInputType.text,
                  readOnly: true,
                  style: TextStyle(fontSize: 15),
                  cursorColor: appPrimaryMaterialColor,
                  decoration: InputDecoration(
                    counterText: "",
                    contentPadding: EdgeInsets.only(
                        top: 10.0, bottom: 10, left: 10, right: 1),
                    isDense: true,
                    //hintText: "Enter Telephone Number",
                    hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide:
                          BorderSide(color: appPrimaryMaterialColor[400]),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: appPrimaryMaterialColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 22.0,
                ),
                child: Text("Your Enquiry",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 7),
                child: TextFormField(
                  maxLines: 5,
                  maxLength: 900,
                  style: TextStyle(fontSize: 15),
                  cursorColor: appPrimaryMaterialColor,
                  decoration: InputDecoration(
                    counterText: "write your comment within 900 characters.",
                    contentPadding: EdgeInsets.only(
                        top: 10.0, bottom: 10, left: 10, right: 1),
                    isDense: true,
                    //  hintText: "Enter Telephone Number",
                    hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide:
                          BorderSide(color: appPrimaryMaterialColor[400]),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: appPrimaryMaterialColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              /* Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: RaisedButton(
                      color: appPrimaryMaterialColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      onPressed: () {},
                      child: Text("SUBMIT",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17))),
                ),
              ),*/
            ],
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: appPrimaryMaterialColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 15),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: RaisedButton(
                color: appPrimaryMaterialColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: () {},
                child: Text("SUBMIT",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 17))),
          ),
        ),
      ),
    );
  }
}
