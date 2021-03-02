import 'package:demomachinetest/src/models/get_dish_list_response.dart';
import 'package:demomachinetest/src/utils/utils.dart';
import 'package:flutter/material.dart';

import 'home_page_list_view_body_widget.dart';

class HomePageListViewSingleWidgetForAllTabs extends StatefulWidget {
  final GetDishListResponse dishListResponse;
  final ScrollController scrollController;
  final List<List<int>> arrayFromUtil;
  final ValueChanged cartCountValue;
  final int tableMenuListArrayPositionForTabs;
  HomePageListViewSingleWidgetForAllTabs(
      {this.scrollController,
      this.dishListResponse,
      this.arrayFromUtil,
      this.cartCountValue,
      this.tableMenuListArrayPositionForTabs});
  @override
  _HomePageListViewSingleWidgetForAllTabsState createState() =>
      _HomePageListViewSingleWidgetForAllTabsState();
}

class _HomePageListViewSingleWidgetForAllTabsState
    extends State<HomePageListViewSingleWidgetForAllTabs> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget
            .dishListResponse
            .tableMenuList[widget.tableMenuListArrayPositionForTabs]
            .categoryDishes
            .length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        controller: widget.scrollController,
        itemBuilder: (BuildContext context, int index) {
          return HomePageListViewBodyWidget(
            dishName: widget
                .dishListResponse
                .tableMenuList[widget.tableMenuListArrayPositionForTabs]
                .categoryDishes[index]
                .dishName,
            imagePath: widget
                .dishListResponse
                .tableMenuList[widget.tableMenuListArrayPositionForTabs]
                .categoryDishes[index]
                .dishImage,
            sar: widget
                .dishListResponse
                .tableMenuList[widget.tableMenuListArrayPositionForTabs]
                .categoryDishes[index]
                .dishPrice
                .toString(),
            calories: widget
                .dishListResponse
                .tableMenuList[widget.tableMenuListArrayPositionForTabs]
                .categoryDishes[index]
                .dishCalories
                .toString(),
            description: widget
                .dishListResponse
                .tableMenuList[widget.tableMenuListArrayPositionForTabs]
                .categoryDishes[index]
                .dishDescription,
            addOnCategoryAvailabilityStatus: widget
                        .dishListResponse
                        .tableMenuList[widget.tableMenuListArrayPositionForTabs]
                        .categoryDishes[index]
                        .addonCat
                        .length >
                    0
                ? true
                : false,
            nonVegetarian: widget
                        .dishListResponse
                        .tableMenuList[widget.tableMenuListArrayPositionForTabs]
                        .categoryDishes[index]
                        .dishType ==
                    1
                ? true
                : false,
            addCounterValue: () {
              setState(() {
                widget.arrayFromUtil[widget.tableMenuListArrayPositionForTabs]
                    [index] = addCounter(widget
                        .arrayFromUtil[widget.tableMenuListArrayPositionForTabs]
                    [index]);
                int cartCount = cartItemsTotal(
                    widget.arrayFromUtil[0],
                    widget.arrayFromUtil[1],
                    widget.arrayFromUtil[2],
                    widget.arrayFromUtil[3],
                    widget.arrayFromUtil[4],
                    widget.arrayFromUtil[5]);
                widget.cartCountValue(cartCount);
              });
            },
            subtractCounterValue: () {
              setState(() {
                widget.arrayFromUtil[widget.tableMenuListArrayPositionForTabs]
                    [index] = decrementCounter(widget
                        .arrayFromUtil[widget.tableMenuListArrayPositionForTabs]
                    [index]);
                int cartCount = cartItemsTotal(
                    widget.arrayFromUtil[0],
                    widget.arrayFromUtil[1],
                    widget.arrayFromUtil[2],
                    widget.arrayFromUtil[3],
                    widget.arrayFromUtil[4],
                    widget.arrayFromUtil[5]);
                widget.cartCountValue(cartCount);
              });
            },
            counterValue: widget
                .arrayFromUtil[widget.tableMenuListArrayPositionForTabs][index],
          );
        });
  }
}
