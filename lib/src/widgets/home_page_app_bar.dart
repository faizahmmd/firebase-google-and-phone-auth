import 'package:demomachinetest/src/utils/constants.dart';
import 'package:demomachinetest/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePageAppBar extends StatefulWidget {
  final Function onTapLeftIcon, onTapRightIcon;
  HomePageAppBar({this.onTapLeftIcon, this.onTapRightIcon});
  @override
  _HomePageAppBarState createState() => _HomePageAppBarState();
}

class _HomePageAppBarState extends State<HomePageAppBar> {
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
              height: screenHeight(context, dividedBy: 15.0),
              child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/menu.svg',
                    color: Constants.kitGradients[5],
                  ),
                  onPressed: widget.onTapLeftIcon),
            ),
            Container(
              height: screenHeight(context, dividedBy: 15.0),
              child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/shopping_cart_icon.svg',
                    color: Constants.kitGradients[5],
                  ),
                  onPressed: widget.onTapRightIcon),
            ),
          ],
        ),
      ),
    );
  }
}
