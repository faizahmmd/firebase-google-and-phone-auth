// To parse this JSON data, do
//
//     final headerModel = headerModelFromJson(jsonString);

import 'dart:convert';

HeaderModel headerModelFromJson(String str) =>
    HeaderModel.fromJson(json.decode(str));

String headerModelToJson(HeaderModel data) => json.encode(data.toJson());

class HeaderModel {
  HeaderModel({
    this.authorization,
  });

  String authorization;

  factory HeaderModel.fromJson(Map<String, dynamic> json) => HeaderModel(
        authorization:
            json["authorization"] == null ? null : json["authorization"],
      );

  Map<String, dynamic> toJson() => {
        "authorization": authorization == null ? null : authorization,
      };
}
