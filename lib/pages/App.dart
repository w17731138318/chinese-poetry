import 'package:chinese_poetry/pages/navigation/navigation.dart';
import 'package:chinese_poetry/pages/navigation/tab_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  TabItem currentTab = TabItem.tangShi;
  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.tangShi: GlobalKey<NavigatorState>(),
    TabItem.songCi: GlobalKey<NavigatorState>(),
    TabItem.yuanQu: GlobalKey<NavigatorState>(),
    TabItem.mine: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    setState(() {
      currentTab = tabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
//    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    ScreenUtil.instance = ScreenUtil.instance..init(context);
    return WillPopScope(
      onWillPop: () async => !await navigatorKeys[currentTab].currentState.maybePop(),
      child: Scaffold(
        body: _buildBody(),
        bottomNavigationBar: BottomNavigation(
          currentTab: currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Stack _buildBody() {
    return Stack(children: <Widget>[
      _buildOffstageNavigator(TabItem.tangShi),
      _buildOffstageNavigator(TabItem.songCi),
      _buildOffstageNavigator(TabItem.yuanQu),
      _buildOffstageNavigator(TabItem.mine),
    ]);
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
