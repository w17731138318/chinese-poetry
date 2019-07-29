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
  // 刷新时数据请求
  void _loadRefresh() {
    List<Author> authors1 = [Author(1, '李白1', '唐朝诗人李白'), Author(2, '李白2', '唐朝诗人李白'), Author(3, '李白3', '唐朝诗人李白'), Author(4, '李白4', '唐朝诗人李白'), Author(5, '李白5', '唐朝诗人李白')];
    authors.addAll(authors1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
          ),
        ),
        body: Container(
          color: Colors.white,
          child: RefreshIndicator(
            child: _buildList(),
            onRefresh: _loadRefresh,
          ),
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
