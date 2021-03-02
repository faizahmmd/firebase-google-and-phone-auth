import 'package:demomachinetest/src/bloc/user_bloc.dart';
import 'package:demomachinetest/src/models/get_dish_list_response.dart';
import 'package:demomachinetest/src/screens/cart_page.dart';
import 'package:demomachinetest/src/utils/constants.dart';
import 'package:demomachinetest/src/utils/object_factory.dart';
import 'package:demomachinetest/src/utils/utils.dart';
import 'package:demomachinetest/src/widgets/home_drawer.dart';
import 'package:demomachinetest/src/widgets/home_page_app_bar.dart';
import 'package:demomachinetest/src/widgets/home_page_list_view_widget_for_salads_and_soups_tab.dart';
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
  List<List<int>> arrayFromUtil = [];
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
      arrayFromUtil = counterValueCalculations(event);
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
                            saladsCounterValuArray: arrayFromUtil[0],
                            benyardCounterValuArray: arrayFromUtil[1],
                            henCounterValuArray: arrayFromUtil[2],
                            seaCounterValuArray: arrayFromUtil[3],
                            biryaniCounterValuArray: arrayFromUtil[4],
                            fastFoodCounterValuArray: arrayFromUtil[5],
                            getDishesResponse: _dishListResponse,
                          )));
            },
            cartCount: cartCount,
          )
        ],
      ),
      drawer: HomeDrawer(),
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
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
                                  ? HomePageListViewSingleWidgetForAllTabs(
                                      tableMenuListArrayPositionForTabs: 0,
                                      scrollController: scrollController,
                                      arrayFromUtil: arrayFromUtil,
                                      dishListResponse: _dishListResponse,
                                      cartCountValue: (value) {
                                        setState(() {
                                          cartCount = value;
                                        });
                                      },
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                      valueColor:
                                          new AlwaysStoppedAnimation<Color>(
                                              Constants.kitGradients[4]),
                                    )),
                              loadingStatusArray[1] == false
                                  ? HomePageListViewSingleWidgetForAllTabs(
                                      tableMenuListArrayPositionForTabs: 1,
                                      scrollController: scrollController,
                                      arrayFromUtil: arrayFromUtil,
                                      dishListResponse: _dishListResponse,
                                      cartCountValue: (value) {
                                        setState(() {
                                          cartCount = value;
                                        });
                                      },
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                      valueColor:
                                          new AlwaysStoppedAnimation<Color>(
                                              Constants.kitGradients[4]),
                                    )),
                              loadingStatusArray[2] == false
                                  ? HomePageListViewSingleWidgetForAllTabs(
                                      tableMenuListArrayPositionForTabs: 2,
                                      scrollController: scrollController,
                                      arrayFromUtil: arrayFromUtil,
                                      dishListResponse: _dishListResponse,
                                      cartCountValue: (value) {
                                        setState(() {
                                          cartCount = value;
                                        });
                                      },
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                      valueColor:
                                          new AlwaysStoppedAnimation<Color>(
                                              Constants.kitGradients[4]),
                                    )),
                              loadingStatusArray[3] == false
                                  ? HomePageListViewSingleWidgetForAllTabs(
                                      tableMenuListArrayPositionForTabs: 3,
                                      scrollController: scrollController,
                                      arrayFromUtil: arrayFromUtil,
                                      dishListResponse: _dishListResponse,
                                      cartCountValue: (value) {
                                        setState(() {
                                          cartCount = value;
                                        });
                                      },
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                      valueColor:
                                          new AlwaysStoppedAnimation<Color>(
                                              Constants.kitGradients[4]),
                                    )),
                              loadingStatusArray[4] == false
                                  ? HomePageListViewSingleWidgetForAllTabs(
                                      tableMenuListArrayPositionForTabs: 4,
                                      scrollController: scrollController,
                                      arrayFromUtil: arrayFromUtil,
                                      dishListResponse: _dishListResponse,
                                      cartCountValue: (value) {
                                        setState(() {
                                          cartCount = value;
                                        });
                                      },
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                      valueColor:
                                          new AlwaysStoppedAnimation<Color>(
                                              Constants.kitGradients[4]),
                                    )),
                              loadingStatusArray[5] == false
                                  ? HomePageListViewSingleWidgetForAllTabs(
                                      tableMenuListArrayPositionForTabs: 5,
                                      scrollController: scrollController,
                                      arrayFromUtil: arrayFromUtil,
                                      dishListResponse: _dishListResponse,
                                      cartCountValue: (value) {
                                        setState(() {
                                          cartCount = value;
                                        });
                                      },
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                      valueColor:
                                          new AlwaysStoppedAnimation<Color>(
                                              Constants.kitGradients[4]),
                                    )),
                            ]))
                      ])),
            ]),
      ),
    );
  }
}
