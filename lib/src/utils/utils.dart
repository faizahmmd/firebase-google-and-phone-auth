import 'package:demomachinetest/src/models/get_dish_list_response.dart';
import 'package:demomachinetest/src/models/model_class_for_get_selected_dish_names_function_in_utils.dart';
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
    returnArray
        .add(((priceArray[i]) * 19.55) * (double.parse(itemsCountArray[i])));
  }
  returnArray.forEach((e) => sum += e);
  return sum;
}

int totalSumOfArray(List<int> a) {
  int sum = 0;
  a.forEach((e) => sum += e);

  return sum;
}

List<List<int>> counterValueCalculations(event) {
  List<int> saladsCounterValuArray = [];
  List<int> benyardCounterValuArray = [];
  List<int> henCounterValuArray = [];
  List<int> seaCounterValuArray = [];
  List<int> biryaniCounterValuArray = [];
  List<int> fastFoodCounterValuArray = [];

  List<List<int>> arrayForReturn = [];

  saladsCounterValuArray.clear();
  benyardCounterValuArray.clear();
  henCounterValuArray.clear();
  seaCounterValuArray.clear();
  biryaniCounterValuArray.clear();
  fastFoodCounterValuArray.clear();

  for (int i = 0; i < event.tableMenuList.length; i++) {
    if (event.tableMenuList[i].menuCategory == "Salads and Soup") {
      for (int j = 0; j < event.tableMenuList[i].categoryDishes.length; j++) {
        saladsCounterValuArray.add(0);
      }
    }
  }
  for (int i = 0; i < event.tableMenuList.length; i++) {
    if (event.tableMenuList[i].menuCategory == "From The Barnyard") {
      for (int j = 0; j < event.tableMenuList[i].categoryDishes.length; j++) {
        benyardCounterValuArray.add(0);
      }
    }
  }
  for (int i = 0; i < event.tableMenuList.length; i++) {
    if (event.tableMenuList[i].menuCategory == "From the Hen House") {
      for (int j = 0; j < event.tableMenuList[i].categoryDishes.length; j++) {
        henCounterValuArray.add(0);
      }
    }
  }
  for (int i = 0; i < event.tableMenuList.length; i++) {
    if (event.tableMenuList[i].menuCategory == "Fresh From The Sea") {
      for (int j = 0; j < event.tableMenuList[i].categoryDishes.length; j++) {
        seaCounterValuArray.add(0);
      }
    }
  }
  for (int i = 0; i < event.tableMenuList.length; i++) {
    if (event.tableMenuList[i].menuCategory == "Biryani") {
      for (int j = 0; j < event.tableMenuList[i].categoryDishes.length; j++) {
        biryaniCounterValuArray.add(0);
      }
    }
  }
  for (int i = 0; i < event.tableMenuList.length; i++) {
    if (event.tableMenuList[i].menuCategory == "Fast Food") {
      for (int j = 0; j < event.tableMenuList[i].categoryDishes.length; j++) {
        fastFoodCounterValuArray.add(0);
      }
    }
  }

  arrayForReturn = [
    saladsCounterValuArray,
    benyardCounterValuArray,
    henCounterValuArray,
    seaCounterValuArray,
    biryaniCounterValuArray,
    fastFoodCounterValuArray
  ];

  // print("saladsCounterValuArray is " + saladsCounterValuArray.toString());
  // print("benyardCounterValuArray is " + benyardCounterValuArray.toString());
  // print("henCounterValuArray is " + henCounterValuArray.toString());
  // print("seaCounterValuArray is " + seaCounterValuArray.toString());
  // print("biryaniCounterValuArray is " + biryaniCounterValuArray.toString());
  // print("fastFoodCounterValuArray is " + fastFoodCounterValuArray.toString());
  return arrayForReturn;
}

GetSelectedDishNamesModelClassForUtils getSelectedDishNames(
    {List<int> saladsCounterValuArray,
    List<int> benyardCounterValuArray,
    List<int> henCounterValuArray,
    List<int> seaCounterValuArray,
    List<int> biryaniCounterValuArray,
    List<int> fastFoodCounterValuArray,
    GetDishListResponse getDishesResponse}) {
  List<String> selectedDishesNamesArray = [];
  List<double> selectedDishesPricesArray = [];
  List<String> selectedDishesCalorieArray = [];
  List<String> selectedDishesCountsArray = [];

  selectedDishesNamesArray.clear();
  selectedDishesPricesArray.clear();
  selectedDishesCalorieArray.clear();
  selectedDishesCountsArray.clear();

  GetSelectedDishNamesModelClassForUtils
      getSelectedDishNamesModelClassForUtils =
      GetSelectedDishNamesModelClassForUtils();

  for (int i = 0; i < saladsCounterValuArray.length; i++) {
    if (saladsCounterValuArray[i] > 0) {
      selectedDishesNamesArray
          .add(getDishesResponse.tableMenuList[0].categoryDishes[i].dishName);
      selectedDishesPricesArray
          .add(getDishesResponse.tableMenuList[0].categoryDishes[i].dishPrice);
      selectedDishesCalorieArray.add(getDishesResponse
          .tableMenuList[0].categoryDishes[i].dishCalories
          .toString());
      selectedDishesCountsArray.add(saladsCounterValuArray[i].toString());
    }
  }
  for (int i = 0; i < benyardCounterValuArray.length; i++) {
    if (benyardCounterValuArray[i] > 0) {
      selectedDishesNamesArray
          .add(getDishesResponse.tableMenuList[1].categoryDishes[i].dishName);
      selectedDishesPricesArray
          .add(getDishesResponse.tableMenuList[1].categoryDishes[i].dishPrice);
      selectedDishesCalorieArray.add(getDishesResponse
          .tableMenuList[1].categoryDishes[i].dishCalories
          .toString());
      selectedDishesCountsArray.add(benyardCounterValuArray[i].toString());
    }
  }
  for (int i = 0; i < henCounterValuArray.length; i++) {
    if (henCounterValuArray[i] > 0) {
      selectedDishesNamesArray
          .add(getDishesResponse.tableMenuList[2].categoryDishes[i].dishName);
      selectedDishesPricesArray
          .add(getDishesResponse.tableMenuList[2].categoryDishes[i].dishPrice);
      selectedDishesCalorieArray.add(getDishesResponse
          .tableMenuList[2].categoryDishes[i].dishCalories
          .toString());
      selectedDishesCountsArray.add(henCounterValuArray[i].toString());
    }
  }
  for (int i = 0; i < seaCounterValuArray.length; i++) {
    if (seaCounterValuArray[i] > 0) {
      selectedDishesNamesArray
          .add(getDishesResponse.tableMenuList[3].categoryDishes[i].dishName);
      selectedDishesPricesArray
          .add(getDishesResponse.tableMenuList[3].categoryDishes[i].dishPrice);
      selectedDishesCalorieArray.add(getDishesResponse
          .tableMenuList[3].categoryDishes[i].dishCalories
          .toString());
      selectedDishesCountsArray.add(seaCounterValuArray[i].toString());
    }
  }
  for (int i = 0; i < biryaniCounterValuArray.length; i++) {
    if (biryaniCounterValuArray[i] > 0) {
      selectedDishesNamesArray
          .add(getDishesResponse.tableMenuList[4].categoryDishes[i].dishName);
      selectedDishesPricesArray
          .add(getDishesResponse.tableMenuList[4].categoryDishes[i].dishPrice);
      selectedDishesCalorieArray.add(getDishesResponse
          .tableMenuList[4].categoryDishes[i].dishCalories
          .toString());
      selectedDishesCountsArray.add(biryaniCounterValuArray[i].toString());
    }
  }
  for (int i = 0; i < fastFoodCounterValuArray.length; i++) {
    if (fastFoodCounterValuArray[i] > 0) {
      selectedDishesNamesArray
          .add(getDishesResponse.tableMenuList[5].categoryDishes[i].dishName);
      selectedDishesPricesArray
          .add(getDishesResponse.tableMenuList[5].categoryDishes[i].dishPrice);
      selectedDishesCalorieArray.add(getDishesResponse
          .tableMenuList[5].categoryDishes[i].dishCalories
          .toString());
      selectedDishesCountsArray.add(fastFoodCounterValuArray[i].toString());
    }
  }

  getSelectedDishNamesModelClassForUtils =
      GetSelectedDishNamesModelClassForUtils(
          selectedDishesCalorieArray: selectedDishesCalorieArray,
          selectedDishesCountsArray: selectedDishesCountsArray,
          selectedDishesNamesArray: selectedDishesNamesArray,
          selectedDishesPricesArray: selectedDishesPricesArray);

  // print(
  //     "selected items names array is " + selectedDishesNamesArray.toString());
  // print("selected items prices array is " +
  //     selectedDishesPricesArray.toString());
  // print("selected items calories array is " +
  //     selectedDishesCalorieArray.toString());
  // print("selected dishes counts array is " +
  //     selectedDishesCountsArray.toString());
  // print("saladsCounterValuArray is " +
  //     widget.saladsCounterValuArray.toString());
  // print("benyardCounterValuArray is " +
  //     widget.benyardCounterValuArray.toString());
  // print("henCounterValuArray is " + widget.henCounterValuArray.toString());
  // print("seaCounterValuArray is " + widget.seaCounterValuArray.toString());
  // print("biryaniCounterValuArray is " +
  //     widget.biryaniCounterValuArray.toString());
  // print("fastFoodCounterValuArray is " +
  //     widget.fastFoodCounterValuArray.toString());

  return getSelectedDishNamesModelClassForUtils;
}
