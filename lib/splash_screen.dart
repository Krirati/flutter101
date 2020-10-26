import 'package:boring/constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'screen/onboarding_body.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: initScreen(context),
    );
  }
  
  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => OnboardingBody()
      )
    ); 
  }
  
  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/animation_connect.gif',
              height: 400,),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "Boring Shake",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[300]
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
           )
         ],
       ),
      ),
    );
  }
}