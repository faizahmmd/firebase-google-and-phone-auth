import 'package:demomachinetest/src/utils/constants.dart';
import 'package:flutter/material.dart';

class HomePageListViewIcon extends StatefulWidget {
  @override
  _HomePageListViewIconState createState() => _HomePageListViewIconState();
}

class _HomePageListViewIconState extends State<HomePageListViewIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15.0,
      height: 15.0,
      decoration: BoxDecoration(
          border: Border.all(color: Constants.kitGradients[4], width: 1.0)),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: Constants.kitGradients[4]),
        ),
      ),
    );
  }
}
