
import 'package:flutter/material.dart';
import 'package:super_brain/Translations.dart';

enum TabItem { morning, home, reminders }

Map<TabItem, String> tabName(BuildContext context) {
 Map<TabItem, String> map = {
    TabItem.morning: Translations.of(context).text("morning_title"),
    TabItem.home: Translations.of(context).text("home_title"),
    TabItem.reminders: Translations.of(context).text("reminders_title"),
  };
  
  return map;
}

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
        _buildItem(context, tabItem: TabItem.morning),
        _buildItem(context, tabItem: TabItem.home),
        _buildItem(context, tabItem: TabItem.reminders),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
    );
  }

  BottomNavigationBarItem _buildItem(BuildContext context, {TabItem tabItem}) {
    String text = tabName(context)[tabItem];
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