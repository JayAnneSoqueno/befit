import 'package:flutter/material.dart';
import 'package:befit/for_test.dart';
import 'package:befit/screens/home.dart';
import 'package:befit/screens/splash.dart';
import 'package:befit/standards.dart';

class BeFit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeFit',
      theme: _BeFitTheme,
      initialRoute: '/test',
      routes: {
        '/test': (context) => ForTest(),
        '/home': (context) => Home(),
        '/setup': (context) => Splash(),
      },
    );
  }
}

final ThemeData _BeFitTheme = _buildBeFitTheme();

ThemeData _buildBeFitTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Standards.colors["primaryColor"],
    scaffoldBackgroundColor: Standards.colors["whiteColor"],
    appBarTheme: _buildAppBarTheme(base.appBarTheme),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.purple,
      primaryColorDark: Standards.colors["primaryColorDark"],
      accentColor: Standards.colors["primaryColorLight"],
    ),
  );
}

AppBarTheme _buildAppBarTheme(AppBarTheme base) {
  return base.copyWith(
    backgroundColor: Standards.colors["whiteColor"],
    toolbarTextStyle: Standards.fontStyles["main"],
    elevation: 0,
    centerTitle: true,
  );
}
