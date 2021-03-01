import 'package:demomachinetest/src/utils/constants.dart';
import 'package:demomachinetest/src/utils/utils.dart';
import 'package:flutter/material.dart';

class CartPageSubmitButton extends StatefulWidget {
  final Function onPressed;
  CartPageSubmitButton({this.onPressed});
  @override
  _CartPageSubmitButtonState createState() => _CartPageSubmitButtonState();
}

class _CartPageSubmitButtonState extends State<CartPageSubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1.2),
      height: screenHeight(context, dividedBy: 15),
      child: RaisedButton(
        onPressed: widget.onPressed,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        color: Constants.kitGradients[4],
        child: Center(
          child: Text(
            "Place Order",
            overflow: TextOverflow.visible,
            style: TextStyle(
                color: Constants.kitGradients[0],
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
