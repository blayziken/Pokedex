import 'package:flutter/material.dart';

class pokeType extends StatelessWidget {
  final String type;

  pokeType({this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 70,
//                      color: Colors.white,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
      child: Center(
        child: Text(
          type,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
