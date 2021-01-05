import 'package:flutter/material.dart';
import '../services/NetworkAPI.dart';
import '../Screens/search.dart';

class APIFunctions {
  APIFunctions(this.name);
  String name;

  dynamic getData99() async {
    NetworkAPI networkAPI =
        NetworkAPI('https://pokeapi.co/api/v2/pokemon/$name');

    var pokemonData = await networkAPI.getData();
    print('23232');
    return (pokemonData);
//    print('2addf');
  }

  dynamic updateUI2() async {
    print('Entered here222222');
    var pokeData99 = await getData99();

    //FIRST API
    String pokeName = pokeData99['name'];
    print('pokeName ===== $pokeName');
    return pokeData99;
//    setState(() {
//      showSpinner = false;
//    });
  }
}
