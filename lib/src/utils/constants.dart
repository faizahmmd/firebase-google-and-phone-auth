import 'package:flutter/material.dart';

class Constants {
  static final rupeeSymbol = "\u20B9";
  static const String FEATURE_NOT_AVAILABLE = "Feature not available";
  static const String BOX_NAME = "box";
  static const String SOME_ERROR_OCCURRED = "Smoething went wrong.";
  static const String EMAIL_NOT_VALID = "invalid email.";
  static const String USERNAME_NOT_VALID = "invalid username.";
  static const String PASSWORD_LENGTH = "password length is too short.";
  static const String INVALID_MOBILE_NUM = "invalid mobile number.";
  static const String INVALID_NAME = "invalid name.";
  static const String TOKEN = "token";
  static const String DISPLAYNAME = 'displayname';
  static const String PHOTOURL = 'photourl';
  static const String EMAIL = 'email';
  static const String UID = 'uid';
  static const String CARTCOUNT = 'cartcount';

  ///gradients
  static List<Color> kitGradients = [
    // new Color.fromRGBO(103, 218, 255, 1.0),
    // new Color.fromRGBO(3, 169, 244, 1.0),
    // new Color.fromRGBO(0, 122, 193, 1.0),
    Colors.white,
    Color(0xFF272726),
    Color(0xFF707070),
    Colors.blue,
    Colors.green,
    Colors.grey, //5
    Color.fromRGBO(60, 80, 20, 0),
    Colors.transparent,
    Colors.red
  ];
}
