import 'package:chinese_poetry/pages/entity/author.dart';
import 'package:flutter/material.dart';

class ColorsListPage extends StatelessWidget {
  ColorsListPage({this.title, this.onPush});
  ScrollController _controller = ScrollController();
  final String title;
  final ValueChanged<Author> onPush;

  List<Author> authors = [
    Author(1, '李白', '唐朝诗人李白'),
    Author(2, '李白', '唐朝诗人李白'),
    Author(3, '李白', '唐朝诗人李白'),
    Author(1, '李白', '唐朝诗人李白'),
    Author(2, '李白', '唐朝诗人李白'),
    Author(3, '李白', '唐朝诗人李白'),
    Author(1, '李白', '唐朝诗人李白'),
    Author(2, '李白', '唐朝诗人李白'),
    Author(3, '李白', '唐朝诗人李白'),
    Author(1, '李白', '唐朝诗人李白'),
    Author(2, '李白', '唐朝诗人李白'),
    Author(3, '李白', '唐朝诗人李白'),
    Author(1, '李白', '唐朝诗人李白'),
    Author(2, '李白', '唐朝诗人李白'),
    Author(3, '李白', '唐朝诗人李白'),
    Author(1, '李白', '唐朝诗人李白'),
    Author(2, '李白', '唐朝诗人李白'),
    Author(3, '李白', '唐朝诗人李白'),
    Author(1, '李白', '唐朝诗人李白'),
    Author(2, '李白', '唐朝诗人李白'),
    Author(3, '李白', '唐朝诗人李白'),
    Author(1, '李白', '唐朝诗人李白'),
    Author(2, '李白', '唐朝诗人李白'),
    Author(3, '李白', '唐朝诗人李白')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
          ),
        ),
        body: Container(
          color: Color.fromRGBO(254, 244, 235, 1.0),
          child: _buildList(),
        ));
  }

  Widget _buildList() {
    return ListView.builder(
        controller: _controller,
        itemCount: authors.length,
        itemBuilder: (BuildContext content, int index) {
          var author = authors[index];
          return Container(
            child: ListTile(
              title: Text(author.name, style: TextStyle(fontSize: 24.0)),
              trailing: Icon(Icons.chevron_right),
              onTap: () => onPush(author),
            ),
          );
        });
  }
}
