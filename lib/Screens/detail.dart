import 'package:flutter/material.dart';
import 'package:poke_search/Screens/widgets/TabGeneral.dart';
import 'package:poke_search/provider/api_provider.dart';
import 'package:poke_search/services/NetworkAPI.dart';
import '../Screens/search.dart';
import '../services/string_extension.dart';
import 'error_page.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({this.pokemonName});

  String pokemonName;
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  bool showSpinner = true;

  String pokeName;
  String pokeNameCapitalized;
//  String pokeAbility;
  String pokeHeight; //CORRECT
  String pokeWeight; //CORRECT
  String pokePicture;
  String pokeDescription;
  var pokeGenderMale; //CORRECT
  var pokeGenderFemale; //CORRECT
  String pokeType1;
  String pokeType2;
  int pokedexNumber; //CORRECT
  int pokeGen; //CORRECT
  bool starter; //CORRECT

  List types = [];
  List gender = [];

  // BASE STATS
  int hp;
  int attack;
  int defense;
  int spAtk; //Special Attack
  int spDef; //Special Defense
  int speed;
  int total;

  // EVOLUTION
  List evolutionLine = [];

  //MOVES
  List normalAbilities = [];
  List hiddenAbilities = [];

  @override
  void initState() {
    super.initState();
    updateUI();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animationController.repeat();
  }

//   dynamic getDataFromAPI1() async {
//     String pokemonName = widget.pokemonName.toLowerCase();
//
//     NetworkAPI networkAPI = NetworkAPI('https://pokeapi.co/api/v2/pokemon/$pokemonName');
//
//     var pokemonData = await networkAPI.getData();
//
//     //TODO: OR INSIDE AN IF STATEMENT
//     if (pokemonData != null) {
//       return pokemonData;
//     } else {
//       print('aaaaaaaaaaaaaaaaaaaa');
// //       return showDialog(
// //         context: context,
// //         builder: (ctx) => AlertDialog(
// //           title: Text('Not Found!'),
// //           content: Text('No such pokemon 🙃'),
// //           actions: <Widget>[
// //             FlatButton(
// //               child: Text('Try again'),
// //               onPressed: () {
// // //                      Navigator.of(context).pop;
// //                 Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => Search(),
// //                     ));
// //               },
// //             )
// //           ],
// //         ),
// //       );
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ErrorPage(),
//         ),
//       );
//       return null;
//     }
//   }
//
// ////////////////////////////////
//   dynamic getDataFromAPI2() async {
//     String pokemonName = widget.pokemonName.toLowerCase();
//
//     NetworkPokeDevAPI networkPokeDevAPI = NetworkPokeDevAPI('https://pokeapi.glitch.me/v1/pokemon/$pokemonName');
//     var pokemonImage = await networkPokeDevAPI.getData2();
//     return pokemonImage;
//   }

  //////////////////////////////////////////////////////////////////////////////////// from VOID to DYNAMIC
  dynamic updateUI() async {
    print('Entered here');

    // var pokeData = await getDataFromAPI1();
    var pokeData = await getDataFromAPI1(widget.pokemonName, context);
    var pokeData2 = await getDataFromAPI2(widget.pokemonName);
    // var pokeData2 = await getDataFromAPI2();

    //FIRST API
    pokeName = pokeData['name'];
    pokeNameCapitalized = pokeName.capitalize();
    pokedexNumber = pokeData['id'];

    /// base stats
    hp = pokeData['stats'][0]['base_stat'];
    attack = pokeData['stats'][1]['base_stat'];
    defense = pokeData['stats'][2]['base_stat'];
    spAtk = pokeData['stats'][3]['base_stat'];
    spDef = pokeData['stats'][4]['base_stat'];
    speed = pokeData['stats'][5]['base_stat'];

    //SECOND API
    pokeHeight = pokeData2[0]['height'];
    pokeWeight = pokeData2[0]['weight'];
    pokePicture = pokeData2[0]['sprite'];
    pokeDescription = pokeData2[0]['description'];

    // NOTE! IMPLEMENTATION: IF THE GENDER LIST IS EMPTY:
    gender = pokeData2[0]['gender'];
    if (gender.isEmpty) {
      pokeGenderMale = '❌';
      pokeGenderFemale = '❌';
    } else {
      pokeGenderMale = pokeData2[0]['gender'][0];
      pokeGenderFemale = pokeData2[0]['gender'][1];
    }
//

    pokeGen = pokeData2[0]['gen'];
    starter = pokeData2[0]['starter'];

    types = pokeData2[0]['types']; ////////////// I REMOVED AWAIT

    evolutionLine = pokeData2[0]['family']['evolutionLine'];

    normalAbilities = pokeData2[0]['abilities']['normal'];
    print(normalAbilities);

    hiddenAbilities = pokeData2[0]['abilities']['hidden'];
    print(hiddenAbilities);

    setState(() {
      showSpinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    //Pokemon Types implementation
    Widget _pokemonTypes() {
      if (types.length == 1) {
        pokeType1 = types[0];
        return PokeType(type: pokeType1);
      } else {
        pokeType1 = types[0];
        pokeType2 = types[1];
        return Row(
          children: <Widget>[
            PokeType(type: pokeType1),
            SizedBox(width: media.height * 0.010),
            PokeType(type: pokeType2),
          ],
        );
      }
    }

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
                      padding: EdgeInsets.only(left: media.height * 0.02, top: media.height * 0.01),
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: media.height * 0.025, // 25.0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          animationController.dispose();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: media.height * 0.030, top: media.height * 0.025, right: media.height * 0.020),
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
                                  fontSize: media.height * 0.045, // 45.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '#$pokedexNumber',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  fontSize: media.height * 0.030, // 20.0,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: media.height * 0.005),
                          _pokemonTypes(),
//
                          SizedBox(height: media.height * 0.005),
                          Center(
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  child: Center(
                                    child: AnimatedBuilder(
                                      animation: animationController,
                                      builder: (BuildContext context, Widget) {
                                        return Transform.rotate(
                                          angle: animationController.value * 6.3,
                                          child: Container(
                                            height: media.height * 0.2, // 200,
                                            width: media.height * 0.2, // 200,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage('images/pokeball32.png'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
//                                      child: Container(
//                                            height: 180,
//                                            width: 180,
//                                            decoration: BoxDecoration(
//                                              image: DecorationImage(
//                                                image: AssetImage(
//                                                    'images/pokeball32.png'),
//                                                fit: BoxFit.fill,
//                                              ),
//                                            ),
//                                          ) ,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    // color: Colors.brown,
                                    height: media.height * 0.2, // 200,
                                    width: media.height * 0.2, // 200,

                                    child: Image.network(
                                      pokePicture,
                                      // height: 260,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                            topLeft: Radius.circular(media.height * 0.035),
                            topRight: Radius.circular(media.height * 0.035),
                          ),
                        ),
                        child: TabGeneral(
                          //About Tab
                          pokeWeight: pokeWeight,
                          pokeHeight: pokeHeight,
                          description: pokeDescription,
                          genderMale: pokeGenderMale,
                          genderFemale: pokeGenderFemale,
                          gen: pokeGen,
                          starter: starter,
                          normalAbilities: normalAbilities,
                          hiddenAbilities: hiddenAbilities,

                          //Base Stats Tab
                          hp: hp,
                          speed: speed,
                          total: total,
                          spDef: spDef,
                          spAtk: spAtk,
                          defense: defense,
                          attack: attack,

                          //Evolution Line
                          evolutionLine: evolutionLine,
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
    var media = MediaQuery.of(context).size;

    return Container(
      height: media.height * 0.030,
      width: media.height * 0.1, // 100,
//                      color: Colors.white,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.all(
          Radius.circular(media.height * 0.025),
        ),
      ),
      child: Center(
        child: Text(
          type,
          style: TextStyle(
            color: Colors.white,
            fontSize: media.height * 0.020, // 18.0,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
