import 'package:boring/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: initScreen(context),
    );
  }

  
  initScreen(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        backgroundColor: kBackgroundColor,
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Dashboard",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
          ],
        ),
        ),
      )
    );
  }
}