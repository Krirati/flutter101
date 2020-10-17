import 'package:boring/constants.dart';
import 'package:boring/screen/dialog_result.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shake/shake.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
     ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      // Do stuff on phone shake
      randomEvent();
    });
  }

  var url = "http://www.boredapi.com/api/activity?participants=";
  int currentPage = 0;
  String header = "";
  String subHeader = "";
  String image = "";
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
  randomEvent() async {
    var res = await http.get(url + (currentPage + 1).toString());
    if (res.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(res.body);
      var itemHeader = jsonResponse['activity'];
      var type = jsonResponse['type'];
      var nameImage = "";
      print(jsonResponse);
      switch (type) {
        // "education", "recreational", "social", "diy", "charity", "cooking", "relaxation", "music", "busywork"
        case 'education':
          nameImage = 'assets/images/gummy-experiment-lab.png';
          break;
        case 'recreational':
          nameImage = 'assets/images/gummy-app-development.png';
          break;
        case 'social':
          nameImage = 'assets/images/gummy-work-from-home.png';
          break;
        case 'diy':
          nameImage = 'assets/images/gummy-designer-tools.png';
          break;
        case 'charity':
          nameImage = 'assets/images/gummy-no-hand-shake.png';
          break;
        case 'cooking':
          nameImage = 'assets/images/gummy-kitchen.png';
          break;
        case 'relaxation':
          nameImage = 'assets/images/gummy-camping.png';
          break;
        case 'busywork':
          nameImage = 'assets/images/gummy-ux-slash-ui-design.png';
          break;
        default:
          nameImage = 'assets/images/gummy-ipod.png';
      }
      setState(() {
        header = itemHeader;
        image = nameImage;
        subHeader = type;
      });
    } else {
      print('Request failed with status: ${res.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                height: 250,
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
                        color:
                            i == currentPage ? kRecovercolor : kBackgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(children: <Widget>[
                            Text(
                              "${numberData[i]["count"]}",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            ),
                            Text(
                              "คน",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.black),
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
                      onPressed: () async {
                        await randomEvent();
                        await showDialog(
                            context: context,
                            builder: (context) {
                              return DialogResult(
                                header: header,
                                subHeader: subHeader,
                                image: image,
                              );
                            });
                      },
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
