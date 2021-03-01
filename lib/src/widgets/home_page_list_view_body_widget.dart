import 'package:demomachinetest/src/utils/constants.dart';
import 'package:demomachinetest/src/utils/utils.dart';
import 'package:flutter/material.dart';

import 'home_page_list_view_body_dish_details_widget.dart';
import 'home_page_list_view_icon.dart';
import 'home_page_list_view_image_widget.dart';

class HomePageListViewBodyWidget extends StatefulWidget {
  final String dishName, sar, calories, description, imagePath;
  final addOnCategoryAvailabilityStatus;
  final bool nonVegetarian;
  final Function addCounterValue, subtractCounterValue;
  int counterValue;

  HomePageListViewBodyWidget(
      {this.dishName,
      this.sar,
      this.calories,
      this.description,
      this.imagePath,
      this.addOnCategoryAvailabilityStatus,
      this.nonVegetarian,
      this.subtractCounterValue,
      this.addCounterValue,
      this.counterValue});

  @override
  _HomePageListViewBodyWidgetState createState() =>
      _HomePageListViewBodyWidgetState();
}

class _HomePageListViewBodyWidgetState
    extends State<HomePageListViewBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Card(
        child: Container(
          width: screenWidth(context, dividedBy: 1),
          color: Constants.kitGradients[0],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight(context, dividedBy: 130)),
                  child: HomePageListViewIcon(
                    nonVegetarian: widget.nonVegetarian,
                  ),
                ),
                SizedBox(
                  width: screenWidth(context, dividedBy: 30.0),
                ),
                HomePageListViewBodyDishDetails(
                  dishName: widget.dishName,
                  sar: widget.sar,
                  calories: widget.calories + " calories",
                  description: widget.description,
                  addOnCategoryAvailabilityStatus:
                      widget.addOnCategoryAvailabilityStatus,
                  addCounterValue: widget.addCounterValue,
                  subtractCounterValue: widget.subtractCounterValue,
                  counterValue: widget.counterValue,
                ),
                SizedBox(
                  width: screenWidth(context, dividedBy: 150.0),
                ),
                HomePageListViewImageWidget(
                  imagePath: widget.imagePath,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
