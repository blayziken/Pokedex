import 'package:flutter/material.dart';
import 'package:poke_search/Screens/Generations/widgets/PokeTypes.dart';
import 'package:poke_search/Screens/detail.dart';
import 'package:poke_search/Screens/widgets/customMenu.dart';
import 'package:poke_search/Screens/widgets/grid_items.dart';
import 'dart:convert';
import 'package:poke_search/models/pokemon.dart';
import 'package:poke_search/tests/containerGrid.dart';
import 'GeneratorClasses/generationClass.dart';

class GenerationIIIScreen extends StatefulWidget {
  static const routeName = '/generation-III';

  @override
  _GenerationIIIScreenState createState() => _GenerationIIIScreenState();
}

class _GenerationIIIScreenState extends State<GenerationIIIScreen> {
  bool _showSpinner = true;
  List<Pokemon> runPokemonList = [];

  void fetchGenerationIII() async {
    for (var num = 251; num <= 385; num++) {
      String data = await DefaultAssetBundle.of(context).loadString('assets/allPokemons.json');
      final jsonResult = json.decode(data);

      ifStatements(jsonResult, num);
//      Add new pokemon object into allPOKEMON List
      runPokemonList.add(Pokemon(
        name: jsonResult[num]['name'],
        image: jsonResult[num]['imageurl'],
        type1: type1X,
        type2: type2X,
        backgroundColor: backgroundColorX,
        id: jsonResult[num]['id'],
      ));
    }
    setState(() {
      _showSpinner = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchGenerationIII();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingBubble(),
        body: _showSpinner
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  color: Colors.white12,
                  height: media.height,
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      CustomDropDownButton(),
                      Padding(
                        padding: EdgeInsets.only(top: media.height * 0.020),
                        child: Text(
                          'Generation III',
                          style: TextStyle(
                            fontSize: media.height * 0.050,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      SizedBox(height: media.height * 0.005),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(media.height * 0.015),
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 10, childAspectRatio: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height / 0.4),
                            itemCount: runPokemonList.length,
                            itemBuilder: (ctx, i) => GridItem(
                              name: runPokemonList[i].name,
                              image: runPokemonList[i].image,
                              color: runPokemonList[i].backgroundColor,
                              type1: runPokemonList[i].type1,
                              type2: runPokemonList[i].type2,
                              id: runPokemonList[i].id,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

// class GridItem extends StatelessWidget {
//   final String name;
//   final String image;
//   final Color color;
//   final String type1;
//   final String type2;
//   final String id;
//
//   GridItem({this.name, this.image, this.color, this.type1, this.type2, this.id});
//
//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;
//
//     //Checking if Pokemon Type 2 is empty
//     Widget _pokemonTypesPlacement() {
//       if (type2 == '') {
//         return Column(
//           children: <Widget>[
//             SizedBox(height: media.height * 0.014),
//             pokeType(type: type1),
//           ],
//         );
//       } else {
//         return Column(
//           children: <Widget>[
//             pokeType(type: type1),
//             SizedBox(height: media.height * 0.010),
//             pokeType(type: type2),
//           ],
//         );
//       }
//     }
//
//     return GridTile(
//         child: InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DetailScreen(
//               pokemonName: name,
//             ),
//           ),
//         );
//       },
//       child: Container(
// //        height: 170,
// //        width: 5260,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               colorFilter: new ColorFilter.mode(Colors.grey.withOpacity(0.08), BlendMode.dstATop),
//               fit: BoxFit.scaleDown,
//               image: AssetImage('images/pokeball.png'),
//               alignment: Alignment.bottomRight,
//             ),
//             color: color,
//             borderRadius: BorderRadius.all(
//               Radius.circular(media.height * 0.018),
//             ),
//           ),
//           child: Stack(children: <Widget>[
//             Positioned(
//               right: 0,
//               left: media.height * 0.059,
//               top: media.height * 0.020,
//               child: Align(
//                   alignment: Alignment.bottomRight,
//                   child: Container(
//                     height: media.height * 0.110,
//                     width: media.height * 0.190,
// //                  color: Colors.teal,
//                     child: Image.network(
//                       image,
//                       fit: BoxFit.fitHeight,
//                     ),
//                   )),
//             ),
//             Positioned(
// //                    left: 3.0,
//                 child: Column(
//               children: <Widget>[
//                 Container(
// //                    color: Colors.teal,
// //                    height: media.height * 0.12,
//                     margin: EdgeInsets.only(left: media.height * 0.010, top: media.height * 0.010),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
//                           Text(
//                             name, //Charmeleon
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: media.height * 0.020,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             id,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: media.height * 0.025,
//                               color: Colors.white38,
//                             ),
//                           )
//                         ]),
//                         SizedBox(height: media.height * 0.012),
//                         _pokemonTypesPlacement(),
//                       ],
//                     ))
//               ],
//             ))
//           ])),
//     ));
//   }
// }
