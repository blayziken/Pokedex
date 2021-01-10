import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:poke_search/models/pokemon.dart';

class RunScreen extends StatefulWidget {
  static const routeName = '/run';

  @override
  _RunScreenState createState() => _RunScreenState();
}

class _RunScreenState extends State<RunScreen> {
  bool _showSpinner = true;
  Color backgroundColorX;
  String type1X;
  String type2X;
  List type;
  List<Pokemon> runPokemonList = [];

  void fetchPokemonAsset() async {
    for (var num = 0; num <= 25; num++) {
      String data = await DefaultAssetBundle.of(context)
          .loadString('assets/allPokemons.json');
      final jsonResult = json.decode(data);

      //Couple of IF-ELSE Statements
      //If Statement to change background of Grid Item
      if (jsonResult[num]['typeofpokemon'][0] == 'Grass') {
        backgroundColorX = Colors.green;
      } else if (jsonResult[num]['typeofpokemon'][0] == 'Fire') {
        backgroundColorX = Colors.red;
      } else {
        backgroundColorX = Colors.purple;
      }

      //If Statement to determine the Pokemon types
      if (jsonResult[num]['typeofpokemon'].length == 1) {
        type1X = jsonResult[num]['typeofpokemon'][0];
        type2X = '';
      } else if (jsonResult[num]['typeofpokemon'].length == 2) {
        type1X = jsonResult[num]['typeofpokemon'][0];
        type2X = jsonResult[num]['typeofpokemon'][1];
      } else {
        type1X = '';
        type2X = '';
      }
      //Add new pokemon object into allPOKEMON List
      runPokemonList.add(Pokemon(
        name: jsonResult[num]['name'],
        image: jsonResult[num]['imageurl'],
        type1: type1X,
        type2: type2X,
        backgroundColor: backgroundColorX,
      ));
    }
    setState(() {
      _showSpinner = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPokemonAsset();
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
                                    0.4),
                        itemCount: runPokemonList.length,
                        itemBuilder: (ctx, i) => GridItem(
                          name: runPokemonList[i].name,
                          image: runPokemonList[i].image,
                          color: runPokemonList[i].backgroundColor,
                          type1: runPokemonList[i].type1,
                          type2: runPokemonList[i].type2,
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
                    fit: BoxFit.cover,
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
//                    color: Colors.teal,
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
