import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:demomachinetest/src/utils/constants.dart';
import 'package:demomachinetest/src/utils/object_factory.dart';
import 'package:demomachinetest/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import 'home_page.dart';

class OTPEnter extends StatefulWidget {
  @override
  _OTPEnterState createState() => _OTPEnterState();
}

class _OTPEnterState extends State<OTPEnter> {
  String otp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kitGradients[0],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Enter your OTP",
              style: TextStyle(
                  color: Constants.kitGradients[4],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight(context, dividedBy: 15),
            ),
            OTPTextField(
              length: 6,
              width: screenWidth(context, dividedBy: 1),
              fieldWidth: 30.0,
              style: TextStyle(fontSize: 20),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                otp = pin;
                print("Completed: " + pin);
              },
            ),
            SizedBox(
              height: screenHeight(context, dividedBy: 15),
            ),
            Container(
              width: screenWidth(context, dividedBy: 1.1),
              height: screenHeight(context, dividedBy: 15),
              child: RaisedButton(
                color: Constants.kitGradients[4],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text(
                    "Done",
                    style: TextStyle(color: Constants.kitGradients[0]),
                  ),
                ),
                onPressed: () async {
                  bool result = await DataConnectionChecker().hasConnection;
                  if (result == true) {
                    ObjectFactory()
                        .authClassObject
                        .signInWithPhone(int.parse(otp.trim()))
                        .then((value) {
                      if (value == "Success") {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false);
                        showToast("Successfully logged in.");
                      } else {
                        showToast("Incorrect OTP entered.");
                      }
                    });
                  } else {
                    showToast("no internet connection.");
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
