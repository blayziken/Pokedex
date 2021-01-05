import 'package:flutter/material.dart';
import 'package:poke_search/Screens/detail.dart';
import 'package:poke_search/Screens/home.dart';
import 'package:poke_search/Screens/search.dart';
import 'package:poke_search/Screens/splash.dart';
import 'package:poke_search/tests/grid_shit.dart';
import 'file:///C:/Users/Administrator/AndroidStudioProjects/poke_search/lib/Screens/widgets/TabTest.dart';
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
        Search.routeName: (context) => Search(),
        Splash.routeName: (context) => Splash(),
        ChooseSplash.routeName: (context) => ChooseSplash(),
        Home.routeName: (context) => Home(),
        GridShit.routeName: (context) => GridShit(),
      },
    );
  }
}
