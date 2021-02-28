import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:demomachinetest/auth_service/firebase_auth.dart';
import 'package:demomachinetest/src/screens/get_phone_number.dart';
import 'package:demomachinetest/src/utils/constants.dart';
import 'package:demomachinetest/src/utils/utils.dart';
import 'package:demomachinetest/src/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';
import 'package:flutter_svg/svg.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void didChangeDependencies() async {
    await FlutterStatusbarManager.setColor(Constants.kitGradients[0]);
    await FlutterStatusbarManager.setNetworkActivityIndicatorVisible(false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Constants.kitGradients[0],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight(context, dividedBy: 3.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: screenWidth(context, dividedBy: 2.0),
                height: screenHeight(context, dividedBy: 4.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/icons/firebase_icon.png'),
                        fit: BoxFit.fill)),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight(context, dividedBy: 8.0),
          ),
          SubmitButton(
            buttonName: 'Google',
            buttonColor: Constants.kitGradients[3],
            leftIcon: SvgPicture.asset('assets/icons/google_icon.svg'),
            onTap: () async {
              bool result = await DataConnectionChecker().hasConnection;
              if (result == true) {
                bool result = await DataConnectionChecker().hasConnection;
                if (result == true) {
                  await Auth().signInWithGoogle().then((value) {
                    if (value == 'Success') {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                          (route) => false);
                      showToast("Successfully logged in.");
                    } else {
                      showToast(value.toString());
                    }
                  });
                } else {
                  showToast("no internet connection.");
                }
              } else {
                showToast("no internet connection");
              }
            },
          ),
          SizedBox(
            height: screenHeight(context, dividedBy: 100.0),
          ),
          SubmitButton(
            buttonName: 'Phone',
            buttonColor: Constants.kitGradients[4],
            leftIcon: Icon(
              Icons.phone,
              color: Constants.kitGradients[0],
              size: 20.0,
            ),
            onTap: () async {
              bool result = await DataConnectionChecker().hasConnection;
              if (result == true) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GetPhoneNumber()));
              } else {
                showToast("no internet connection.");
              }
            },
          )
        ],
      ),
    );
  }
}
