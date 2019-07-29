import 'package:chinese_poetry/pages/cover/cover.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return MaterialApp(
      title: '中华诗词',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CoverPage(),
    );
  }
}
