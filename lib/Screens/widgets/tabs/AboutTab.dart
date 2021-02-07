import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class About extends StatelessWidget {
  About({
    this.pokeHeight,
    this.pokeWeight,
    this.description,
    this.genderFemale,
    this.gen,
    this.genderMale,
    this.starter,
    this.normalAbilities,
    this.hiddenAbilities,
//    this.types,
  });
  String pokeHeight;
  String pokeWeight;
  String description;
  var genderMale;
  var genderFemale;
  int gen;
  bool starter;
//  List types;
  String pokeType1;
  String pokeType2;
  // Abilities
  List normalAbilities = [];
  List hiddenAbilities = [];
  String normal1;
  String normal2;
  String normal3;
  String hidden1;
  String hidden2;
  String hidden3;

  @override
  Widget build(BuildContext context) {
    //
    Widget _normalAbilities() {
      if (normalAbilities.length == 1) {
        normal1 = normalAbilities[0];
        return Row(
          children: [
            abilitiesWidget(
              ability: normal1,
              gradientType: Gradients.blush,
            ),
          ],
        );
      }
      //
      if (normalAbilities.length == 2) {
        normal1 = normalAbilities[0];
        normal2 = normalAbilities[1];
        return Row(
          children: [
            abilitiesWidget(
              ability: normal1,
              gradientType: Gradients.blush,
            ),
            SizedBox(width: 10),
            abilitiesWidget(
              ability: normal2,
              gradientType: Gradients.cosmicFusion,
            ),
          ],
        );
      }
//
      if (normalAbilities.length == 3) {
        normal1 = normalAbilities[0];
        normal2 = normalAbilities[1];
        normal3 = normalAbilities[2];
        return Row(
          children: [
            abilitiesWidget(
              ability: normal1,
              gradientType: Gradients.blush,
            ),
            SizedBox(width: 10),
            abilitiesWidget(
              ability: normal2,
              gradientType: Gradients.hersheys,
            ),
            SizedBox(width: 10),
            abilitiesWidget(
              ability: normal3,
              gradientType: Gradients.tameer,
            ),
          ],
        );
      }
    }

    Widget _hiddenAbilities() {
      if (hiddenAbilities.length == 1) {
        hidden1 = hiddenAbilities[0];
        return Row(
          children: [
            abilitiesWidget(
              ability: hidden1,
              gradientType: Gradients.cosmicFusion,
            ),
          ],
        );
      }
      //
      if (hiddenAbilities.length == 2) {
        hidden1 = hiddenAbilities[0];
        hidden2 = hiddenAbilities[1];
        return Row(
          children: [
            abilitiesWidget(
              ability: hidden1,
              gradientType: Gradients.tameer,
            ),
            SizedBox(width: 10),
            abilitiesWidget(
              ability: hidden2,
              gradientType: Gradients.cosmicFusion,
            ),
          ],
        );
      }
//
      if (hiddenAbilities.length == 3) {
        hidden1 = hiddenAbilities[0];
        hidden2 = hiddenAbilities[1];
        hidden3 = hiddenAbilities[2];
        return Row(
          children: [
            abilitiesWidget(
              ability: hidden1,
              gradientType: Gradients.hersheys,
            ),
            SizedBox(width: 10),
            abilitiesWidget(
              ability: hidden2,
              gradientType: Gradients.blush,
            ),
            SizedBox(width: 10),
            abilitiesWidget(
              ability: hidden3,
              gradientType: Gradients.tameer,
            ),
          ],
        );
      }
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 30.0, top: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              flex: 0,
              child: Center(
                child: Container(
                  height: 80,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, top: 15.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Height',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
//                              '2\' 04"',
                              pokeHeight,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 80.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Weight',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
//                              '15.2 lbs',
                              pokeWeight,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Breeding',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 15),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(width: 36),
                    Row(
                      children: [
                        Text(
                          '$genderMale ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          MdiIcons.genderMale,
                          color: Colors.black,
                          size: 16,
                        ),
                        SizedBox(width: 15),
                        Text(
                          '$genderFemale ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          MdiIcons.genderFemale,
                          color: Colors.black,
                          size: 16,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    Text(
                      'Generation',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '$gen',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    Text(
                      'Starter',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(width: 40),
                    Text(
                      '$starter',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 22),
            Text(
              'Abilities',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Normal',
              style: TextStyle(
                fontSize: 15.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Column(
              children: [_normalAbilities()],
            ),
            SizedBox(height: 10),
            Text(
              'Hidden',
              style: TextStyle(
                fontSize: 15.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Column(
              children: [_hiddenAbilities()],
            ),
          ],
        ),
      ),
    );
  }
}

class abilitiesWidget extends StatelessWidget {
  String ability;
  var gradientType;

  abilitiesWidget({this.ability, this.gradientType});

  @override
  Widget build(BuildContext context) {
    return GradientCard(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(60),
        ),
      ),
      gradient: gradientType,
      shadowColor: Gradients.cosmicFusion.colors.last.withOpacity(0.25),
      elevation: 8,
      child: Container(
        height: 30,
        width: 110,
        child: Center(
          child: Text(
            ability,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
