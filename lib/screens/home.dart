import 'package:flutter/material.dart';
import 'package:befit/screens/profile.dart';
import 'package:befit/screens/activity_tracker.dart';
import 'package:befit/screens/recommendations.dart';
import 'package:befit/screens/login.dart';
import 'package:befit/standards.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _bottomNavPage = 0;
  final List<Widget> _pages = [
    Profile(),
    ActivityTracker(),
    Recommendations(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: _pages[_bottomNavPage],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Standards.colors["primaryColorDark"],
          labelTextStyle: MaterialStateProperty.all(
              Standards.fontStyles["navigationLabel"]),
          iconTheme: MaterialStateProperty.all(
            IconThemeData(
              color: Standards.colors["whiteColor"],
              size: 30,
            ),
          ),
        ),
        child: NavigationBar(
          backgroundColor: Standards.colors["primaryColorLight"],
          animationDuration: const Duration(milliseconds: 300),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          height: 60,
          selectedIndex: _bottomNavPage,
          onDestinationSelected: (int newIndex) {
            setState(() {
              _bottomNavPage = newIndex;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            NavigationDestination(
              icon: Icon(Icons.bar_chart),
              label: 'Activity Tracker',
            ),
            NavigationDestination(
              icon: Icon(Icons.directions_run),
              label: 'Recommendations',
            ),
          ],
        ),
      ),
    );
  }
}
