import 'package:hive/hive.dart';

import '../src/utils/constants.dart';

class AppHive {
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
    return hivePutString(key: Constants.TOKEN, value: token);
  }

  getToken() {
    return hiveGetString(key: Constants.TOKEN);
  }

  void deleteToken() {
    putToken(token: "");
  }

  displayNamePut({String value}) {
    return hivePutString(key: Constants.DISPLAYNAME, value: value);
  }

  getDisplayName() {
    return hiveGetString(key: Constants.DISPLAYNAME);
  }

  putPhotoUrl({String value}) {
    return hivePutString(key: Constants.PHOTOURL, value: value);
  }

  getPhotoUrl() {
    return hiveGetString(key: Constants.PHOTOURL);
  }

  putEmail({String value}) {
    return hivePutString(key: Constants.EMAIL, value: value);
  }

  getEmail() {
    return hiveGetString(key: Constants.EMAIL);
  }

  putUid({String value}) {
    return hivePutString(key: Constants.UID, value: value);
  }

  getUid() {
    return hiveGetString(key: Constants.UID);
  }

  putCartCount({int value}) {
    return hivePutInt(key: Constants.CARTCOUNT, value: value);
  }

  getCartCount() {
    return hiveGetInt(key: Constants.CARTCOUNT);
  }

  void hiveClear() {
    Hive.box('box').clear();
  }

  AppHive();
}
