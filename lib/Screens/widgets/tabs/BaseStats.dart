import 'package:flutter/material.dart';

class BaseStats extends StatelessWidget {
  BaseStats({
    this.hp,
    this.attack,
    this.defense,
    this.spAtk,
    this.spDef,
    this.speed,
  });

  final int hp;
  final int attack;
  final int defense;
  final int spAtk; //Special Attack
  final int spDef; //Special Defense
  final int speed;

  @override
  Widget build(BuildContext context) {
    int total = hp + attack + defense + spAtk + spDef + speed;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 30.0, top: 15.0, bottom: 30.0, right: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 270,
              width: double.infinity,
//              color: Colors.redAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
//                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'hp',
                        style: TextStyle(fontSize: 16.0, color: Colors.black54),
                      ),
                      Text(
                        'attack',
                        style: TextStyle(fontSize: 16.0, color: Colors.black54),
                      ),
                      Text(
                        'defense',
                        style: TextStyle(fontSize: 16.0, color: Colors.black54),
                      ),
                      Text(
                        'spAtk',
                        style: TextStyle(fontSize: 16.0, color: Colors.black54),
                      ),
                      Text(
                        'spDef',
                        style: TextStyle(fontSize: 16.0, color: Colors.black54),
                      ),
                      Text(
                        'speed',
                        style: TextStyle(fontSize: 16.0, color: Colors.black54),
                      ),
                      Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BaseStatsRow(
                        value: '$hp',
                        valueBar: hp * 1.0,
                      ),
                      BaseStatsRow(
                        value: '$attack',
                        valueBar: attack * 1.0,
                      ),
                      BaseStatsRow(
                        value: '$defense',
                        valueBar: defense * 1.0,
                      ),
                      BaseStatsRow(
                        value: '$spAtk',
                        valueBar: spAtk * 1.0,
                      ),
                      BaseStatsRow(
                        value: '$spDef',
                        valueBar: spDef * 1.0,
                      ),
                      BaseStatsRow(
                        value: '$speed',
                        valueBar: speed * 1.0,
                      ),
//                      BaseStatsRow(value: '$total', st),
                      Text(
                        '$total',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Type defenses',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Will be added later.',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  ' blah blah blah blah',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BaseStatsRow extends StatelessWidget {
  final String value;
  final double valueBar;
  BaseStatsRow({this.value, this.valueBar});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 40,
//          color: Colors.teal,
          child: Text(
            value,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        SizedBox(width: 5),
        Container(width: valueBar, color: Colors.red, height: 5),
      ],
    );
  }
}
