import 'package:demomachinetest/src/models/get_dish_list_response.dart';
import 'package:demomachinetest/src/screens/home_page.dart';
import 'package:demomachinetest/src/utils/constants.dart';
import 'package:demomachinetest/src/utils/utils.dart';
import 'package:demomachinetest/src/widgets/cart_page_list_view_widget.dart';
import 'package:demomachinetest/src/widgets/cart_page_submit_button.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  List<int> saladsCounterValuArray = [];
  List<int> benyardCounterValuArray = [];
  List<int> henCounterValuArray = [];
  List<int> seaCounterValuArray = [];
  List<int> biryaniCounterValuArray = [];
  List<int> fastFoodCounterValuArray = [];
  GetDishListResponse getDishesResponse;

  CartPage(
      {this.fastFoodCounterValuArray,
      this.biryaniCounterValuArray,
      this.seaCounterValuArray,
      this.henCounterValuArray,
      this.benyardCounterValuArray,
      this.saladsCounterValuArray,
      this.getDishesResponse});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int totalDishesCount = 0;
  int totalItems = 0;
  int totalPrice = 0;
  double priceFinal = 0;

  List<String> selectedDishesNamesArray = [];
  List<double> selectedDishesPricesArray = [];
  List<String> selectedDishesCalorieArray = [];
  List<String> selectedDishesCountsArray = [];

  @override
  void initState() {
    totalDishesCount = totalDishesForCartPage(
        widget.saladsCounterValuArray,
        widget.benyardCounterValuArray,
        widget.henCounterValuArray,
        widget.seaCounterValuArray,
        widget.biryaniCounterValuArray,
        widget.fastFoodCounterValuArray);
    totalItems = cartItemsTotal(
        widget.saladsCounterValuArray,
        widget.benyardCounterValuArray,
        widget.henCounterValuArray,
        widget.seaCounterValuArray,
        widget.biryaniCounterValuArray,
        widget.fastFoodCounterValuArray);
    getSelectedDishNames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kitGradients[0],
      appBar: AppBar(
        backgroundColor: Constants.kitGradients[0],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Constants.kitGradients[2].withOpacity(0.6),
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false);
          },
        ),
        title: Text(
          "Order Summary",
          style: TextStyle(
              color: Constants.kitGradients[2].withOpacity(0.6),
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight(context, dividedBy: 45.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: Container(
                  width: screenWidth(context, dividedBy: 1.1),
                  height: screenHeight(context, dividedBy: 1.4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: screenWidth(context, dividedBy: 1.2),
                            height: screenHeight(context, dividedBy: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Constants.kitGradients[4]),
                            child: Center(
                              child: Text(
                                totalDishesCount.toString() +
                                    " Dishes - " +
                                    totalItems.toString() +
                                    " Items",
                                style: TextStyle(
                                    color: Constants.kitGradients[0],
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: totalDishesCount,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return CartPageListViewWidget(
                                dishName: selectedDishesNamesArray[index],
                                dishCount: selectedDishesCountsArray[index],
                                price: selectedDishesPricesArray[index],
                                calorie: selectedDishesCalorieArray[index],
                                totalDishesCount: totalDishesCount,
                                priceFinal: ((sARToINRConversion(
                                        selectedDishesPricesArray[index])) *
                                    (int.parse(
                                        selectedDishesCountsArray[index]))),
                                addCounterValue: () {
                                  setState(() {
                                    selectedDishesCountsArray[
                                        index] = addCounter(int.parse(
                                            selectedDishesCountsArray[index]))
                                        .toString();
                                    priceFinal = ((sARToINRConversion(
                                            selectedDishesPricesArray[index])) *
                                        (int.parse(
                                            selectedDishesCountsArray[index])));
                                    totalItems = totalItems + 1;
                                  });
                                },
                                subtractCounterValue: () {
                                  if ((int.parse(
                                          selectedDishesCountsArray[index])) >
                                      1) {
                                    setState(() {
                                      selectedDishesCountsArray[
                                          index] = decrementCounter(int.parse(
                                              selectedDishesCountsArray[index]))
                                          .toString();
                                      priceFinal = ((sARToINRConversion(
                                              selectedDishesPricesArray[
                                                  index])) *
                                          (int.parse(selectedDishesCountsArray[
                                              index])));
                                      totalItems = totalItems - 1;
                                    });
                                  }
                                },
                              );
                            }),
                      ),
                      Container(
                        height: screenHeight(context, dividedBy: 15.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Amount",
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                    color: Constants.kitGradients[1]
                                        .withOpacity(0.9),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "INR " +
                                    getTotalPrice(selectedDishesPricesArray,
                                            selectedDishesCountsArray)
                                        .toStringAsFixed(2),
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                    color: Constants.kitGradients[4],
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight(context, dividedBy: 25),
          ),
          CartPageSubmitButton(
            onPressed: () {},
          )
        ],
      ),
    );
  }

  getSelectedDishNames() async {
    selectedDishesNamesArray.clear();
    selectedDishesPricesArray.clear();
    selectedDishesCalorieArray.clear();
    selectedDishesCountsArray.clear();

    for (int i = 0; i < widget.saladsCounterValuArray.length; i++) {
      if (widget.saladsCounterValuArray[i] > 0) {
        selectedDishesNamesArray.add(widget
            .getDishesResponse.tableMenuList[0].categoryDishes[i].dishName);
        selectedDishesPricesArray.add(widget
            .getDishesResponse.tableMenuList[0].categoryDishes[i].dishPrice);
        selectedDishesCalorieArray.add(widget
            .getDishesResponse.tableMenuList[0].categoryDishes[i].dishCalories
            .toString());
        selectedDishesCountsArray
            .add(widget.saladsCounterValuArray[i].toString());
      }
    }
    for (int i = 0; i < widget.benyardCounterValuArray.length; i++) {
      if (widget.benyardCounterValuArray[i] > 0) {
        selectedDishesNamesArray.add(widget
            .getDishesResponse.tableMenuList[1].categoryDishes[i].dishName);
        selectedDishesPricesArray.add(widget
            .getDishesResponse.tableMenuList[1].categoryDishes[i].dishPrice);
        selectedDishesCalorieArray.add(widget
            .getDishesResponse.tableMenuList[1].categoryDishes[i].dishCalories
            .toString());
        selectedDishesCountsArray
            .add(widget.benyardCounterValuArray[i].toString());
      }
    }
    for (int i = 0; i < widget.henCounterValuArray.length; i++) {
      if (widget.henCounterValuArray[i] > 0) {
        selectedDishesNamesArray.add(widget
            .getDishesResponse.tableMenuList[2].categoryDishes[i].dishName);
        selectedDishesPricesArray.add(widget
            .getDishesResponse.tableMenuList[2].categoryDishes[i].dishPrice);
        selectedDishesCalorieArray.add(widget
            .getDishesResponse.tableMenuList[2].categoryDishes[i].dishCalories
            .toString());
        selectedDishesCountsArray.add(widget.henCounterValuArray[i].toString());
      }
    }
    for (int i = 0; i < widget.seaCounterValuArray.length; i++) {
      if (widget.seaCounterValuArray[i] > 0) {
        selectedDishesNamesArray.add(widget
            .getDishesResponse.tableMenuList[3].categoryDishes[i].dishName);
        selectedDishesPricesArray.add(widget
            .getDishesResponse.tableMenuList[3].categoryDishes[i].dishPrice);
        selectedDishesCalorieArray.add(widget
            .getDishesResponse.tableMenuList[3].categoryDishes[i].dishCalories
            .toString());
        selectedDishesCountsArray.add(widget.seaCounterValuArray[i].toString());
      }
    }
    for (int i = 0; i < widget.biryaniCounterValuArray.length; i++) {
      if (widget.biryaniCounterValuArray[i] > 0) {
        selectedDishesNamesArray.add(widget
            .getDishesResponse.tableMenuList[4].categoryDishes[i].dishName);
        selectedDishesPricesArray.add(widget
            .getDishesResponse.tableMenuList[4].categoryDishes[i].dishPrice);
        selectedDishesCalorieArray.add(widget
            .getDishesResponse.tableMenuList[4].categoryDishes[i].dishCalories
            .toString());
        selectedDishesCountsArray
            .add(widget.biryaniCounterValuArray[i].toString());
      }
    }
    for (int i = 0; i < widget.fastFoodCounterValuArray.length; i++) {
      if (widget.fastFoodCounterValuArray[i] > 0) {
        selectedDishesNamesArray.add(widget
            .getDishesResponse.tableMenuList[5].categoryDishes[i].dishName);
        selectedDishesPricesArray.add(widget
            .getDishesResponse.tableMenuList[5].categoryDishes[i].dishPrice);
        selectedDishesCalorieArray.add(widget
            .getDishesResponse.tableMenuList[5].categoryDishes[i].dishCalories
            .toString());
        selectedDishesCountsArray
            .add(widget.fastFoodCounterValuArray[i].toString());
      }
    }
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
  }
}
