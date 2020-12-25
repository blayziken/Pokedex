import 'package:flutter/material.dart';
import 'package:poke_search/services/NetworkAPI.dart';
import 'package:poke_search/tests/TabTest.dart';
import '../Screens/home.dart';
//import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../services/string_extension.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({this.pokemonName});

  String pokemonName;
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool showSpinner = true;

  String pokeName;
  String pokeNameCapitalized;
//  String pokeAbility;
  String pokeHeight; //CORRECT
  String pokeWeight; //CORRECT
  String pokePicture;
  String pokeDescription;
  double pokeGenderMale; //CORRECT
  double pokeGenderFemale; //CORRECT
  String pokeType1;
  String pokeType2;
  int pokedexNumber; //CORRECT
  int pokeGen; //CORRECT
  bool starter; //CORRECT

  @override
  void initState() {
    //

    super.initState();
    getData();
    print('---------------------------');
    updateUI();
  }

  dynamic getData() async {
    String pokemonName = widget.pokemonName;

    NetworkAPI networkAPI =
        NetworkAPI('https://pokeapi.co/api/v2/pokemon/$pokemonName');

    var pokemonData = await networkAPI.getData();
//    return pokemonData;
    //TODO: OR INSIDE AN IF STATEMENT
    if (pokemonData != '' || pokemonData != null) {
      print('here?');
      return pokemonData;
    } else {
      return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Not Found!'),
                content: Text('No such pokemon 🙃'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Try again'),
                    onPressed: () {
//                      Navigator.of(context).pop;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ));
                    },
                  )
                ],
              ));
    }
  }

  dynamic getData2() async {
    String pokemonName = widget.pokemonName;

    NetworkPokeDevAPI networkPokeDevAPI =
        NetworkPokeDevAPI('https://pokeapi.glitch.me/v1/pokemon/$pokemonName');
    var pokemonImage = await networkPokeDevAPI.getData2();
    return pokemonImage;
  }

  void updateUI() async {
    print('Entered here');
    var pokeData = await getData();
    var pokeData2 = await getData2();
    print(pokeData2);
    print('--------------------------------');

    //FIRST API
    pokeName = pokeData['name'];
    pokeNameCapitalized = pokeName.capitalize();
//    pokeAbility = pokeData['abilities'][0]['ability']['name'];

    pokedexNumber = pokeData['id'];

    //SECOND API
    pokeHeight = pokeData2[0]['height'];
    pokeWeight = pokeData2[0]['weight'];
    pokePicture = pokeData2[0]['sprite'];
    pokeDescription = pokeData2[0]['description'];
    pokeType1 = pokeData2[0]['types'][0];
    pokeType2 = pokeData2[0]['types'][1];
    pokeGenderMale = pokeData2[0]['gender'][0];
    pokeGenderFemale = pokeData2[0]['gender'][1];
    pokeGen = pokeData2[0]['gen'];
    starter = pokeData2[0]['starter'];

    setState(() {
      showSpinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: showSpinner
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.green,
              ),
            )
          : SafeArea(
              child: Container(
                height: media.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.green[500],
                      Colors.green[600],
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
//              SizedBox(height: 50.0),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30.0, top: 10, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                pokeNameCapitalized,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 45.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '#$pokedexNumber',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: <Widget>[
                              //TODO CHANGE POKEABILITY!!!
                              PokeType(type: pokeType1),
                              SizedBox(width: 10),
                              PokeType(type: pokeType2),
                            ],
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  child: Center(
                                    child: Container(
                                      height: 180,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'images/pokeball32.png'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    height: 230,
//                                    child: Image.network(
//                                      pokePicture,
////                                  height: 260,
//                                      fit: BoxFit.fill,
//                                    ),
                                  ),
                                ),
                              ],
                            ),
//                            child: Container(
////                        color: Colors.white,
//                              height: 200,
//                              width: 200,
//                              decoration: BoxDecoration(
//                                image: DecorationImage(
//                                  image: AssetImage('images/pokeball32.png'),
//                                  fit: BoxFit.fill,
//                                ),
//                              ),
//
//                              alignment: Alignment.bottomCenter,
//                              child: Container(
//                                height: 300,
//                                child: Image.network(
//                                  pokePicture,
////                                  height: 260,
//                                  fit: BoxFit.fill,
//                                ),
//                              ),
////                              decoration: BoxDecoration(
////                                image: DecorationImage(
////                                  image: NetworkImage(pokePicture),
////                                  fit: BoxFit.fill,
////                                ),
////                              ),
//                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
//                  height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35.0),
                            topRight: Radius.circular(35.0),
                          ),
                        ),
                        child: TabTest(
                          pokeWeight: pokeWeight,
                          pokeHeight: pokeHeight,
                          description: pokeDescription,
                          genderMale: pokeGenderMale,
                          genderFemale: pokeGenderFemale,
                          gen: pokeGen,
                          starter: starter,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class PokeType extends StatelessWidget {
  String type;

  PokeType({this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
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
