import 'package:flutter/material.dart';

enum TabItem { tangShi, songCi, mine }

class TabHelper {
  static TabItem item({int index}) {
    switch (index) {
      case 0:
        return TabItem.tangShi;
      case 1:
        return TabItem.songCi;
      case 2:
        return TabItem.mine;
    }
    return TabItem.tangShi;
  }

  static String description(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.tangShi:
        return '唐诗';
      case TabItem.songCi:
        return '宋词';
      case TabItem.mine:
        return '我的';
    }
    return '唐诗';
  }

  static IconData icon(TabItem tabItem) {
    return Icons.layers;
  }
}

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.tangShi),
        _buildItem(tabItem: TabItem.songCi),
        _buildItem(tabItem: TabItem.mine),
      ],
      onTap: (index) => onSelectTab(
        TabHelper.item(index: index),
      ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = TabHelper.description(tabItem);
    IconData icon = TabHelper.icon(tabItem);
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentTab == item ? Colors.lightBlueAccent : Colors.grey;
  }
}
