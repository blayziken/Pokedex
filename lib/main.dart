import 'package:flutter/material.dart';
import 'package:poke_search/Screens/detail.dart';
import 'package:poke_search/Screens/home.dart';
import 'package:poke_search/Screens/splash.dart';
import 'package:poke_search/tests/TabTest.dart';
import 'package:poke_search/tests/httpTest.dart';
import 'package:poke_search/tests/screen.dart';
import './tests/ChooseSplash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      routes: {
        Home.routeName: (context) => Home(),
        Splash.routeName: (context) => Splash(),
        ChooseSplash.routeName: (context) => ChooseSplash(),
      },
    );
  }
}
