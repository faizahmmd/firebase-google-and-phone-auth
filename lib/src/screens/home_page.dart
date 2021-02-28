import 'package:demomachinetest/src/utils/constants.dart';
import 'package:demomachinetest/src/widgets/home_drawer.dart';
import 'package:demomachinetest/src/widgets/home_page_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
 // FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void didChangeDependencies() async {
    await FlutterStatusbarManager.setColor(Constants.kitGradients[4]);
    await FlutterStatusbarManager.setStyle(StatusBarStyle.LIGHT_CONTENT);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.kitGradients[0],
        key: _globalKey,
        appBar: AppBar(
          toolbarHeight: 50.0,
          actions: [
            HomePageAppBar(
              onTapLeftIcon: () {
                _globalKey.currentState.openDrawer();
              },
              onTapRightIcon: () {},
            )
          ],
        ),
        drawer: HomeDrawer(

        ));
  }
}
