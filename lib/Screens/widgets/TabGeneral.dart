import 'package:flutter/material.dart';
import 'package:poke_search/Screens/widgets/detailTab.dart';
import 'package:poke_search/Screens/widgets/tabs/AboutTab.dart';
import 'package:poke_search/Screens/widgets/tabs/BaseStats.dart';
import 'package:poke_search/Screens/widgets/tabs/Evolution.dart';
import 'package:poke_search/Screens/widgets/tabs/Moves.dart';

class TabGeneral extends StatefulWidget {
  TabGeneral({
    this.pokeHeight,
    this.pokeWeight,
    this.description,
    this.genderMale,
    this.genderFemale,
    this.starter,
    this.gen,
    this.spDef,
    this.spAtk,
    this.defense,
    this.attack,
    this.hp,
    this.speed,
    this.total,
    this.evolutionLine,
  });

  String pokeHeight;
  String pokeWeight;
  String description;
  var genderMale;
  var genderFemale;
  int gen;
  bool starter;

  //Base Stats
  int hp;
  int attack;
  int defense;
  int spAtk; //Special Attack
  int spDef; //Special Defense
  int speed;
  int total;

  List evolutionLine = [];

  @override
  _TabGeneralState createState() => _TabGeneralState();
}

class _TabGeneralState extends State<TabGeneral>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String pokeHeight = widget.pokeHeight;
    String pokeWeight = widget.pokeWeight;
    String description = widget.description;
    var genderMale = widget.genderMale;
    var genderFemale = widget.genderFemale;
    int gen = widget.gen;
    bool starter = widget.starter;

    //Base Stats
    int hpAPI = widget.hp;
    int attackAPI = widget.attack;
    int defenseAPI = widget.defense;
    int spAtkAPI = widget.spAtk; //Special Attack
    int spDefAPI = widget.spDef; //Special Defense
    int speedAPI = widget.speed;
//    int totalAPI = widget.total;

    List evolutionLine = widget.evolutionLine;

    return Container(
      margin: EdgeInsets.only(top: 14),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Container(
//                  height: 50,
              width: double.infinity,
//                  color: Colors.,
              child: TabBar(
                indicatorColor: Colors.blue,
                controller: _tabController,
                tabs: <Widget>[
                  DetailTab('About'),
                  DetailTab('Base Stats'),
                  DetailTab('Evolution'),
                  DetailTab('Moves'),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                About(
                  pokeHeight: pokeHeight,
                  pokeWeight: pokeWeight,
                  description: description,
                  genderMale: genderMale,
                  genderFemale: genderFemale,
                  gen: gen,
                  starter: starter,
                ),
                BaseStats(
                  attack: attackAPI,
                  defense: defenseAPI,
                  hp: hpAPI,
                  spAtk: spAtkAPI,
                  spDef: spDefAPI,
                  speed: speedAPI,
//                  total: totalAPI,
                ),
                Evolution(evolutionLine: evolutionLine),
                Moves(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
