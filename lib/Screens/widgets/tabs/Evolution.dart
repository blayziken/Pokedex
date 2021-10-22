import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:poke_search/services/NetworkAPI.dart';

class Evolution extends StatefulWidget {
  List evolutionLine = [];

  Evolution({this.evolutionLine});

  @override
  _EvolutionState createState() => _EvolutionState();
}

class _EvolutionState extends State<Evolution> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  bool showSpinner = true;

  String pokemonOneImage;
  String pokemonTwoImage;
  String pokemonThreeImage;

  String pokemonOne;
  String pokemonTwo;
  String pokemonThree;

  List evolutionLineHere;

  @override
  void initState() {
    super.initState();

    getImageURL();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    );

    animationController.repeat();
  }

  dynamic getSprite(name) async {
    NetworkPokeDevAPI networkPokeDevAPI = NetworkPokeDevAPI('https://pokeapi.glitch.me/v1/pokemon/$name');

    var pokemonImage = await networkPokeDevAPI.getData2();

    var networkImage = pokemonImage[0]['sprite'];
    return networkImage;
  }

  dynamic getImageURL() async {
    evolutionLineHere = widget.evolutionLine; // [Bulbasaur, Ivysaur, Venusaur]

    if (evolutionLineHere.length == 3) {
      pokemonOne = evolutionLineHere[0];
      pokemonTwo = evolutionLineHere[1];
      pokemonThree = evolutionLineHere[2];
      //Images
      pokemonOneImage = await getSprite(pokemonOne);
      pokemonTwoImage = await getSprite(pokemonTwo);
      pokemonThreeImage = await getSprite(pokemonThree);
    }

    if (evolutionLineHere.length == 2) {
      pokemonOne = evolutionLineHere[0];
      pokemonTwo = evolutionLineHere[1];
      //Images
      pokemonOneImage = await getSprite(pokemonOne);
      pokemonTwoImage = await getSprite(pokemonTwo);
    }

    if (evolutionLineHere.length == 1) {
      pokemonOne = evolutionLineHere[0];
      //Images
      pokemonOneImage = await getSprite(pokemonOne);
    }

    setState(() {
      showSpinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    Widget _evolutionPokes() {
      if (evolutionLineHere.length == 1) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: media.height * 0.025),
            Expanded(
              flex: 0,
              child: Center(
                child: Container(
//                  height: media.height * 0.7,
                  child: Padding(
                    padding: EdgeInsets.only(left: media.height * 0.020, right: media.height * 0.050),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: media.height * 0.010),
                        Text(
                          'It\'s just ',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: media.height * 0.030,
                          ),
                        ),
                        SizedBox(height: media.height * 0.010),
                        Container(
                          height: media.height * 0.30,
                          width: media.height * 0.30,
                          child: Image.network(
                            pokemonOneImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: media.height * 0.010),
                        Text(
                          '$pokemonOne',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: media.height * 0.050,
                            color: Colors.green[900],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      } else if (evolutionLineHere.length == 2) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Text(
              //   'Evolution Chain',
              //   style: TextStyle(
              //     fontWeight: FontWeight.w900,
              //     fontSize: media.height * 0.022,
              //   ),
              // ),
              SizedBox(height: media.height * 0.010),
              Padding(
                padding: EdgeInsets.only(left: media.height * 0.010, right: media.height * 0.050),
                child: EvolutionChainRow(
                  name1: pokemonOne,
                  imageURL1: pokemonOneImage,
                  name2: pokemonTwo,
                  imageURL2: pokemonTwoImage,
                ),
              ),
            ],
          ),
        );
      } else {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Text(
              //   'Evolution Chain',
              //   style: TextStyle(
              //     fontWeight: FontWeight.w900,
              //     fontSize: media.height * 0.022,
              //   ),
              // ),
              // SizedBox(height: media.height * 0.010),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: media.height * 0.010, right: media.height * 0.050, top: media.height * 0.010),
                  child: Column(
                    children: <Widget>[
                      EvolutionChainRow(
                        name1: pokemonOne,
                        imageURL1: pokemonOneImage,
                        name2: pokemonTwo,
                        imageURL2: pokemonTwoImage,
                      ),
                      SizedBox(height: media.height * 0.030),
                      EvolutionChainRow(
                        name1: pokemonTwo,
                        imageURL1: pokemonTwoImage,
                        name2: pokemonThree,
                        imageURL2: pokemonThreeImage,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    }

    return showSpinner
        ? Center(
            child: AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, widget) {
                return Transform.rotate(
                  angle: animationController.value * 6.3,
                  child: Container(
                    height: media.height * 0.060, // 50,
                    width: media.height * 0.060, // 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/unnamed.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        : SingleChildScrollView(
            child: Container(
//              color: Colors.grey[300],
//               height: media.height * 0.4,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: media.height * 0.040, top: media.height * 0.010),
                child: _evolutionPokes(),
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
    var media = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: media.height * 0.15,
              width: media.height * 0.15,
              child: Image.network(
                imageURL1,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: media.height * 0.020),
            Text(
              name1,
              style: TextStyle(
                fontSize: media.height * 0.018,
                color: Colors.black87,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        Text(
          '>',
          style: TextStyle(
            fontSize: media.height * 0.025,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              height: media.height * 0.15,
              width: media.height * 0.15,
              child: Image.network(
                imageURL2,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: media.height * 0.020),
            Text(
              name2,
              style: TextStyle(
                fontSize: media.height * 0.018,
                color: Colors.black87,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//          imageURL1: 'https://cdn.traction.one/pokedex/pokemon/1.png',
