import 'package:demomachinetest/src/bloc/user_bloc.dart';
import 'package:demomachinetest/src/models/get_dish_list_response.dart';
import 'package:demomachinetest/src/screens/cart_page.dart';
import 'package:demomachinetest/src/utils/constants.dart';
import 'package:demomachinetest/src/utils/object_factory.dart';
import 'package:demomachinetest/src/utils/utils.dart';
import 'package:demomachinetest/src/widgets/home_drawer.dart';
import 'package:demomachinetest/src/widgets/home_page_app_bar.dart';
import 'package:demomachinetest/src/widgets/home_page_list_view_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController = ScrollController();
  UserBloc _userBloc = UserBloc();
  List<bool> loadingStatusArray;
  GetDishListResponse _dishListResponse = GetDishListResponse();
  List<int> saladsCounterValuArray = [];
  List<int> benyardCounterValuArray = [];
  List<int> henCounterValuArray = [];
  List<int> seaCounterValuArray = [];
  List<int> biryaniCounterValuArray = [];
  List<int> fastFoodCounterValuArray = [];
  int cartCount;

  @override
  void initState() {
    if (ObjectFactory().appHive.getCartCount() == null) {
      ObjectFactory().appHive.putCartCount(value: 0);
    }
    setState(() {
      loadingStatusArray = [true, true, true, true, true, true];
      cartCount = 0;
    });
    _userBloc.getDishListCall();
    _userBloc.getDishListStream.listen((event) {
      setState(() {
        loadingStatusArray = [false, false, false, false, false, false];
        _dishListResponse = event;
      });
      counterValueCalculations(event);
    });
    super.initState();
  }

  @override
  void dispose() {
    _userBloc.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    await FlutterStatusbarManager.setColor(Constants.kitGradients[4]);
    await FlutterStatusbarManager.setStyle(StatusBarStyle.LIGHT_CONTENT);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kitGradients[0],
      key: _globalKey,
      appBar: AppBar(
        toolbarHeight: 50.0,
        actions: [
          HomePageAppBar(
            onTapLeftIcon: () {
              _globalKey.currentState.openDrawer();
            },
            onTapRightIcon: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartPage(
                            saladsCounterValuArray: saladsCounterValuArray,
                            benyardCounterValuArray: benyardCounterValuArray,
                            henCounterValuArray: henCounterValuArray,
                            seaCounterValuArray: seaCounterValuArray,
                            biryaniCounterValuArray: biryaniCounterValuArray,
                            fastFoodCounterValuArray: fastFoodCounterValuArray,
                            getDishesResponse: _dishListResponse,
                          )));
            },
            cartCount: cartCount,
          )
        ],
      ),
      drawer: HomeDrawer(),
      body: Container(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                Widget>[
          DefaultTabController(
              length: 6, // length of tabs
              initialIndex: 0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: TabBar(
                        isScrollable: true,
                        indicatorColor: Constants.kitGradients[8],
                        labelColor: Constants.kitGradients[8],
                        unselectedLabelColor:
                            Constants.kitGradients[2].withOpacity(0.7),
                        tabs: [
                          Tab(text: 'Salads and soups'),
                          Tab(text: 'From The Benyard'),
                          Tab(text: 'From the Hen House'),
                          Tab(text: 'From the Sea'),
                          Tab(text: 'Biryani'),
                          Tab(text: 'Fast Food'),
                        ],
                      ),
                    ),
                    Container(
                        height: screenHeight(context,
                            dividedBy: 1.25), //height of TabBarView
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Constants.kitGradients[2],
                                    width: 0.5))),
                        child: TabBarView(children: <Widget>[
                          loadingStatusArray[0] == false
                              ? ListView.builder(
                                  itemCount: _dishListResponse
                                      .tableMenuList[0].categoryDishes.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  controller: scrollController,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return HomePageListViewBodyWidget(
                                      dishName: _dishListResponse
                                          .tableMenuList[0]
                                          .categoryDishes[index]
                                          .dishName,
                                      imagePath: _dishListResponse
                                          .tableMenuList[0]
                                          .categoryDishes[index]
                                          .dishImage,
                                      sar: _dishListResponse.tableMenuList[0]
                                          .categoryDishes[index].dishPrice
                                          .toString(),
                                      calories: _dishListResponse
                                          .tableMenuList[0]
                                          .categoryDishes[index]
                                          .dishCalories
                                          .toString(),
                                      description: _dishListResponse
                                          .tableMenuList[0]
                                          .categoryDishes[index]
                                          .dishDescription,
                                      addOnCategoryAvailabilityStatus:
                                          _dishListResponse
                                                      .tableMenuList[0]
                                                      .categoryDishes[index]
                                                      .addonCat
                                                      .length >
                                                  0
                                              ? true
                                              : false,
                                      nonVegetarian: _dishListResponse
                                                  .tableMenuList[0]
                                                  .categoryDishes[index]
                                                  .dishType ==
                                              1
                                          ? true
                                          : false,
                                      addCounterValue: () {
                                        setState(() {
                                          saladsCounterValuArray[index] =
                                              addCounter(saladsCounterValuArray[
                                                  index]);
                                          cartCount = cartItemsTotal(
                                              saladsCounterValuArray,
                                              benyardCounterValuArray,
                                              henCounterValuArray,
                                              seaCounterValuArray,
                                              biryaniCounterValuArray,
                                              fastFoodCounterValuArray);
                                        });
                                      },
                                      subtractCounterValue: () {
                                        setState(() {
                                          saladsCounterValuArray[index] =
                                              decrementCounter(
                                                  saladsCounterValuArray[
                                                      index]);
                                          cartCount = cartItemsTotal(
                                              saladsCounterValuArray,
                                              benyardCounterValuArray,
                                              henCounterValuArray,
                                              seaCounterValuArray,
                                              biryaniCounterValuArray,
                                              fastFoodCounterValuArray);
                                        });
                                      },
                                      counterValue:
                                          saladsCounterValuArray[index],
                                    );
                                  })
                              : Center(
                                  child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Constants.kitGradients[4]),
                                )),
                          loadingStatusArray[1] == false
                              ? ListView.builder(
                                  itemCount: _dishListResponse
                                      .tableMenuList[1].categoryDishes.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  controller: scrollController,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return HomePageListViewBodyWidget(
                                      dishName: _dishListResponse
                                          .tableMenuList[1]
                                          .categoryDishes[index]
                                          .dishName,
                                      imagePath: _dishListResponse
                                          .tableMenuList[1]
                                          .categoryDishes[index]
                                          .dishImage,
                                      sar: _dishListResponse.tableMenuList[1]
                                          .categoryDishes[index].dishPrice
                                          .toString(),
                                      calories: _dishListResponse
                                          .tableMenuList[1]
                                          .categoryDishes[index]
                                          .dishCalories
                                          .toString(),
                                      description: _dishListResponse
                                          .tableMenuList[1]
                                          .categoryDishes[index]
                                          .dishDescription,
                                      addOnCategoryAvailabilityStatus:
                                          _dishListResponse
                                                      .tableMenuList[1]
                                                      .categoryDishes[index]
                                                      .addonCat
                                                      .length >
                                                  0
                                              ? true
                                              : false,
                                      nonVegetarian: _dishListResponse
                                                  .tableMenuList[1]
                                                  .categoryDishes[index]
                                                  .dishType ==
                                              1
                                          ? true
                                          : false,
                                      addCounterValue: () {
                                        setState(() {
                                          benyardCounterValuArray[index] =
                                              addCounter(
                                                  benyardCounterValuArray[
                                                      index]);
                                          cartCount = cartItemsTotal(
                                              saladsCounterValuArray,
                                              benyardCounterValuArray,
                                              henCounterValuArray,
                                              seaCounterValuArray,
                                              biryaniCounterValuArray,
                                              fastFoodCounterValuArray);
                                        });
                                      },
                                      subtractCounterValue: () {
                                        setState(() {
                                          benyardCounterValuArray[index] =
                                              decrementCounter(
                                                  benyardCounterValuArray[
                                                      index]);
                                          cartCount = cartItemsTotal(
                                              saladsCounterValuArray,
                                              benyardCounterValuArray,
                                              henCounterValuArray,
                                              seaCounterValuArray,
                                              biryaniCounterValuArray,
                                              fastFoodCounterValuArray);
                                        });
                                      },
                                      counterValue:
                                          benyardCounterValuArray[index],
                                    );
                                  })
                              : Center(
                                  child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Constants.kitGradients[4]),
                                )),
                          loadingStatusArray[2] == false
                              ? ListView.builder(
                                  itemCount: _dishListResponse
                                      .tableMenuList[2].categoryDishes.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  controller: scrollController,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return HomePageListViewBodyWidget(
                                      dishName: _dishListResponse
                                          .tableMenuList[2]
                                          .categoryDishes[index]
                                          .dishName,
                                      imagePath: _dishListResponse
                                          .tableMenuList[2]
                                          .categoryDishes[index]
                                          .dishImage,
                                      sar: _dishListResponse.tableMenuList[2]
                                          .categoryDishes[index].dishPrice
                                          .toString(),
                                      calories: _dishListResponse
                                          .tableMenuList[2]
                                          .categoryDishes[index]
                                          .dishCalories
                                          .toString(),
                                      description: _dishListResponse
                                          .tableMenuList[2]
                                          .categoryDishes[index]
                                          .dishDescription,
                                      addOnCategoryAvailabilityStatus:
                                          _dishListResponse
                                                      .tableMenuList[2]
                                                      .categoryDishes[index]
                                                      .addonCat
                                                      .length >
                                                  0
                                              ? true
                                              : false,
                                      nonVegetarian: _dishListResponse
                                                  .tableMenuList[2]
                                                  .categoryDishes[index]
                                                  .dishType ==
                                              1
                                          ? true
                                          : false,
                                      addCounterValue: () {
                                        setState(() {
                                          henCounterValuArray[index] =
                                              addCounter(
                                                  henCounterValuArray[index]);
                                          cartCount = cartItemsTotal(
                                              saladsCounterValuArray,
                                              benyardCounterValuArray,
                                              henCounterValuArray,
                                              seaCounterValuArray,
                                              biryaniCounterValuArray,
                                              fastFoodCounterValuArray);
                                        });
                                      },
                                      subtractCounterValue: () {
                                        setState(() {
                                          henCounterValuArray[index] =
                                              decrementCounter(
                                                  henCounterValuArray[index]);
                                          cartCount = cartItemsTotal(
                                              saladsCounterValuArray,
                                              benyardCounterValuArray,
                                              henCounterValuArray,
                                              seaCounterValuArray,
                                              biryaniCounterValuArray,
                                              fastFoodCounterValuArray);
                                        });
                                      },
                                      counterValue: henCounterValuArray[index],
                                    );
                                  })
                              : Center(
                                  child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Constants.kitGradients[4]),
                                )),
                          loadingStatusArray[3] == false
                              ? ListView.builder(
                                  itemCount: _dishListResponse
                                      .tableMenuList[3].categoryDishes.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  controller: scrollController,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return HomePageListViewBodyWidget(
                                      dishName: _dishListResponse
                                          .tableMenuList[3]
                                          .categoryDishes[index]
                                          .dishName,
                                      imagePath: _dishListResponse
                                          .tableMenuList[3]
                                          .categoryDishes[index]
                                          .dishImage,
                                      sar: _dishListResponse.tableMenuList[3]
                                          .categoryDishes[index].dishPrice
                                          .toString(),
                                      calories: _dishListResponse
                                          .tableMenuList[3]
                                          .categoryDishes[index]
                                          .dishCalories
                                          .toString(),
                                      description: _dishListResponse
                                          .tableMenuList[3]
                                          .categoryDishes[index]
                                          .dishDescription,
                                      addOnCategoryAvailabilityStatus:
                                          _dishListResponse
                                                      .tableMenuList[3]
                                                      .categoryDishes[index]
                                                      .addonCat
                                                      .length >
                                                  0
                                              ? true
                                              : false,
                                      nonVegetarian: _dishListResponse
                                                  .tableMenuList[3]
                                                  .categoryDishes[index]
                                                  .dishType ==
                                              1
                                          ? true
                                          : false,
                                      addCounterValue: () {
                                        setState(() {
                                          seaCounterValuArray[index] =
                                              addCounter(
                                                  seaCounterValuArray[index]);
                                          cartCount = cartItemsTotal(
                                              saladsCounterValuArray,
                                              benyardCounterValuArray,
                                              henCounterValuArray,
                                              seaCounterValuArray,
                                              biryaniCounterValuArray,
                                              fastFoodCounterValuArray);
                                        });
                                      },
                                      subtractCounterValue: () {
                                        setState(() {
                                          seaCounterValuArray[index] =
                                              decrementCounter(
                                                  seaCounterValuArray[index]);
                                          cartCount = cartItemsTotal(
                                              saladsCounterValuArray,
                                              benyardCounterValuArray,
                                              henCounterValuArray,
                                              seaCounterValuArray,
                                              biryaniCounterValuArray,
                                              fastFoodCounterValuArray);
                                        });
                                      },
                                      counterValue: seaCounterValuArray[index],
                                    );
                                  })
                              : Center(
                                  child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Constants.kitGradients[4]),
                                )),
                          loadingStatusArray[4] == false
                              ? ListView.builder(
                                  itemCount: _dishListResponse
                                      .tableMenuList[4].categoryDishes.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  controller: scrollController,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return HomePageListViewBodyWidget(
                                      dishName: _dishListResponse
                                          .tableMenuList[4]
                                          .categoryDishes[index]
                                          .dishName,
                                      imagePath: _dishListResponse
                                          .tableMenuList[4]
                                          .categoryDishes[index]
                                          .dishImage,
                                      sar: _dishListResponse.tableMenuList[4]
                                          .categoryDishes[index].dishPrice
                                          .toString(),
                                      calories: _dishListResponse
                                          .tableMenuList[4]
                                          .categoryDishes[index]
                                          .dishCalories
                                          .toString(),
                                      description: _dishListResponse
                                          .tableMenuList[4]
                                          .categoryDishes[index]
                                          .dishDescription,
                                      addOnCategoryAvailabilityStatus:
                                          _dishListResponse
                                                      .tableMenuList[4]
                                                      .categoryDishes[index]
                                                      .addonCat
                                                      .length >
                                                  0
                                              ? true
                                              : false,
                                      nonVegetarian: _dishListResponse
                                                  .tableMenuList[4]
                                                  .categoryDishes[index]
                                                  .dishType ==
                                              1
                                          ? true
                                          : false,
                                      addCounterValue: () {
                                        setState(() {
                                          biryaniCounterValuArray[index] =
                                              addCounter(
                                                  biryaniCounterValuArray[
                                                      index]);
                                          cartCount = cartItemsTotal(
                                              saladsCounterValuArray,
                                              benyardCounterValuArray,
                                              henCounterValuArray,
                                              seaCounterValuArray,
                                              biryaniCounterValuArray,
                                              fastFoodCounterValuArray);
                                        });
                                      },
                                      subtractCounterValue: () {
                                        setState(() {
                                          biryaniCounterValuArray[index] =
                                              decrementCounter(
                                                  biryaniCounterValuArray[
                                                      index]);
                                          cartCount = cartItemsTotal(
                                              saladsCounterValuArray,
                                              benyardCounterValuArray,
                                              henCounterValuArray,
                                              seaCounterValuArray,
                                              biryaniCounterValuArray,
                                              fastFoodCounterValuArray);
                                        });
                                      },
                                      counterValue:
                                          biryaniCounterValuArray[index],
                                    );
                                  })
                              : Center(
                                  child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Constants.kitGradients[4]),
                                )),
                          loadingStatusArray[5] == false
                              ? ListView.builder(
                                  itemCount: _dishListResponse
                                      .tableMenuList[5].categoryDishes.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  controller: scrollController,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return HomePageListViewBodyWidget(
                                      dishName: _dishListResponse
                                          .tableMenuList[5]
                                          .categoryDishes[index]
                                          .dishName,
                                      imagePath: _dishListResponse
                                          .tableMenuList[5]
                                          .categoryDishes[index]
                                          .dishImage,
                                      sar: _dishListResponse.tableMenuList[5]
                                          .categoryDishes[index].dishPrice
                                          .toString(),
                                      calories: _dishListResponse
                                          .tableMenuList[5]
                                          .categoryDishes[index]
                                          .dishCalories
                                          .toString(),
                                      description: _dishListResponse
                                          .tableMenuList[5]
                                          .categoryDishes[index]
                                          .dishDescription,
                                      addOnCategoryAvailabilityStatus:
                                          _dishListResponse
                                                      .tableMenuList[5]
                                                      .categoryDishes[index]
                                                      .addonCat
                                                      .length >
                                                  0
                                              ? true
                                              : false,
                                      nonVegetarian: _dishListResponse
                                                  .tableMenuList[5]
                                                  .categoryDishes[index]
                                                  .dishType ==
                                              1
                                          ? true
                                          : false,
                                      addCounterValue: () {
                                        setState(() {
                                          fastFoodCounterValuArray[index] =
                                              addCounter(
                                                  fastFoodCounterValuArray[
                                                      index]);
                                          cartCount = cartItemsTotal(
                                              saladsCounterValuArray,
                                              benyardCounterValuArray,
                                              henCounterValuArray,
                                              seaCounterValuArray,
                                              biryaniCounterValuArray,
                                              fastFoodCounterValuArray);
                                        });
                                      },
                                      subtractCounterValue: () {
                                        setState(() {
                                          fastFoodCounterValuArray[index] =
                                              decrementCounter(
                                                  fastFoodCounterValuArray[
                                                      index]);
                                          cartCount = cartItemsTotal(
                                              saladsCounterValuArray,
                                              benyardCounterValuArray,
                                              henCounterValuArray,
                                              seaCounterValuArray,
                                              biryaniCounterValuArray,
                                              fastFoodCounterValuArray);
                                        });
                                      },
                                      counterValue:
                                          fastFoodCounterValuArray[index],
                                    );
                                  })
                              : Center(
                                  child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Constants.kitGradients[4]),
                                )),
                        ]))
                  ])),
        ]),
      ),
    );
  }

  counterValueCalculations(event) {
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
    // print("saladsCounterValuArray is " + saladsCounterValuArray.toString());
    // print("benyardCounterValuArray is " + benyardCounterValuArray.toString());
    // print("henCounterValuArray is " + henCounterValuArray.toString());
    // print("seaCounterValuArray is " + seaCounterValuArray.toString());
    // print("biryaniCounterValuArray is " + biryaniCounterValuArray.toString());
    // print("fastFoodCounterValuArray is " + fastFoodCounterValuArray.toString());
  }
}
