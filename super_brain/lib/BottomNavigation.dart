
import 'package:flutter/material.dart';

enum TabItem { morning, home, reminders }

Map<TabItem, String> tabName = {
  TabItem.morning: 'Morning',
  TabItem.home: 'Home',
  TabItem.reminders: 'Reminders',
};

Map<TabItem, IconData> tabIcon = {
  TabItem.morning: Icons.brightness_5,
  TabItem.home: Icons.home,
  TabItem.reminders: Icons.notifications,
};

Map<TabItem, int> tabIndex = {
  TabItem.morning: 0,
  TabItem.home: 1,
  TabItem.reminders: 2,
};

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: tabIndex[currentTab],
      items: [
        _buildItem(tabItem: TabItem.morning),
        _buildItem(tabItem: TabItem.home),
        _buildItem(tabItem: TabItem.reminders),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = tabName[tabItem];
    IconData icon = tabIcon[tabItem];
    return BottomNavigationBarItem(
      icon: Icon(
        icon
      ),
      title: Text(
        text
      ),
    );
  }
}