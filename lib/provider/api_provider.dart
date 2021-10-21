import 'package:flutter/material.dart';
import 'package:poke_search/Screens/error_page.dart';
import 'package:poke_search/Screens/search.dart';
import 'package:poke_search/services/NetworkAPI.dart';

dynamic getDataFromAPI1(String pokemonName, BuildContext context) async {
  String name = pokemonName.toLowerCase();
  NetworkAPI networkAPI = NetworkAPI('https://pokeapi.co/api/v2/pokemon/$name');

  var pokemonData = await networkAPI.getData();

  //TODO: OR INSIDE AN IF STATEMENT
  if (pokemonData != null) {
    return pokemonData;
  } else {
//     print('aaaaaaaaaaaaaaaaaaaa');
//     return showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: Text('Not Found!'),
//         content: Text('No such pokemon 🙃'),
//         actions: <Widget>[
//           InkWell(
//             child: Text('Try again'),
//             onTap: () {
// //                      Navigator.of(context).pop;
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Search(),
//                 ),
//               );
//             },
//           )
//         ],
//       ),
//     );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ErrorPage(),
      ),
    );
    return null;
  }
}

dynamic getDataFromAPI2(String pokemonName) async {
  String name = pokemonName.toLowerCase();

  NetworkPokeDevAPI networkPokeDevAPI = NetworkPokeDevAPI('https://pokeapi.glitch.me/v1/pokemon/$name');
  var pokemonImage = await networkPokeDevAPI.getData2();
  return pokemonImage;
}
