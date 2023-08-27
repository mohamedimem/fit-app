import 'package:app/Challenge/controllers/mainscreen_provider.dart';
import 'package:app/Challenge/ui/detail_exercice.dart';
import 'package:app/leaderboard/ui/leaderboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Challenge/ui/homepage2.dart';
import '../../../Challenge/ui/detail_page.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void changePage(index, context) {}

  List<Widget> pages = [
    HomePage2(),
    LeaderboardScreen(),
    DetailedExercice(),
    HomePage2(),
  ];

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(builder: (context, pageIndex, index) {
      return Scaffold(
          bottomNavigationBar: NavigationBar(
            indicatorColor: Color(0xffC70039).withOpacity(0.8),
            shadowColor: Color(0xffC70039),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: pageIndex.pageIndex,
            onDestinationSelected: (int index) {
              setState(() {
                pageIndex.pageIndex = index;
              });
            },
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(Icons.home),
                selectedIcon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.leaderboard),
                label: 'Leaderboard',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.fitness_center,
                  color: Colors.white,
                ),
                icon: Icon(Icons.fitness_center),
                label: 'Prepare',
              ),
              NavigationDestination(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
            ],
          ),
          body: pages[pageIndex.pageIndex]);
    });
  }
}
