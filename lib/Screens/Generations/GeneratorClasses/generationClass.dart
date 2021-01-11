import 'package:flutter/material.dart';

Color backgroundColorX;
String type1X;
String type2X;
List type;

void ifStatements(jsonResult, num) async {
  //Couple of IF-ELSE Statements
  //If Statement to change background of Grid Item
  if (jsonResult[num]['typeofpokemon'][0] == 'Grass') {
    backgroundColorX = Color(0XFF4E8234);
  } else if (jsonResult[num]['typeofpokemon'][0] == 'Fire') {
    backgroundColorX = Color(0XFFF08030);
  } else if (jsonResult[num]['typeofpokemon'][0] == 'Water') {
    backgroundColorX = Color(0XFF6890F0);
  } else if (jsonResult[num]['typeofpokemon'][0] == 'Normal') {
    backgroundColorX = Color(0XFF6D6D4E);
  } else if (jsonResult[num]['typeofpokemon'][0] == 'Bug') {
    backgroundColorX = Color(0XFF6D7815);
  } else if (jsonResult[num]['typeofpokemon'][0] == 'Ground') {
    backgroundColorX = Color(0XFF927D44);
  } else if (jsonResult[num]['typeofpokemon'][0] == 'Fighting') {
    backgroundColorX = Color(0XFFC03028);
  } else if (jsonResult[num]['typeofpokemon'][0] == 'Rock') {
    backgroundColorX = Color(0XFFB8A038);
  } else if (jsonResult[num]['typeofpokemon'][0] == 'Ghost') {
    backgroundColorX = Color(0XFF705898);
  } else if (jsonResult[num]['typeofpokemon'][0] == 'Dark') {
    backgroundColorX = Color(0XFF705848);
  } else if (jsonResult[num]['typeofpokemon'][0] == 'Dragon') {
    backgroundColorX = Color(0XFF7038F8);
  } else if (jsonResult[num]['typeofpokemon'][0] == 'Electric') {
    backgroundColorX = Color(0XFFF8D030);
  } else if (jsonResult[num]['typeofpokemon'][0] == 'Fairy') {
    backgroundColorX = Color(0XFFEE99AC);
  } else if (jsonResult[num]['typeofpokemon'][0] == 'Flying') {
    backgroundColorX = Color(0X6D5E9C);
  } else if (jsonResult[num]['typeofpokemon'][0] == 'Ice') {
    backgroundColorX = Color(0XFF98D8D8);
  } else if (jsonResult[num]['typeofpokemon'][0] == 'Poison') {
    backgroundColorX = Color(0XFFA040A0);
  } else if (jsonResult[num]['typeofpokemon'][0] == 'Psychic') {
    backgroundColorX = Color(0XFFF85888);
  } else if (jsonResult[num]['typeofpokemon'][0] == 'Steel') {
    backgroundColorX = Color(0XFFB8B8D0);
  } else {
    backgroundColorX = Colors.purple;
  }

  //If Statement to determine the Pokemon types
  if (jsonResult[num]['typeofpokemon'].length == 1) {
    type1X = jsonResult[num]['typeofpokemon'][0];
    type2X = '';
  } else if (jsonResult[num]['typeofpokemon'].length == 2) {
    type1X = jsonResult[num]['typeofpokemon'][0];
    type2X = jsonResult[num]['typeofpokemon'][1];
  } else {
    type1X = '';
    type2X = '';
  }
}
