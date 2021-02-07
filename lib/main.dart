import 'package:flutter/material.dart';
import 'package:poke_search/Screens/Generations/AllGenerations.dart';
import 'package:poke_search/Screens/Generations/GenerationI.dart';
import 'package:poke_search/Screens/Generations/GenerationII.dart';
import 'package:poke_search/Screens/Generations/GenerationIV.dart';
import 'package:poke_search/Screens/Generations/GenerationV.dart';
import 'package:poke_search/Screens/Generations/GenerationVI.dart';
import 'package:poke_search/Screens/detail.dart';
import 'package:poke_search/Screens/home.dart';
import 'package:poke_search/Screens/search.dart';
import 'package:poke_search/Screens/splash.dart';
import 'package:poke_search/Screens/widgets/floating_bubble.dart';
import 'package:poke_search/tests/clipPointArrow.dart';
import 'package:poke_search/tests/containerGrid.dart';
import 'package:poke_search/tests/grid_shit.dart';
import 'file:///C:/Users/Administrator/AndroidStudioProjects/poke_search/lib/Screens/widgets/customMenu.dart';
import 'file:///C:/Users/Administrator/AndroidStudioProjects/poke_search/lib/Screens/widgets/floating_bubble.dart';
import 'Screens/Generations/GenerationIII.dart';
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
      title: 'Poke Search 💤',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Search(),
      routes: {
        Search.routeName: (context) => Search(),
        Splash.routeName: (context) => Splash(),
        ChooseSplash.routeName: (context) => ChooseSplash(),
        Home.routeName: (context) => Home(),
//        GridShit.routeName: (context) => GridShit(),
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
