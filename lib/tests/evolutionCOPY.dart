import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_search/services/NetworkAPI.dart';

class Evolution extends StatefulWidget {
  List evolutionLine = [];

  Evolution({this.evolutionLine});

  @override
  _EvolutionState createState() => _EvolutionState();
}

class _EvolutionState extends State<Evolution> {
//  String lala = '';

//  dynamic getSprite(pokeName) async {
////    String pokeName = evolutionLine[0];
//
//    NetworkPokeDevAPI networkPokeDevAPI =
//        NetworkPokeDevAPI('https://pokeapi.glitch.me/v1/pokemon/$pokeName');
//
//    var pokemonImage = await networkPokeDevAPI.getData2();
//    String networkImage = pokemonImage[0]['sprite'];
////    return networkImage;
//    setState(() {
//      lala = networkImage;
//    });
////    return pokemonImage[0]['sprite'];
//  }

  @override
//  void initState() {
//    super.initState();
//  }
//
//  void sss() {
//    List evolutionLine = widget.evolutionLine;
//    if (evolutionLine.length == 1) {
//      String evol1 = evolutionLine[0];
//      String image1 = getSprite(evol1).toString();
//    } else if (evolutionLine.length == 2) {
//      String evol1 = evolutionLine[0];
//      String evol2 = evolutionLine[1];
//      String image1 = getSprite(evol1).toString();
//      String image2 = getSprite(evol2).toString();
//    } else {
//      String evol1 = evolutionLine[0];
//      String evol2 = evolutionLine[1];
//      String evol3 = evolutionLine[2];
//
//      String image1 = getSprite(evol1).toString();
//      String image2 = getSprite(evol2).toString();
//      String image3 = getSprite(evol3).toString();
//    }
//  }

  dynamic getSprite(name) async {
    NetworkPokeDevAPI networkPokeDevAPI = NetworkPokeDevAPI('https://pokeapi.glitch.me/v1/pokemon/$name');

    var pokemonImage = await networkPokeDevAPI.getData2();
    String networkImage = pokemonImage[0]['sprite'];
    return networkImage;

//    return pokemonImage[0]['sprite'];
  }

  @override
  Widget build(BuildContext context) {
    //
    List evolutionLine = widget.evolutionLine;

    Widget _evolutionPokes() {
      if (evolutionLine.length == 1) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'It\'s just ',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                ),
              ),
              Text(
                '${evolutionLine[0]}',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  color: Colors.green[900],
                ),
              ),
            ],
          ),
        );
      } else if (evolutionLine.length == 2) {
        return EvolutionChainRow(
          name1: evolutionLine[0],
//          imageURL1: getSprite(widget.evolutionLine[0]), //bulb
          imageURL1: getSprite(evolutionLine[0]).toString(),
          name2: evolutionLine[1],
//          imageURL2: getSprite(widget.evolutionLine[1]), //ivy
          imageURL2: getSprite(evolutionLine[1]).toString(),
        );
      } else {
        return Column(
          children: <Widget>[
            EvolutionChainRow(
              name1: evolutionLine[0],
//              imageURL1: getSprite(widget.evolutionLine[0]),
              imageURL1: getSprite(evolutionLine[0]).toString(),
              name2: evolutionLine[1],
//          imageURL2: getSprite(widget.evolutionLine[1]),
              imageURL2: getSprite(evolutionLine[1]).toString(),
            ),
            SizedBox(height: 40.0),
            EvolutionChainRow(
              name1: evolutionLine[1],
              imageURL1: getSprite(evolutionLine[1]).toString(),
              name2: evolutionLine[2],
              imageURL2: getSprite(widget.evolutionLine[2]).toString(),
            ),
          ],
        );
      }
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 40.0, top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Evolution Chain',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22.0,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              color: Colors.teal,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 40.0),
                child: _evolutionPokes(),

//                Column(
//                  children: <Widget>[
//                    EvolutionChainRow(
//                      name1: 'Pikachu',
//                      imageURL1: 'images/pikachu.png',
//                    ),
//                    SizedBox(height: 40.0),
//
////                    EvolutionChainRow(),
//                  ],
//                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EvolutionChainRow extends StatelessWidget {
  // First Poke
  String name1;
  String imageURL1;
  //Second Poke
  String name2;
  String imageURL2;

  EvolutionChainRow({this.name1, this.imageURL1, this.name2, this.imageURL2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,

//              decoration: BoxDecoration(
//                  image: DecorationImage(
//                image: AssetImage(imageURL1),
//                fit: BoxFit.fill,
//              ),
//              ),

              child: Image.network(
                imageURL1,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                print(imageURL1);
              },
              child: Text(
                name1,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
        Text(
          '--->',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,

//              decoration: BoxDecoration(
//                  image: DecorationImage(
//                image: AssetImage(imageURL2),
//                fit: BoxFit.fill,
//              ),),

              child: Image.network(
                imageURL2,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 10),
            Text(
              name2,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Column(
//                          children: <Widget>[
//                            Container(
//                              height: 100,
//                              width: 100,
////                        color: Colors.green,
//                              decoration: BoxDecoration(
//                                  image: DecorationImage(
//                                image: AssetImage('images/pikachu.png'),
//                                fit: BoxFit.fill,
//                              )),
//                            ),
//                            SizedBox(height: 10),
//                            Text(
//                              'Pikachu',
//                              style: TextStyle(
//                                fontSize: 20.0,
//                                color: Colors.black54,
//                              ),
//                            ),
//                          ],
//                        ),
//                        Text(
//                          '--->',
//                          style: TextStyle(
//                            fontSize: 25.0,
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                        Column(
//                          children: <Widget>[
//                            Container(
//                              height: 100,
//                              width: 100,
////                        color: Colors.green,
//                              decoration: BoxDecoration(
//                                  image: DecorationImage(
//                                image: AssetImage('images/pikachu.png'),
//                                fit: BoxFit.fill,
//                              )),
//                            ),
//                            SizedBox(height: 10),
//                            Text(
//                              'Pikachu',
//                              style: TextStyle(
//                                fontSize: 20.0,
//                                color: Colors.black54,
//                              ),
//                            ),
//                          ],
//                        ),
//                      ],
//                    ),

//          imageURL1: 'https://cdn.traction.one/pokedex/pokemon/1.png',
