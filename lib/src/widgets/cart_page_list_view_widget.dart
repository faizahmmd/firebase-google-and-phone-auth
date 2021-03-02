import 'package:demomachinetest/src/utils/constants.dart';
import 'package:demomachinetest/src/utils/utils.dart';
import 'package:demomachinetest/src/widgets/home_page_list_view_icon.dart';
import 'package:flutter/material.dart';

import 'home_page_list_view_counter_widget.dart';

class CartPageListViewWidget extends StatefulWidget {
  String dishName, calorie, dishCount;
  int totalDishesCount;
  double price;
  double priceFinal;

  Function addCounterValue, subtractCounterValue;
  CartPageListViewWidget(
      {this.dishName,
      this.price,
      this.calorie,
      this.dishCount,
      this.totalDishesCount,
      this.addCounterValue,
      this.subtractCounterValue,
      this.priceFinal});
  @override
  _CartPageListViewWidgetState createState() => _CartPageListViewWidgetState();
}

class _CartPageListViewWidgetState extends State<CartPageListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1.1),
      // height: screenHeight(context, dividedBy: 4.0),
      // color: Colors.greenAccent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: HomePageListViewIcon(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context, dividedBy: 50.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidth(context, dividedBy: 4.0),
                        //  color: Colors.yellow,
                        child: Text(
                          widget.dishName,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              color: Constants.kitGradients[1].withOpacity(0.9),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context, dividedBy: 145.0),
                      ),
                      Container(
                        width: screenWidth(context, dividedBy: 4.0),
                        // color: Colors.yellow,
                        child: Text(
                          "INR " +
                              sARToINRConversion(widget.price)
                                  .toStringAsFixed(2),
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              color: Constants.kitGradients[1].withOpacity(0.8),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context, dividedBy: 145.0),
                      ),
                      Container(
                        width: screenWidth(context, dividedBy: 4.0),
                        //color: Colors.yellow,
                        child: Text(
                          widget.calorie + " calories",
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              color: Constants.kitGradients[1].withOpacity(0.9),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                HomePageListViewWidgetCounter(
                  counterValue: int.parse(widget.dishCount),
                  addCounterValue: widget.addCounterValue,
                  subtractCounterValue: widget.subtractCounterValue,
                ),
                Container(
                  width: screenWidth(context, dividedBy: 6.2),
                  height: screenHeight(context, dividedBy: 25.0),
                  // color: Colors.yellow,
                  child: FittedBox(
                    child: Text(
                      "INR " + widget.priceFinal.toStringAsFixed(2),
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        color: Constants.kitGradients[1].withOpacity(0.9),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Constants.kitGradients[2].withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }
}
