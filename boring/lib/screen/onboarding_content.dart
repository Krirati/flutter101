import 'package:flutter/material.dart';

import '../constants.dart';

class Content extends StatelessWidget {
  const Content({Key key, this.text, this.subtext, this.image})
      : super(key: key);
  final String text, subtext, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 10.0)),
        Image.asset(
          image,
          height: 250,
        ),
        Padding(padding: EdgeInsets.only(top: 10.0)),
        Text(
          text,
          style: kHeadingTextStyle,
        ),
        Text(
          subtext,
          style: kSubTextStyle,
        ),
      ],
    );
  }
}
