import 'package:demomachinetest/auth_service/firebase_auth.dart';
import 'package:demomachinetest/hive/hive.dart';

import 'dio.dart';

/// it is a hub that connecting pref,repo,client
/// used to reduce imports in pages
class ObjectFactory {
  static final _objectFactory = ObjectFactory._internal();

  ObjectFactory._internal();

  factory ObjectFactory() => _objectFactory;

  ///Initialisation of Objects
  AppHive _appHive = AppHive();
  Auth _authClassObject = Auth();
  //ApiClient _apiClient = ApiClient();
  AppDio _appDio = AppDio();
  // Repository _repository = Repository();

  ///
  /// Getters of Objects
  ///
  // ApiClient get apiClient => _apiClient;
  AppDio get appDio => _appDio;

  AppHive get appHive => _appHive;

  Auth get authClassObject => _authClassObject;

  // Repository get repository => _repository;

  ///
  /// Setters of Objects
  ///

}
