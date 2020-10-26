import 'package:flutter/material.dart';

import '../constants.dart';

class DialogResult extends StatefulWidget {
  const DialogResult({this.header, this.subHeader, this.image});
  final String image, header, subHeader;
  @override
  _DialogResultState createState() => _DialogResultState();
}

class _DialogResultState extends State<DialogResult> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Wrap(
            // spacing: 20,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      widget.image,
                      height: 200,
                    ),
                    Center(
                      child: Column(children: <Widget>[
                        Text(
                          widget.subHeader,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(widget.header,
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center)
                      ]),
                    ),
                    SizedBox(
                        height: 40,
                        width: 200,
                        child: FlatButton(
                            color: kRecovercolor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            child: Text(
                              "ตกลง",
                              style: TextStyle(
                                  fontSize: 26, color: Colors.black),
                            )))
                  ],
                ),
              )
            ]));
  }
}
