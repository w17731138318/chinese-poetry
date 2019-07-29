import 'package:chinese_poetry/pages/entity/author.dart';
import 'package:flutter/material.dart';

class ColorDetailPage extends StatelessWidget {
  ColorDetailPage({this.title, this.author});
  final String title;
  final Author author;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          author.name,
        ),
      ),
      body: Container(
        color: Color.fromRGBO(254, 244, 235, 1.0),
      ),
    );
  }
}
