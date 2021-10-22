import 'package:flutter/material.dart';
import 'package:poke_search/Screens/widgets/tabs/AboutTab.dart';
import 'package:poke_search/Screens/widgets/tabs/BaseStats.dart';
import 'package:poke_search/Screens/widgets/tabs/Evolution.dart';
import 'package:poke_search/Screens/widgets/tabs/Moves.dart';
import 'detailTab.dart';

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
    this.normalAbilities,
    this.hiddenAbilities,
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
  List normalAbilities = [];
  List hiddenAbilities = [];

  @override
  _TabGeneralState createState() => _TabGeneralState();
}

class _TabGeneralState extends State<TabGeneral> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

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
    List normalAbilities = widget.normalAbilities;
    List hiddenAbilities = widget.hiddenAbilities;

    return Container(
      margin: EdgeInsets.only(top: media.height * 0.014),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Container(
              width: double.infinity,
              child: TabBar(
                indicatorColor: Colors.green,
                controller: _tabController,
                tabs: <Widget>[
                  DetailTab('About'),
                  DetailTab('Base Stats'),
                  DetailTab('Evolution'),
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
                  normalAbilities: normalAbilities,
                  hiddenAbilities: hiddenAbilities,
//                  types: types,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
