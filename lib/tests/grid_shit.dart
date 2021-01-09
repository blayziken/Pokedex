import 'dart:async';

import 'package:flutter/cupertino.dart';
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
  Color backgroundColorX;
  String type1X;
  String type2X;
  List type;
  List<Pokemon> allPOKEMON = [];

  dynamic getAllPokemon() async {
    for (var num = 1; num <= 15; num++) {
      NetworkPokeDevAPI networkPokeDevAPI =
          NetworkPokeDevAPI('https://pokeapi.glitch.me/v1/pokemon/$num');
      var numData = await networkPokeDevAPI.getData2();

      //Couple of IF-ELSE Statements
      //If Statement to change background of Grid Item
      if (numData[0]['types'][0] == 'Grass') {
        backgroundColorX = Colors.green;
      } else if (numData[0]['types'][0] == 'Fire') {
        backgroundColorX = Colors.red;
      } else {
        backgroundColorX = Colors.purple;
      }

      //If Statement to determine the Pokemon types
      if (numData[0]['types'].length == 1) {
        type1X = numData[0]['types'][0];
        type2X = '';
      } else if (numData[0]['types'].length == 2) {
        type1X = numData[0]['types'][0];
        type2X = numData[0]['types'][1];
      } else {
        type1X = '';
        type2X = '';
      }

      //Add new pokemon object into allPOKEMON List
      allPOKEMON.add(Pokemon(
        name: numData[0]['name'],
        image: numData[0]['sprite'],
        type1: type1X,
        type2: type2X,
        backgroundColor: backgroundColorX,
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 10,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    MediaQuery.of(context).size.height /
                                    0.38),
                        itemCount: allPOKEMON.length,
                        itemBuilder: (ctx, i) => GridItem(
                          name: allPOKEMON[i].name,
                          image: allPOKEMON[i].image,
                          color: allPOKEMON[i].backgroundColor,
                          type1: allPOKEMON[i].type1,
                          type2: allPOKEMON[i].type2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String name;
  final String image;
  final Color color;
  final String type1;
  final String type2;

  GridItem({this.name, this.image, this.color, this.type1, this.type2});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    //
    //Checking if Pokemon Type 2 is empty
    Widget _pokemonTypesPlacement() {
      if (type2 == '') {
        return Column(
          children: <Widget>[
            SizedBox(height: 14),
            pokeType(type: type1),
          ],
        );
      } else {
        return Column(
          children: <Widget>[
            pokeType(type: type1),
            SizedBox(height: 10),
            pokeType(type: type2),
          ],
        );
      }
    }

    return GridTile(
      child: Container(
//        height: 170,
//        width: 5260,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.white.withOpacity(0.1), BlendMode.dstATop),
            fit: BoxFit.scaleDown,
            image: AssetImage('images/pokeball.png'),
            alignment: Alignment.bottomRight,
          ),
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: 0,
              left: 91,
              top: 19,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 120,
                  width: 120,
                  child: Image.network(
                    image,
                    fit: BoxFit.contain,
                  ),
//                  decoration: BoxDecoration(
////                          color: Colors.white,
//                      image: DecorationImage(
//                    image: AssetImage('images/pikachu.png'),
//                    fit: BoxFit.cover,
//                  )),
                ),
              ),
            ),
            Positioned(
//                    left: 3.0,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.teal,
                    height: media.height * 0.12,
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name, //Charmeleon
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        _pokemonTypesPlacement(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class pokeType extends StatelessWidget {
  final String type;

  pokeType({this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 80,
//                      color: Colors.white,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
      child: Center(
        child: Text(
          type,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
