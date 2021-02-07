import 'package:flutter/material.dart';
import 'package:poke_search/Screens/Generations/widgets/PokeTypes.dart';
import 'package:poke_search/Screens/detail.dart';
import 'dart:convert';
import 'package:poke_search/models/pokemon.dart';
import 'package:poke_search/tests/containerGrid.dart';
import 'file:///C:/Users/Administrator/AndroidStudioProjects/poke_search/lib/Screens/widgets/customMenu.dart';
import 'GeneratorClasses/generationClass.dart';

class GenerationVScreen extends StatefulWidget {
  static const routeName = '/generation-V';

  @override
  _GenerationVScreenState createState() => _GenerationVScreenState();
}

class _GenerationVScreenState extends State<GenerationVScreen> {
  bool _showSpinner = true;
  List<Pokemon> runPokemonList = [];

  void fetchGenerationV() async {
    for (var num = 493; num <= 648; num++) {
      String data = await DefaultAssetBundle.of(context)
          .loadString('assets/allPokemons.json');
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
    fetchGenerationV();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
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
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Text(
                        'Generation V',
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                            id: runPokemonList[i].id,
                          ),
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
  final String id;

  GridItem(
      {this.name, this.image, this.color, this.type1, this.type2, this.id});

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
        child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              pokemonName: name,
            ),
          ),
        );
      },
      child: Container(
//        height: 170,
//        width: 5260,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.grey.withOpacity(0.08), BlendMode.dstATop),
              fit: BoxFit.scaleDown,
              image: AssetImage('images/pokeball.png'),
              alignment: Alignment.bottomRight,
            ),
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(18.0),
            ),
          ),
          child: Stack(children: <Widget>[
            Positioned(
              right: 0,
              left: 59,
              top: 20,
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 110,
                    width: 190,
//                  color: Colors.teal,
                    child: Image.network(
                      image,
                      fit: BoxFit.fitHeight,
                    ),
                  )),
            ),
            Positioned(
//                    left: 3.0,
                child: Column(
              children: <Widget>[
                Container(
//                    color: Colors.teal,
//                    height: media.height * 0.12,
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                name, //Charmeleon
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                id,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white38,
                                ),
                              )
                            ]),
                        SizedBox(height: 12),
                        _pokemonTypesPlacement(),
                      ],
                    ))
              ],
            ))
          ])),
    ));
  }
}
