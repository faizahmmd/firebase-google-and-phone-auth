import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:demomachinetest/auth_service/firebase_auth.dart';
import 'package:demomachinetest/src/screens/login_page.dart';
import 'package:demomachinetest/src/utils/constants.dart';
import 'package:demomachinetest/src/utils/object_factory.dart';
import 'package:demomachinetest/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            width: screenWidth(context, dividedBy: 1),
            height: screenHeight(context, dividedBy: 3.5),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Constants.kitGradients[4],
                Constants.kitGradients[4].withOpacity(0.9),
                Constants.kitGradients[4].withOpacity(0.7),
                Constants.kitGradients[4].withOpacity(0.5),
              ]),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight(context, dividedBy: 35),
                ),
                Container(
                  width: 70.0,
                  height: 70.24,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.05),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: ObjectFactory().appHive.getPhotoUrl() == null
                            ? AssetImage('assets/icons/firebase_icon.png')
                            : NetworkImage(
                                ObjectFactory().appHive.getPhotoUrl().trim())),
                  ),
                ),
                SizedBox(
                  height: screenHeight(context, dividedBy: 45),
                ),
                Text(
                  ObjectFactory().appHive.getDisplayName() == null
                      ? "Username"
                      : ObjectFactory().appHive.getDisplayName().trim(),
                  style: TextStyle(
                      color: Constants.kitGradients[1],
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: screenHeight(context, dividedBy: 105),
                ),
                Container(
                  width: 300.0,
                  height: 18.0,
                  child: Text(
                    ObjectFactory().appHive.getUid() != null
                        ? ("ID:" + ObjectFactory().appHive.getUid())
                        : "ID :",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Constants.kitGradients[1],
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight(context, dividedBy: 45),
          ),
          GestureDetector(
            onTap: () async {
              bool result = await DataConnectionChecker().hasConnection;
              if (result == true) {
                await Auth().signOut().then((value) {
                  if (value == "Success") {
                    ObjectFactory().appHive.putUid(value: null);
                    ObjectFactory().appHive.putToken(token: null);
                    ObjectFactory().appHive.putPhotoUrl(value: null);
                    ObjectFactory().appHive.putEmail(value: null);
                    ObjectFactory().appHive.displayNamePut(value: null);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (route) => false);
                  } else {
                    print("Cannot login now");
                    showToast(value.toString());
                  }
                });
              } else {
                showToast("no internet connection.");
              }
            },
            child: Container(
              color: Constants.kitGradients[7],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenWidth(context, dividedBy: 12.0),
                  ),
                  SvgPicture.asset(
                    'assets/icons/log_out_icon.svg',
                    color: Constants.kitGradients[2].withOpacity(0.5),
                    width: screenWidth(context, dividedBy: 20.0),
                    height: screenHeight(context, dividedBy: 30.0),
                  ),
                  SizedBox(
                    width: screenWidth(context, dividedBy: 10.0),
                  ),
                  Text(
                    "Log out",
                    style: TextStyle(
                        color: Constants.kitGradients[2].withOpacity(0.5),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
