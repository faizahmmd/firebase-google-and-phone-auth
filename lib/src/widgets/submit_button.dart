import 'package:demomachinetest/src/utils/constants.dart';
import 'package:demomachinetest/src/utils/utils.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  final String buttonName;
  final Widget leftIcon;
  final Color buttonColor;
  final Function onTap;

  SubmitButton({this.buttonName, this.leftIcon, this.buttonColor, this.onTap});

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: screenWidth(context, dividedBy: 1.3),
        height: screenHeight(context, dividedBy: 13.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            gradient: LinearGradient(colors: [
              widget.buttonColor.withOpacity(0.6),
              widget.buttonColor.withOpacity(0.8),
              widget.buttonColor.withOpacity(0.9),
              widget.buttonColor,
            ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth(context, dividedBy: 22.0),
            ),
            Container(
              child: widget.leftIcon,
              height: screenHeight(context, dividedBy: 25.0),
              width: screenWidth(context, dividedBy: 18.0),
            ),
            SizedBox(
              width: screenWidth(context, dividedBy: 5.0),
            ),
            Text(
              widget.buttonName,
              style: TextStyle(
                  color: Constants.kitGradients[0],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
