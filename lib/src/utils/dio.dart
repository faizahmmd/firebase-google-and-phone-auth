import 'dart:async';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:demomachinetest/src/models/header_model.dart';
import 'package:demomachinetest/src/utils/urls.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';

class AppDio {
  AppDio() {
    initClient();
  }

//for api client testing only
  AppDio.test({@required this.dio});

  Dio dio;
  BaseOptions _baseOptions;

  initClient() async {
    _baseOptions = new BaseOptions(
        baseUrl: Urls.baseUrl,
        connectTimeout: 30000,
        receiveTimeout: 1000000,
        followRedirects: false,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
        responseType: ResponseType.json,
        receiveDataWhenStatusError: true);

    dio = Dio(_baseOptions);

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };

    dio.interceptors.add(CookieManager(new CookieJar()));
  }

  ///dio get
  Future<Response> get({String url}) {
    // dio.options.headers.addAll({
    //   "Authorization": header.authorization
    // });
    print("url is : " + url);
    return dio.get(url);
  }

  ///dio  post
  Future<Response> post({String url, HeaderModel header, var data}) {
    dio.options.headers.addAll({"Authorization": header.authorization});

    return dio.post(url, data: data);
  }
}
