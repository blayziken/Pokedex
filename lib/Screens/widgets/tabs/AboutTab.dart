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
    var media = MediaQuery.of(context).size;

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
            SizedBox(width: media.height * 0.010),
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
            SizedBox(width: media.height * 0.010),
            abilitiesWidget(
              ability: normal2,
              gradientType: Gradients.hersheys,
            ),
            SizedBox(width: media.height * 0.010),
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
            SizedBox(width: media.height * 0.010),
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
            SizedBox(width: media.height * 0.010),
            abilitiesWidget(
              ability: hidden2,
              gradientType: Gradients.blush,
            ),
            SizedBox(width: media.height * 0.010),
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
        padding: EdgeInsets.only(left: media.height * 0.030, top: media.height * 0.020, right: media.height * 0.020),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Text(
                description,
                style: TextStyle(
                  fontSize: media.height * 0.02, // 17,
                ),
              ),
            ),
            SizedBox(height: media.height * 0.015),
            Expanded(
              flex: 0,
              child: Center(
                child: Container(
                  height: media.height * 0.080,
                  width: media.height * 0.300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(media.height * 0.020),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: media.height * 0.005,
                        blurRadius: media.height * 0.007,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: media.height * 0.040, top: media.height * 0.015),
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
                                fontSize: media.height * 0.02,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: media.height * 0.007),
                            Text(
//                              '2\' 04"',
                              pokeHeight,
                              style: TextStyle(
                                fontSize: media.height * 0.02,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: media.height * 0.080),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Weight',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: media.height * 0.02,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: media.height * 0.007),
                            Text(
//                              '15.2 lbs',
                              pokeWeight,
                              style: TextStyle(
                                fontSize: media.height * 0.02,
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
            SizedBox(height: media.height * 0.015),
            Text(
              'Breeding',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: media.height * 0.030,
              ),
            ),
            SizedBox(height: media.height * 0.015),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: media.height * 0.02,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: media.height * 0.020),
                    Text(
                      'Generation',
                      style: TextStyle(
                        fontSize: media.height * 0.02,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: media.height * 0.020),
                    Text(
                      'Starter',
                      style: TextStyle(
                        fontSize: media.height * 0.02,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: media.height * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '$genderMale ',
                          style: TextStyle(
                            fontSize: media.height * 0.02,
                          ),
                        ),
                        Icon(
                          MdiIcons.genderMale,
                          color: Colors.black,
                          size: media.height * 0.018,
                        ),
                        SizedBox(width: media.height * 0.015),
                        Text(
                          '$genderFemale ',
                          style: TextStyle(
                            fontSize: media.height * 0.02,
                          ),
                        ),
                        Icon(
                          MdiIcons.genderFemale,
                          color: Colors.black,
                          size: media.height * 0.02,
                        ),
                      ],
                    ),
                    SizedBox(height: media.height * 0.020),
                    Text(
                      '$gen',
                      style: TextStyle(
                        fontSize: media.height * 0.02,
                      ),
                    ),
                    SizedBox(height: media.height * 0.020),
                    Text(
                      '$starter',
                      style: TextStyle(
                        fontSize: media.height * 0.02,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Column(
            //   children: <Widget>[
            //     Row(
            //       children: <Widget>[
            //         Text(
            //           'Gender',
            //           style: TextStyle(
            //             fontSize: media.height * 0.02,
            //             color: Colors.black54,
            //           ),
            //         ),
            //         SizedBox(width: media.height * 0.05),
            //         Row(
            //           children: [
            //             Text(
            //               '$genderMale ',
            //               style: TextStyle(
            //                 fontSize: media.height * 0.02,
            //               ),
            //             ),
            //             Icon(
            //               MdiIcons.genderMale,
            //               color: Colors.black,
            //               size: media.height * 0.016,
            //             ),
            //             SizedBox(width: media.height * 0.015),
            //             Text(
            //               '$genderFemale ',
            //               style: TextStyle(
            //                 fontSize: media.height * 0.02,
            //               ),
            //             ),
            //             Icon(
            //               MdiIcons.genderFemale,
            //               color: Colors.black,
            //               size: media.height * 0.02,
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //     SizedBox(height: media.height * 0.015),
            //     Row(
            //       children: <Widget>[
            //         Text(
            //           'Generation',
            //           style: TextStyle(
            //             fontSize: media.height * 0.02,
            //             color: Colors.black54,
            //           ),
            //         ),
            //         SizedBox(width: media.height * 0.010),
            //         Text(
            //           '$gen',
            //           style: TextStyle(
            //             fontSize: media.height * 0.02,
            //           ),
            //         ),
            //       ],
            //     ),
            //     SizedBox(height: media.height * 0.015),
            //     Row(
            //       children: <Widget>[
            //         Text(
            //           'Starter',
            //           style: TextStyle(
            //             fontSize: media.height * 0.02,
            //             color: Colors.black54,
            //           ),
            //         ),
            //         SizedBox(width: media.height * 0.040),
            //         Text(
            //           '$starter',
            //           style: TextStyle(
            //             fontSize: media.height * 0.02,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            SizedBox(height: media.height * 0.022),
            Text(
              'Abilities',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: media.height * 0.03,
              ),
            ),
            SizedBox(height: media.height * 0.012),
            Text(
              'Normal',
              style: TextStyle(
                fontSize: media.height * 0.02,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: media.height * 0.002),
            Column(
              children: [_normalAbilities()],
            ),
            SizedBox(height: media.height * 0.020),
            Text(
              'Hidden',
              style: TextStyle(
                fontSize: media.height * 0.02,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: media.height * 0.002),
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
    var media = MediaQuery.of(context).size;

    return GradientCard(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(media.height * 0.060),
        ),
      ),
      gradient: gradientType,
      shadowColor: Gradients.cosmicFusion.colors.last.withOpacity(0.25),
      elevation: media.height * 0.008,
      child: Container(
        height: media.height * 0.030, // 30,
        width: media.height * 0.110, // 110,
        child: Center(
          child: Text(
            ability,
            style: TextStyle(
              color: Colors.white,
              fontSize: media.height * 0.015, // 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
