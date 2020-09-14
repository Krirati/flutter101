import 'package:boring/constants.dart';
import 'package:boring/screen/chip_number.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  int currentPage = 0;
  int _focusedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  List<Map<String, String>> numberData = [
    {
      "count": "1",
    },
    {
      "count": "2",
    },
    {
      "count": "3",
    },
    {
      "count": "4",
    },
    {
      "count": "5",
    },
  ];
  @override
  Widget build(BuildContext context) {
    // AnimatedContainer chipNumber({int index}) {
    //   return AnimatedContainer(
    //     duration: kAnimationDuration,
    //     margin: EdgeInsets.only(right: 5, bottom: 40),
    //     height: 40,
    //     width: 40,
    //     decoration: BoxDecoration(
    //         color: currentPage == index ? kActiveShadowColor : kShadowColor,
    //         borderRadius: BorderRadius.circular(5)
    //     ),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Text(
    //           "$index",
    //           style: kTitleTextstyle,
    //         )
    //       ]
    //     ),
    //   );
    // }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.info_outline),
                    color: Colors.grey,
                    iconSize: 25,
                    onPressed: () {},
                  ),
                ],
              ),
              Text(
                "เลือกจำนวนผู้ร่วมกิจกรรม",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Image.asset(
                'assets/images/waiting.png',
                height: 350,
              ),
              SizedBox(
                height: 100, // card height
                child: PageView.builder(
                  itemCount: 5,
                  controller: PageController(viewportFraction: 0.7),
                  onPageChanged: (int index) =>
                      setState(() => currentPage = index),
                  itemBuilder: (_, i) {
                    return Transform.scale(
                      scale: i == currentPage ? 1 : 0.9,
                      child: Card(
                        elevation: 6,
                        color: i == currentPage ? kPrimaryColor: kBackgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(children: <Widget>[
                            Text(
                              "${numberData[i]["count"]}",
                              style: TextStyle(fontSize: 25,color: i == currentPage ? Colors.grey[50]: Colors.black),
                            ),
                            Text(
                              "คน",
                              style: TextStyle(fontSize: 22,color: i == currentPage ? Colors.grey[50]: Colors.black),
                            ),
                          ]),
                        )),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                  height: 50,
                  width: 300,
                  child: FlatButton(
                      color: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {},
                      child: Text(
                        "เขย่าเลย",
                        style: kButtonStyle,
                      )))
            ],
          ),
        )),
      )),
    );
  }
}
