import 'package:hive/hive.dart';

import '../src/utils/constants.dart';

class AppHive {
  static const String _TOKEN = "token";
  static const String _DISPLAYNAME = 'displayname';
  static const String _PHOTOURL = 'photourl';
  static const String _EMAIL = 'email';
  static const String _UID = 'uid';

  void hivePutString({String key, String value}) async {
    await Hive.box(Constants.BOX_NAME).put(key, value);
  }

  void hivePutInt({String key, int value}) async {
    await Hive.box(Constants.BOX_NAME).put(key, value);
  }

  void hivePutBool({String key, bool value}) async {
    await Hive.box(Constants.BOX_NAME).put(key, value);
  }

  void hivePutIntAt({String key, int value, int index}) async {
    await Hive.box(Constants.BOX_NAME).putAt(index, value);
  }

  String hiveGetString({String key}) {
    return Hive.box(Constants.BOX_NAME).get(key);
  }

  int hiveGetInt({String key}) {
    return Hive.box(Constants.BOX_NAME).get(key);
  }

  bool hiveGetBool({String key}) {
    return Hive.box(Constants.BOX_NAME).get(key);
  }

  putToken({String token}) {
    return hivePutString(key: _TOKEN, value: token);
  }

  getToken() {
    return hiveGetString(key: _TOKEN);
  }

  void deleteToken() {
    putToken(token: "");
  }

  displayNamePut({String value}) {
    return hivePutString(key: _DISPLAYNAME, value: value);
  }

  getDisplayName() {
    return hiveGetString(key: _DISPLAYNAME);
  }

  putPhotoUrl({String value}) {
    return hivePutString(key: _PHOTOURL, value: value);
  }

  getPhotoUrl() {
    return hiveGetString(key: _PHOTOURL);
  }

  putEmail({String value}) {
    return hivePutString(key: _EMAIL, value: value);
  }

  getEmail() {
    return hiveGetString(key: _EMAIL);
  }

  putUid({String value}) {
    return hivePutString(key: _UID, value: value);
  }

  getUid() {
    return hiveGetString(key: _UID);
  }

  void hiveClear() {
    Hive.box('box').clear();
  }

  AppHive();
}
