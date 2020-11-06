import 'package:flutter/material.dart';

//const String SOAP_API_URL = "http://pmc.studyfield.com/Service.asmx/";

const String API_URL = "http://15.207.46.236/";
const String Image_URL = "http://15.207.46.236/";

const Inr_Rupee = "₹";
const Color appcolor = Color.fromRGBO(0, 171, 199, 1);
const Color secondaryColor = Color.fromRGBO(85, 96, 128, 1);

//const String whatsAppLink = "https://wa.me/#mobile?text=#msg"; //mobile no with country code

Map<int, Color> appprimarycolors = {
  50: Color.fromRGBO(0, 152, 219, .1),
  100: Color.fromRGBO(0, 152, 219, .2),
  200: Color.fromRGBO(0, 152, 219, .3),
  300: Color.fromRGBO(0, 152, 219, .4),
  400: Color.fromRGBO(0, 152, 219, .5),
  500: Color.fromRGBO(0, 152, 219, .6),
  600: Color.fromRGBO(0, 152, 219, .7),
  700: Color.fromRGBO(0, 152, 219, .8),
  800: Color.fromRGBO(0, 152, 219, .9),
  900: Color.fromRGBO(0, 152, 219, 1)
};

MaterialColor appPrimaryMaterialColor =
    MaterialColor(0xFF0098db, appprimarycolors);

class Session {
  static const String CustomerId = "CustomerId";
  static const String CustomerName = "CustomerName";
  static const String referred_by = "referred_by";
  static const String addressId = "addressId";
  static const String type = "type";
  static const String CustomerCompanyName = "CustomerCompanyName";
  static const String CustomerEmailId = "CustomerEmailId";
  static const String CustomerPhoneNo = "CustomerPhoneNo";
  static const String CustomerCDT = "CustomerCDT";
}
