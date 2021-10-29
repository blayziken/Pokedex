import 'dart:io';
import 'package:flutter/material.dart';
import 'package:poke_search/Screens/Error_Screens/error_page.dart';
import 'package:poke_search/services/NetworkAPI.dart';

dynamic getDataFromAPI1(String pokemonName, BuildContext context) async {
  String name = pokemonName.toLowerCase();
  NetworkAPI networkAPI = NetworkAPI('https://pokeapi.co/api/v2/pokemon/$name');

  // var pokemonData = await networkAPI.getData();

  try {
    var pokemonData = await networkAPI.getData();

    if (pokemonData != null) {
      return pokemonData;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ErrorPage(),
        ),
      );
      return null;
    }
  } catch (err) {
    if (err is SocketException) {
      Navigator.pushReplacementNamed(context, '/no-internet');
    }
  }
}

dynamic getDataFromAPI2(String pokemonName) async {
  String name = pokemonName.toLowerCase();

  NetworkPokeDevAPI networkPokeDevAPI =
      NetworkPokeDevAPI('https://pokeapi.glitch.me/v1/pokemon/$name');
  var pokemonImage = await networkPokeDevAPI.getData2();
  return pokemonImage;
}
