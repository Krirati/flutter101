import 'package:flutter/material.dart';

import '../constants.dart';

class ChipNumber extends StatefulWidget{
  final int currentPage ;
  final int index;
  const ChipNumber ({ Key key, this.currentPage, this.index }): super(key: key);
  @override
  _ChipNumberState createState() => _ChipNumberState();
}

class _ChipNumberState extends State<ChipNumber> {

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: kAnimationDuration,
        margin: EdgeInsets.only(right: 5, bottom: 40),
        height: 30,
        width: 50,
        decoration: BoxDecoration(
            color: widget.currentPage == widget.index ? kActiveShadowColor : kShadowColor,
            borderRadius: BorderRadius.circular(5)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "${widget.index + 1}",
              style: TextStyle(
                fontSize: 30,
                color: widget.currentPage == widget.index ? Colors.white : Colors.black
              ),
            )
          ]
        ),
      );
  }
}