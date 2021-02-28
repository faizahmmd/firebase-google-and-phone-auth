import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:demomachinetest/src/screens/otp_enter.dart';
import 'package:demomachinetest/src/utils/constants.dart';
import 'package:demomachinetest/src/utils/object_factory.dart';
import 'package:demomachinetest/src/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GetPhoneNumber extends StatefulWidget {
  @override
  _GetPhoneNumberState createState() => _GetPhoneNumberState();
}

class _GetPhoneNumberState extends State<GetPhoneNumber> {
  TextEditingController textEditingControllerMobileNumber =
      TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kitGradients[0],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Verify your mobile number",
                style: TextStyle(
                    color: Constants.kitGradients[4],
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight(context, dividedBy: 15),
              ),
              TextField(
                controller: textEditingControllerMobileNumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter Mobile Number",
                  hintText: "eg: 919645396284",
                  hintStyle: TextStyle(
                      color: Constants.kitGradients[2].withOpacity(0.5)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Constants.kitGradients[4]),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Constants.kitGradients[4]),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight(context, dividedBy: 15),
              ),
              Container(
                width: screenWidth(context, dividedBy: 1.0),
                height: screenHeight(context, dividedBy: 15),
                child: RaisedButton(
                  color: Constants.kitGradients[4],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      "Get OTP",
                      style: TextStyle(color: Constants.kitGradients[0]),
                    ),
                  ),
                  onPressed: () async {
                    bool result = await DataConnectionChecker().hasConnection;
                    if (result == true) {
                      ObjectFactory()
                          .authClassObject
                          .verifyPhone(
                              int.parse(textEditingControllerMobileNumber.text))
                          .then((value) {
                        if (value == "Success") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OTPEnter()));
                        } else {
                          showToast(value.toString());
                        }
                      });
                      print("mobile entered is " +
                          textEditingControllerMobileNumber.text);
                    } else {
                      showToast("no internet connection");
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
