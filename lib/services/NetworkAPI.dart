import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class NetworkAPI {
  NetworkAPI(this.url);

  final String url;

  Future getData() async {
//    https://pokeapi.co/api/v2/pokemon/
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String retrievedData = response.body;

      print('retrievedData gotten');
      return jsonDecode(retrievedData);
    } else {
      print('-----------------------------');
      print(response.statusCode);
      return null;
      // throw error;
    }
  }
}

class NetworkPokeDevAPI {
  //https://pokedevs.gitbook.io/pokedex/resources/pokemon
  NetworkPokeDevAPI(this.glitchURL);

  String glitchURL;

  Future getData2() async {
    http.Response pokeDevData = await http.get(glitchURL);

    String retrievedpokeDevData = pokeDevData.body;

    if (pokeDevData.statusCode == 200) {
      return jsonDecode(retrievedpokeDevData);
    } else {
      print(pokeDevData.statusCode);
    }
  }
}
