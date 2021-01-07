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
  String type2X;
  List<Pokemon> allPOKEMON = [];

  dynamic getAllPokemon() async {
    for (var num = 1; num <= 15; num++) {
      NetworkPokeDevAPI networkPokeDevAPI =
          NetworkPokeDevAPI('https://pokeapi.glitch.me/v1/pokemon/$num');
      var numData = await networkPokeDevAPI.getData2();
//      print(numData);
      //Couple of IF-ELSE Statements
      if (numData[0]['types'][0] == 'Grass') {
        backgroundColorX = Colors.green;
      } else if (numData[0]['types'][0] == 'Fire') {
        backgroundColorX = Colors.red;
      } else {
        backgroundColorX = Colors.purple;
      }

//      if (!numData[0]['types'][1]) {
//        type2X = '';
//      } else {
//        type2X = numData[0]['types'][1];
//      }

      //Add new pokemon object into allPOKEMON List
      allPOKEMON.add(Pokemon(
        name: numData[0]['name'],
        image: numData[0]['sprite'],
        type1: numData[0]['types'][0],
        type2: type2X,
        backgroundColor: backgroundColorX,
      ));
      print('Pokemon Name ($num) = ${numData[0]['name']}');
      print(numData[0]['types'][1]);
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
                                    0.37 /
                                    MediaQuery.of(context).size.height),
                        itemCount: allPOKEMON.length,
                        itemBuilder: (ctx, i) => Item(
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

class Item extends StatelessWidget {
  final String name;
  final String image;
  final Color color;
  final String type1;
  final String type2;

  Item({this.name, this.image, this.color, this.type1, this.type2});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        height: 170,
        width: 260,
        decoration: BoxDecoration(
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
                    margin: EdgeInsets.only(left: 10, top: 20),
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
                        SizedBox(height: 15),
                        Column(
                          children: <Widget>[
                            pokeType(type: type1),
                            SizedBox(height: 10),
                            pokeType(type: type2),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

//      Container(
////        height: 20,
////        width: 40,
//        child: Row(
////          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Column(
//                children: <Widget>[
//                  Text(
//                    name,
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 20,
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            Spacer(),
//            Align(
//              alignment: Alignment.bottomRight,
//              child: Container(
//                color: Colors.white,
//                height: 100,
//                width: 80,
//              ),
//            ),
//            SizedBox(
//              width: 10,
//            ),
//          ],
//        ),
//        decoration: BoxDecoration(
//          color: Colors.red,
//          borderRadius: BorderRadius.all(Radius.circular(18)),
//        ),
//      ),
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
