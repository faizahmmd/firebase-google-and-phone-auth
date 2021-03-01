import 'package:demomachinetest/src/utils/constants.dart';
import 'package:demomachinetest/src/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageListViewWidgetCounter extends StatefulWidget {
  @override
  _HomePageListViewWidgetCounterState createState() =>
      _HomePageListViewWidgetCounterState();
}

class _HomePageListViewWidgetCounterState
    extends State<HomePageListViewWidgetCounter> {
  int counterValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 3.0),
      height: screenHeight(context, dividedBy: 18.0),
      decoration: BoxDecoration(
          color: Constants.kitGradients[4].withOpacity(0.7),
          borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: Container(
              width: screenWidth(context, dividedBy: 12.0),
              height: screenHeight(context, dividedBy: 30.0),
              color: Colors.transparent,
              child: Center(
                child: Text(
                  "-",
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                      color: Constants.kitGradients[0],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                counterValue = decrementCounter(counterValue);
              });
            },
          ),
          Container(
            width: screenWidth(context, dividedBy: 12.0),
            height: screenHeight(context, dividedBy: 30.0),
            color: Colors.transparent,
            child: Center(
              child: Text(
                counterValue.toString(),
                overflow: TextOverflow.visible,
                style: TextStyle(
                    color: Constants.kitGradients[0],
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              width: screenWidth(context, dividedBy: 12.0),
              height: screenHeight(context, dividedBy: 30.0),
              color: Colors.transparent,
              child: Center(
                child: Text(
                  "+",
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                      color: Constants.kitGradients[0],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                counterValue = addCounter(counterValue);
              });
            },
          ),
        ],
      ),
    );
  }
}
