import 'package:demomachinetest/src/screens/home_page.dart';
import 'package:demomachinetest/src/utils/constants.dart';
import 'package:demomachinetest/src/utils/utils.dart';
import 'package:demomachinetest/src/widgets/cart_page_list_view_widget.dart';
import 'package:demomachinetest/src/widgets/cart_page_submit_button.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
                                "2 Dishes - 2 Items",
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
                            itemCount: 5,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return CartPageListViewWidget();
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
                                "INR 65.00",
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
}
