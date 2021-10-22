import 'package:flutter/cupertino.dart';
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
    var media = MediaQuery.of(context).size;

    int total = hp + attack + defense + spAtk + spDef + speed;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: media.height * 0.030,
          top: media.height * 0.05,
          bottom: media.height * 0.030,
          right: media.height * 0.030,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Container(
                height: media.height * 0.4, // 270,
                // width: double.infinity,
//              color: Colors.redAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
//                crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'hp',
                          style: TextStyle(fontSize: media.height * 0.025, color: Colors.black54),
                        ),
                        Text(
                          'attack',
                          style: TextStyle(fontSize: media.height * 0.025, color: Colors.black54),
                        ),
                        Text(
                          'defense',
                          style: TextStyle(fontSize: media.height * 0.025, color: Colors.black54),
                        ),
                        Text(
                          'spAtk',
                          style: TextStyle(fontSize: media.height * 0.025, color: Colors.black54),
                        ),
                        Text(
                          'spDef',
                          style: TextStyle(fontSize: media.height * 0.025, color: Colors.black54),
                        ),
                        Text(
                          'speed',
                          style: TextStyle(fontSize: media.height * 0.025, color: Colors.black54),
                        ),
                        SizedBox(height: media.height * 0.010),
                        Text(
                          'Total',
                          style: TextStyle(fontSize: media.height * 0.025, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(width: media.height * 0.050),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        SizedBox(height: media.height * 0.010),

                        Text(
                          '$total',
                          style: TextStyle(
                            fontSize: media.height * 0.025,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(height: media.height * 0.05),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: <Widget>[
            //     Text(
            //       'Type defenses',
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: media.height * 0.030,
            //       ),
            //     ),
            //     SizedBox(height: media.height * 0.015),
            //     Text(
            //       'Coming....',
            //       style: TextStyle(
            //         fontSize: media.height * 0.020, // 15,
            //       ),
            //     ),
            //     SizedBox(height: media.height * 0.010),
            //     Text(
            //       'blah blah blah blah',
            //       style: TextStyle(
            //         fontSize: media.height * 0.020, // 15,
            //       ),
            //     ),
            //   ],
            // ),
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
    var media = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: media.height * 0.040,
//          color: Colors.teal,
          child: Text(
            value,
            style: TextStyle(fontSize: media.height * 0.022),
          ),
        ),
        SizedBox(width: media.height * 0.010),
        Container(width: valueBar, color: Colors.red, height: media.height * 0.005),
      ],
    );
  }
}
