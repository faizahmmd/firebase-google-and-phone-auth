import 'dart:async';

import 'package:demomachinetest/src/models/header_model.dart';
import 'package:demomachinetest/src/utils/urls.dart';
import 'package:dio/dio.dart';

import 'object_factory.dart';

class ApiClient {
  HeaderModel dishListHeaderModel = new HeaderModel();

  ///  user login
  Future<Response> getDishList() {
    return ObjectFactory().appDio.get(url: Urls.baseUrl);
  }
}
