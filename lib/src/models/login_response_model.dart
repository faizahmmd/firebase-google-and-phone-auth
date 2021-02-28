// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.statuscode,
    this.statusmessage,
    this.errorcode,
    this.errormessage,
    this.data,
  });

  final int statuscode;
  final dynamic statusmessage;
  final int errorcode;
  final String errormessage;
  final Data data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    statuscode: json["statuscode"] == null ? null : json["statuscode"],
    statusmessage: json["statusmessage"],
    errorcode: json["errorcode"] == null ? null : json["errorcode"],
    errormessage: json["errormessage"] == null ? null : json["errormessage"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statuscode": statuscode == null ? null : statuscode,
    "statusmessage": statusmessage,
    "errorcode": errorcode == null ? null : errorcode,
    "errormessage": errormessage == null ? null : errormessage,
    "data": data == null ? null : data.toJson(),
  };
}

class Data {
  Data({
    this.userid,
    this.loginmessage,
    this.maxinactivesession,
    this.profileupdaterequired,
    this.mobileverificationrequired,
    this.emailverificationrequired,
    this.resetpassword,
    this.authtoken,
  });

  final String userid;
  final dynamic loginmessage;
  final int maxinactivesession;
  final bool profileupdaterequired;
  final bool mobileverificationrequired;
  final bool emailverificationrequired;
  final bool resetpassword;
  final String authtoken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userid: json["userid"] == null ? null : json["userid"],
    loginmessage: json["loginmessage"],
    maxinactivesession: json["maxinactivesession"] == null ? null : json["maxinactivesession"],
    profileupdaterequired: json["profileupdaterequired"] == null ? null : json["profileupdaterequired"],
    mobileverificationrequired: json["mobileverificationrequired"] == null ? null : json["mobileverificationrequired"],
    emailverificationrequired: json["emailverificationrequired"] == null ? null : json["emailverificationrequired"],
    resetpassword: json["resetpassword"] == null ? null : json["resetpassword"],
    authtoken: json["authtoken"] == null ? null : json["authtoken"],
  );

  Map<String, dynamic> toJson() => {
    "userid": userid == null ? null : userid,
    "loginmessage": loginmessage,
    "maxinactivesession": maxinactivesession == null ? null : maxinactivesession,
    "profileupdaterequired": profileupdaterequired == null ? null : profileupdaterequired,
    "mobileverificationrequired": mobileverificationrequired == null ? null : mobileverificationrequired,
    "emailverificationrequired": emailverificationrequired == null ? null : emailverificationrequired,
    "resetpassword": resetpassword == null ? null : resetpassword,
    "authtoken": authtoken == null ? null : authtoken,
  };
}
