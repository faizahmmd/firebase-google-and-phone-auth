// To parse this JSON data, do
//
//     final headerModel = headerModelFromJson(jsonString);

import 'dart:convert';

HeaderModel headerModelFromJson(String str) => HeaderModel.fromJson(json.decode(str));

String headerModelToJson(HeaderModel data) => json.encode(data.toJson());

class HeaderModel {
  HeaderModel({
    this.authorization,
    this.xSession,
    this.xRequestTime,
    this.xUdid,
    this.xAccessMode,
    this.xReferenceId,
    this.xUser,
    this.xUserId,
    this.xTenantId,
    this.xPropertyCode,
  });

  String authorization;
  String xSession;
  String xRequestTime;
  String xUdid;
  String xAccessMode;
  String xReferenceId;
  String xUser;
  String xUserId;
  String xTenantId;
  String xPropertyCode;

  factory HeaderModel.fromJson(Map<String, dynamic> json) => HeaderModel(
    authorization: json["Authorization"] == null ? null : json["Authorization"],
    xSession: json["X-Session"] == null ? null : json["X-Session"],
    xRequestTime: json["X-RequestTime"] == null ? null : json["X-RequestTime"],
    xUdid: json["X-UDID"] == null ? null : json["X-UDID"],
    xAccessMode: json["X-AccessMode"] == null ? null : json["X-AccessMode"],
    xReferenceId: json["X-ReferenceId"] == null ? null : json["X-ReferenceId"],
    xUser: json["X-User"] == null ? null : json["X-User"],
    xUserId: json["X-UserId"] == null ? null : json["X-UserId"],
    xTenantId: json["X-TenantId"] == null ? null : json["X-TenantId"],
    xPropertyCode: json["X-PropertyCode"] == null ? null : json["X-PropertyCode"],
  );

  Map<String, dynamic> toJson() => {
    "Authorization": authorization == null ? null : authorization,
    "X-Session": xSession == null ? null : xSession,
    "X-RequestTime": xRequestTime == null ? null : xRequestTime,
    "X-UDID": xUdid == null ? null : xUdid,
    "X-AccessMode": xAccessMode == null ? null : xAccessMode,
    "X-ReferenceId": xReferenceId == null ? null : xReferenceId,
    "X-User": xUser == null ? null : xUser,
    "X-UserId": xUserId == null ? null : xUserId,
    "X-TenantId": xTenantId == null ? null : xTenantId,
    "X-PropertyCode": xPropertyCode == null ? null : xPropertyCode,
  };
}
