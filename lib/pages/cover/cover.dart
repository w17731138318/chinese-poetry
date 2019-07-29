import 'dart:async';

import 'package:chinese_poetry/pages/App.dart';
import 'package:flutter/material.dart';

class CoverPage extends StatefulWidget {
  @override
  CoverPageState createState() => new CoverPageState();
}

class CoverPageState extends State<CoverPage> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = new Timer(const Duration(milliseconds: 3000), () {
      try {
        Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new App()), (Route route) => route == null);
      } catch (e) {}
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: new Color.fromRGBO(254, 244, 235, 1.0),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '中华诗词',
                style: TextStyle(color: Color.fromRGBO(128, 128, 128, 1.0), fontSize: 30.0),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: <Widget>[
                  Text('2019年7月29日'),
                  Text('王伟欣'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
