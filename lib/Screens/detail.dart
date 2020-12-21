import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: media.height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green[500],
                Colors.green[600],
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
//              SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 10, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Bulbasaur',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 45.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '#001',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: <Widget>[
                        PokeType(type: 'Grass'),
                        SizedBox(width: 10),
                        PokeType(type: 'Poison'),
                      ],
                    ),
                    SizedBox(height: 35),
                    Center(
                        child: Container(
//                        color: Colors.white,
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/pokeball32.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 190,
                        width: 190,
//                          color: Colors.white,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/pikachu.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
//                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PokeType extends StatelessWidget {
  String type;

  PokeType({this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 80,
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
            fontSize: 18.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
