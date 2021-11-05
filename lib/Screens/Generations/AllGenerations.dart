import 'package:flutter/material.dart';
import 'package:poke_search/Screens/Generations/widgets/PokeTypes.dart';
import 'package:poke_search/Screens/detail.dart';
import 'package:poke_search/Screens/widgets/customMenu.dart';
import 'package:poke_search/Screens/widgets/grid_items.dart';
import 'dart:convert';
import 'package:poke_search/models/pokemon.dart';
import 'package:poke_search/tests/containerGrid.dart';
import 'GenerationI.dart';
import 'GeneratorClasses/generationClass.dart';

class AllGenerationScreen extends StatefulWidget {
  static const routeName = '/All-Generation';

  @override
  _AllGenerationScreenState createState() => _AllGenerationScreenState();
}

class _AllGenerationScreenState extends State<AllGenerationScreen> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  bool _showSpinner = true;
  List<Pokemon> runPokemonList = [];

  void fetchAllGeneration() async {
    for (var num = 0; num <= 80; num++) {
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
    fetchAllGeneration();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: _showSpinner
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
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
                  ],
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
                      // Padding(
                      //   padding: EdgeInsets.only(top: media.height * 0.020),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: <Widget>[
                      //       Text(
                      //         'Pokedex',
                      //         style: TextStyle(
                      //           fontSize: media.height * 0.060,
                      //           fontWeight: FontWeight.w900,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(height: media.height * 0.025),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(media.height * 0.015),
//                        padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 10,
                              childAspectRatio: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height / 0.4,
                            ),
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
