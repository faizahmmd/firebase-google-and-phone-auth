import 'package:demomachinetest/src/utils/utils.dart';
import 'package:flutter/material.dart';

class HomePageListViewImageWidget extends StatefulWidget {
  final String imagePath;
  HomePageListViewImageWidget({this.imagePath});
  @override
  _HomePageListViewImageWidgetState createState() =>
      _HomePageListViewImageWidgetState();
}

class _HomePageListViewImageWidgetState
    extends State<HomePageListViewImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 5.0),
      height: screenHeight(context, dividedBy: 8.0),
      child: Image.network(
        widget.imagePath,
        fit: BoxFit.fill,
      ),
    );
  }
}
