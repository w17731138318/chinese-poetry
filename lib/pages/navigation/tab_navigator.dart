import 'package:chinese_poetry/pages/contents/contents.dart';
import 'package:chinese_poetry/pages/detail_page/detail_page.dart';
import 'package:chinese_poetry/pages/entity/author.dart';
import 'package:chinese_poetry/pages/navigation/navigation.dart';
import 'package:flutter/material.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  void _push(BuildContext context, {Author author}) {
    var routeBuilders = _routeBuilders(context, author: author);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[TabNavigatorRoutes.detail](context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, {Author author}) {
    return {
      TabNavigatorRoutes.root: (context) => ColorsListPage(
            title: TabHelper.description(tabItem),
            onPush: (author) => _push(context, author: author),
          ),
      TabNavigatorRoutes.detail: (context) => ColorDetailPage(
            author: author,
          ),
    };
  }

  @override
  Widget build(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    return Navigator(
        key: navigatorKey,
        initialRoute: TabNavigatorRoutes.root,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context),
          );
        });
  }
}
