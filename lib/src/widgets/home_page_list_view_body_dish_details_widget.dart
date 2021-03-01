import 'package:demomachinetest/src/utils/constants.dart';
import 'package:demomachinetest/src/utils/utils.dart';
import 'package:flutter/material.dart';

import 'home_page_list_view_counter_widget.dart';

class HomePageListViewBodyDishDetails extends StatefulWidget {
  final String dishName, sar, calories, description;
  final bool addOnCategoryAvailabilityStatus;

  HomePageListViewBodyDishDetails(
      {this.dishName,
      this.sar,
      this.calories,
      this.description,
      this.addOnCategoryAvailabilityStatus});

  @override
  _HomePageListViewBodyDishDetailsState createState() =>
      _HomePageListViewBodyDishDetailsState();
}

class _HomePageListViewBodyDishDetailsState
    extends State<HomePageListViewBodyDishDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1.52),
      // color: Colors.greenAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenWidth(context, dividedBy: 1.52),
            child: Text(
              widget.dishName,
              overflow: TextOverflow.visible,
              style: TextStyle(
                  color: Constants.kitGradients[2],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: screenHeight(context, dividedBy: 105),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.sar,
                  style: TextStyle(
                      color: Constants.kitGradients[2],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.calories,
                  style: TextStyle(
                      color: Constants.kitGradients[2],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight(context, dividedBy: 80.0),
          ),
          Container(
            width: screenWidth(context, dividedBy: 1.52),
            child: Text(
              widget.description,
              overflow: TextOverflow.visible,
              style: TextStyle(
                  color: Constants.kitGradients[2].withOpacity(0.7),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: screenHeight(context, dividedBy: 60.0),
          ),
          HomePageListViewWidgetCounter(),
          SizedBox(
            height: screenHeight(context, dividedBy: 60.0),
          ),
          widget.addOnCategoryAvailabilityStatus == true
              ? Container(
                  width: screenWidth(context, dividedBy: 1.52),
                  child: Text(
                    "Customizations available",
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        color: Constants.kitGradients[8],
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300),
                  ),
                )
              : Container(),
          SizedBox(
            height: screenHeight(context, dividedBy: 60.0),
          ),
        ],
      ),
    );
  }
}
