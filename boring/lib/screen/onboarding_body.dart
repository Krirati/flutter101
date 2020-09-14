import 'package:boring/screen/dashboard.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'onboarding_content.dart';

class OnboardingBody extends StatefulWidget {
  @override
  _OnboardingBodyState createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  int currentPage = 0;
  String buttonTxt = "ข้าม";
  final PageController _pageController = PageController(initialPage: 0);
  List<Map<String, String>> contentData = [
    {
      "text": "คุณกำลังเบื่ออยู่ใช่ไหม ?",
      "subtext": "ในวันว่างๆ ที่คุณไม่รู้จะทำอะไร",
      "image": 'assets/images/onBoarding.png',
    },
    {
      "text": "ให้เราช่วยหาอะไรให้ทำไหม ?",
      "subtext": "ให้เราสุ่มกิจกรรมมาให้คุณทำสิ!",
      "image": 'assets/images/onBoarding2.png',
    },
    {
      "text": "แค่เขย่าก็มีเรื่องให้ทำ",
      "subtext": "ให้วันว่างๆ ไม่น่าเบื่ออีกต่อไป",
      "image": 'assets/images/onBoarding3.png',
    }
  ];
  @override
  Widget build(BuildContext context) {
    route() {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => Dashboard()
        )
      ); 
    }

    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                      if (currentPage == 2) {
                        setState(() {
                          buttonTxt = "เริ่มกันเลย";
                        });
                      } else {
                        buttonTxt = "ข้าม";
                      }
                    });
                  },
                  itemCount: contentData.length,
                  controller: _pageController,
                  itemBuilder: (context, index) => Content(
                        text: contentData[index]["text"],
                        subtext: contentData[index]["subtext"],
                        image: contentData[index]["image"],
                      )),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contentData.length,
                        (index) => buildDot(index: index)
                      )
                    ),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: FlatButton(
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        onPressed: () {
                          if (currentPage == 2) {
                            setState(() {
                              buttonTxt = "เริ่มกันเลย";
                              route();
                            });
                          } else {
                            _pageController.nextPage(
                              duration: kAnimationDuration, 
                              curve: Curves.ease
                              );
                          }
                        }, 
                        child: Text(
                          buttonTxt,
                          style: kButtonStyle,
                        )
                      )
                    )                 
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    ));
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5, bottom: 40),
      height: 8,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kActiveShadowColor : kShadowColor,
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
