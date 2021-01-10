import 'package:flutter/material.dart';

class Pokemon {
  final String name;
  final String type1;
  final String type2;
  final String image;
  final Color backgroundColor;
  final String id;

  Pokemon(
      {this.name,
      this.type1,
      this.type2,
      this.image,
      this.backgroundColor,
      this.id});
}
