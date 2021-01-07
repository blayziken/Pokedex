import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poke_search/models/pokemon.dart';
import 'package:poke_search/services/NetworkAPI.dart';

class GridShit extends StatefulWidget {
  static const routeName = '/grid-shit';

  @override
  _GridShitState createState() => _GridShitState();
}

class _GridShitState extends State<GridShit> {
//  List<Pokemon> loadedPokemons = [
//    Pokemon(
//      name: 'Charizard',
//      image: 'images/Graphic1.png',
//      type1: 'Fighting',
//      type2: 'Fire',
//      backgroundColor: Colors.red,
//    ),
//    Pokemon(
//      name: 'Squitle',
//      image: '',
//      type1: 'Water',
//      type2: '',
//      backgroundColor: Colors.lightBlue,
//    ),
//    Pokemon(
//      name: 'Bulbasaur',
//      image: '',
//      type1: 'Grass',
//      type2: 'Poison',
//      backgroundColor: Colors.green,
//    ),
//    Pokemon(
//      name: 'Ditto',
//      image: '',
//      type1: 'Poison',
//      type2: '',
//      backgroundColor: Colors.deepPurple,
//    ),
//  ];

  bool _showSpinner = true;
  List<Pokemon> allPOKEMON = [];

  dynamic getAllPokemon() async {
    for (var num = 1; num <= 10; num++) {
      NetworkPokeDevAPI networkPokeDevAPI =
          NetworkPokeDevAPI('https://pokeapi.glitch.me/v1/pokemon/$num');
      var numData = await networkPokeDevAPI.getData2();
//      print(numData);
      //Add new pokemon object into allPOKEMON List
      allPOKEMON.add(Pokemon(
        name: numData[0]['name'],
        image: numData[0]['sprite'],
        type1: numData[0]['types'][0],
        type2: '',
        backgroundColor: Colors.purple,
      ));
      print('Pokemon Name ($num) = ${numData[0]['name']}');
    }
    print('done');
    print('Length of list: ${allPOKEMON.length}');
    setState(() {
      _showSpinner = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllPokemon();
  }
//  void calculate() {
//    for (var i = 0; i <= 10; i++) {
//      print(i);
//      calculateList.add(Container(
//        color: Colors.red,
//        height: 20,
//        width: 20,
//      ));
//    }
//  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        body: _showSpinner
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  color: Colors.yellow,
                  height: media.height,
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Text(
                          'Generation I',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 30,
                                    crossAxisSpacing: 10,
                                    childAspectRatio:
                                        MediaQuery.of(context).size.width /
                                            0.37 /
                                            MediaQuery.of(context).size.height),
                            itemCount: allPOKEMON.length,
                            itemBuilder: (ctx, i) => Item(
                                  name: allPOKEMON[i].name,
                                )),
                      ),
                    ],
                  ),
                ),
              ));
  }
}

class Item extends StatelessWidget {
  final String name;

  Item({this.name});
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
//        height: 20,
//        width: 40,
        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                color: Colors.white,
                height: 100,
                width: 80,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
      ),
    );
  }
}

//class Choice {
//  const Choice({this.title, this.icon});
//  final String title;
//  final IconData icon;
//}
//
//const List<Choice> choices = const <Choice>[
//  const Choice(title: 'Home', icon: Icons.home),
//  const Choice(title: 'Contact', icon: Icons.contacts),
//  const Choice(title: 'Map', icon: Icons.home),
//  const Choice(title: 'Phone', icon: Icons.contacts),
//  const Choice(title: 'Camera', icon: Icons.home),
//  const Choice(title: 'Setting', icon: Icons.contacts),
//];
//
//class SelectCard extends StatelessWidget {
//  const SelectCard({Key key, this.choice}) : super(key: key);
//  final Choice choice;
//
//  @override
//  Widget build(BuildContext context) {
//    final TextStyle textStyle = Theme.of(context).textTheme.headline4;
//
//    return Card(
//      color: Colors.orange,
//      child: Center(
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            Expanded(
//                child: Icon(
//              choice.icon,
//              size: 50,
//              color: textStyle.color,
//            )),
//            Text(
//              choice.title,
//              style: textStyle,
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
