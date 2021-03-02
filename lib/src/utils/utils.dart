import 'package:demomachinetest/src/widgets/cancel_alert_box.dart';
import 'package:demomachinetest/src/widgets/otp_message.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///it contain common functions
class Utils {}

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double screenHeight(BuildContext context, {double dividedBy = 1}) {
  return screenSize(context).height / dividedBy;
}

double screenWidth(BuildContext context, {double dividedBy = 1}) {
  return screenSize(context).width / dividedBy;
}

Future<dynamic> push(BuildContext context, Widget route) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => route));
}

void pop(BuildContext context) {
  return Navigator.pop(context);
}

Future<dynamic> pushAndRemoveUntil(
    BuildContext context, Widget route, bool goBack) {
  return Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => route), (route) => goBack);
}

Future<dynamic> pushAndReplacement(BuildContext context, Widget route) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => route));
}

///common toast
void showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}

void cancelAlertBox(
    {context,
    msg,
    text1,
    text2,
    route,
    double insetPadding,
    double contentPadding,
    double titlePadding}) {
  showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.8),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return CancelAlertBox(
          title: msg,
          text1: text1,
          text2: text2,
          route: route,
          contentPadding: contentPadding,
          titlePadding: titlePadding,
          insetPadding: insetPadding,
        );
      });
}

void showAlert(context, String msg) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text(msg),
//        content: new Text("Alert Dialog body"),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void otpAlertBox({context, title, route, stayOnPage}) {
  showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return OtpMessage(
          title: title,
          route: route,
          stayOnPage: stayOnPage,
        );
      });
}

///common toast
void showToastLong(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
  );
}

void showToastConnection(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
  );
}

int addCounter(int valueFromCounter) {
  int value = valueFromCounter + 1;
  return value;
}

int decrementCounter(int valueFromCounter) {
  int value = valueFromCounter;
  if (valueFromCounter > 0) {
    value = valueFromCounter - 1;
  }
  return value;
}

int cartItemsTotal(List<int> a, List<int> b, List<int> c, List<int> d,
    List<int> e, List<int> f) {
  int sum1 = 0;
  int sum2 = 0;
  int sum3 = 0;
  int sum4 = 0;
  int sum5 = 0;
  int sum6 = 0;
  a.forEach((e) => sum1 += e);
  b.forEach((e) => sum2 += e);
  c.forEach((e) => sum3 += e);
  d.forEach((e) => sum4 += e);
  e.forEach((e) => sum5 += e);
  f.forEach((e) => sum6 += e);
  return (sum1 + sum2 + sum3 + sum4 + sum5 + sum6);
}

int totalDishesForCartPage(List<int> a, List<int> b, List<int> c, List<int> d,
    List<int> e, List<int> f) {
  int sum1 = 0;
  int sum2 = 0;
  int sum3 = 0;
  int sum4 = 0;
  int sum5 = 0;
  int sum6 = 0;
  for (int i = 0; i < a.length; i++) {
    if (a[i] > 0) {
      sum1 = sum1 + 1;
    }
  }
  for (int i = 0; i < b.length; i++) {
    if (b[i] > 0) {
      sum2 = sum2 + 1;
    }
  }
  for (int i = 0; i < c.length; i++) {
    if (c[i] > 0) {
      sum3 = sum3 + 1;
    }
  }
  for (int i = 0; i < d.length; i++) {
    if (d[i] > 0) {
      sum4 = sum4 + 1;
    }
  }
  for (int i = 0; i < e.length; i++) {
    if (e[i] > 0) {
      sum5 = sum5 + 1;
    }
  }
  for (int i = 0; i < f.length; i++) {
    if (f[i] > 0) {
      sum6 = sum6 + 1;
    }
  }
  return (sum1 + sum2 + sum3 + sum4 + sum5 + sum6);
}

double sARToINRConversion(double price) {
  return (price * 19.55);
}

double getTotalPrice(List<double> priceArray, List<String> itemsCountArray) {
  double sum = 0;
  List<double> returnArray = [];
  for (int i = 0; i < priceArray.length; i++) {
    returnArray.add((priceArray[i]) * (double.parse(itemsCountArray[i])));
  }
  returnArray.forEach((e) => sum += e);
  sum = sum * 19.5;
  return sum;
}

int totalSumOfArray(List<int> a) {
  int sum = 0;
  a.forEach((e) => sum += e);

  return sum;
}
