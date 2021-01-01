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
  }

  dynamic getSprite(name) async {
    NetworkPokeDevAPI networkPokeDevAPI =
        NetworkPokeDevAPI('https://pokeapi.glitch.me/v1/pokemon/$name');

    var pokemonImage = await networkPokeDevAPI.getData2();
//    return pokemonImage;
//
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
            SizedBox(height: 25.0),
            Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(
                        'It\'s just ',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 150,
                        width: 150,
                        child: Image.network(
                          pokemonOneImage,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '$pokemonOne',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 50.0,
                          color: Colors.green[900],
                        ),
                      ),
                    ],
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
              Text(
                'Evolution Chain',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22.0,
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 50.0),
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
              Text(
                'Evolution Chain',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22.0,
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 50.0),
                child: Column(
                  children: <Widget>[
                    EvolutionChainRow(
                      name1: pokemonOne,
                      imageURL1: pokemonOneImage,
                      name2: pokemonTwo,
                      imageURL2: pokemonTwoImage,
                    ),
                    SizedBox(height: 30.0),
                    EvolutionChainRow(
                      name1: pokemonTwo,
                      imageURL1: pokemonTwoImage,
                      name2: pokemonThree,
                      imageURL2: pokemonThreeImage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    }

    return showSpinner
        ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.green,
            ),
          )
        : SingleChildScrollView(
            child: Container(
              color: Colors.grey[300],
              height: media.height * 0.4,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0, top: 10.0),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          onTap: () {
            print('Column 1 pressed');
            print(imageURL1);
          },
          child: Column(
            children: <Widget>[
              Container(
                height: 90,
                width: 90,
                child: Image.network(
                  imageURL1,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10),
              Text(
                name1,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
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
              height: 90,
              width: 90,
              child: Image.network(
                imageURL2,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 10),
            Text(
              name2,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//          imageURL1: 'https://cdn.traction.one/pokedex/pokemon/1.png',
