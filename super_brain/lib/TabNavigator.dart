
import 'package:flutter/material.dart';
import 'package:super_brain/BottomNavigation.dart';
import 'package:super_brain/Pages/Morning/BreathingExercisesPage.dart';
import 'package:super_brain/Pages/Morning/DailyJournalPage.dart';
import 'package:super_brain/Pages/Morning/DreamsJournalPage.dart';
import 'package:super_brain/Pages/Morning/MorningTrainingPage.dart';
import 'package:super_brain/Pages/HomePage.dart';
import 'package:super_brain/Pages/MorningPage.dart';
import 'package:super_brain/Pages/RemindersPage.dart';
import 'package:super_brain/Pages/WordsList/10WordsPage.dart';
import 'package:super_brain/Pages/WordsList/15WordsPage.dart';
import 'package:super_brain/Pages/WordsList/20WordsPage.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String tenWordsPage = '/tenWordsPage';
  static const String fifteenWordsPage = '/fifteenWordsPage';
  static const String twentyWordsPage = '/twentyWordsPage';
  static const String dreamsJournalPage = '/dreamsJournalPage';
  static const String breathingExercisesPage = '/breathingExercicesPage';
  static const String dailyJournalPage = '/dailyJournalPage';
  static const String morningTrainingPage = '/morningTrainingPage';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  void _push(BuildContext context, {String destinationPage}) {
    var routeBuilders = _routeBuilders(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders['/' + destinationPage](context),
      ),
    );
  }


  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    // return {
    //   TabNavigatorRoutes.root: (context) => MorningPage(),
    //   TabNavigatorRoutes.morning: (context) => MorningPage(),
    //   TabNavigatorRoutes.reminders: (context) => RemindersPage(),
    //   TabNavigatorRoutes.tenWordsPage: (context) => TenWordsPage(),
    // };
    if (tabItem == TabItem.morning) {
      return {
        TabNavigatorRoutes.root: (context) => MorningPage(
          onPush: (destinationPage) => _push(context, destinationPage: destinationPage),
        ),
        TabNavigatorRoutes.dreamsJournalPage: (context) => DreamsJournalPage(),
        TabNavigatorRoutes.breathingExercisesPage: (context) => BreathingExercisesPage(),
        TabNavigatorRoutes.dailyJournalPage: (context) => DailyJournalPage(),
        TabNavigatorRoutes.morningTrainingPage: (context) => MorningTrainingPage(),
      };
    }
    else if (tabItem == TabItem.reminders) {
      return {
        TabNavigatorRoutes.root: (context) => RemindersPage(),
      };
    }
    
    return {
      TabNavigatorRoutes.root: (context) => HomePage(
        onPush: (destinationPage) => _push(context, destinationPage: destinationPage),
      ),
      TabNavigatorRoutes.tenWordsPage: (context) => TenWordsPage(),
      TabNavigatorRoutes.fifteenWordsPage: (context) => FifteenWordsPage(),
      TabNavigatorRoutes.twentyWordsPage: (context) => TwentyWordsPage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}