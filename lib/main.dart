import 'package:flutter/material.dart';
import 'package:poke_search/Screens/Generations/AllGenerations.dart';
import 'package:poke_search/Screens/Generations/GenerationI.dart';
import 'package:poke_search/Screens/Generations/GenerationII.dart';
import 'package:poke_search/Screens/Generations/GenerationIV.dart';
import 'package:poke_search/Screens/Generations/GenerationV.dart';
import 'package:poke_search/Screens/Generations/GenerationVI.dart';
import 'package:poke_search/Screens/search.dart';
import 'package:poke_search/Screens/splash.dart';
import 'Screens/Generations/GenerationIII.dart';
import './tests/ChooseSplash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poke Search 💤',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
      routes: {
        Search.routeName: (context) => Search(),
        Splash.routeName: (context) => Splash(),
        ChooseSplash.routeName: (context) => ChooseSplash(),
//        Home.routeName: (context) => Home(),
//        GridShit.routeName: (context) => GridShit(),

        // Generation Screen Routes
        AllGenerationScreen.routeName: (context) => AllGenerationScreen(),
        Generation1Screen.routeName: (context) => Generation1Screen(),
        GenerationIIScreen.routeName: (context) => GenerationIIScreen(),
        GenerationIIIScreen.routeName: (context) => GenerationIIIScreen(),
        GenerationIVScreen.routeName: (context) => GenerationIVScreen(),
        GenerationVScreen.routeName: (context) => GenerationVScreen(),
        GenerationVIScreen.routeName: (context) => GenerationVIScreen(),
      },
    );
  }
}
