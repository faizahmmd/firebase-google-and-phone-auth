import 'package:demomachinetest/src/utils/constants.dart';
import 'package:demomachinetest/src/utils/object_factory.dart';
import 'package:demomachinetest/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';

class HomePageAppBar extends StatefulWidget {
  final Function onTapLeftIcon, onTapRightIcon;

  HomePageAppBar({this.onTapLeftIcon, this.onTapRightIcon});

  @override
  _HomePageAppBarState createState() => _HomePageAppBarState();
}

class _HomePageAppBarState extends State<HomePageAppBar> {
  int cartCount;
  @override
  void initState() {
    if (ObjectFactory().appHive.getCartCount() == null) {
      setState(() {
        cartCount = 0;
      });
    } else {
      setState(() {
        cartCount = ObjectFactory().appHive.getCartCount();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1),
      color: Constants.kitGradients[0],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // height: screenHeight(context, dividedBy: 15.0),
              child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/menu.svg',
                    color: Constants.kitGradients[5],
                    height: 25.0,
                    width: 25.0,
                  ),
                  onPressed: widget.onTapLeftIcon),
            ),
            Container(
              // height: screenHeight(context, dividedBy: 15.0),
              // color: Colors.greenAccent,
              child: Stack(
                children: [
                  IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/shopping_cart_icon.svg',
                        color: Constants.kitGradients[5],
                        height: 25.0,
                        width: 25.0,
                      ),
                      onPressed: widget.onTapRightIcon),
                  Positioned(
                    right: 0.0,
                    top: 4.0,
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                          color: Constants.kitGradients[8].withOpacity(0.9),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Center(
                        child: Text(
                          cartCount.toString(),
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              color: Constants.kitGradients[0],
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
