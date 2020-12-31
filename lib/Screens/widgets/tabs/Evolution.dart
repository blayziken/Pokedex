import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Evolution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 40.0, top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Evolution Chain',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22.0,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              color: Colors.teal,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 40.0),
                child: Column(
                  children: <Widget>[
                    EvolutionChainRow(
                      name1: 'Pikachu',
                      imageURL1: 'images/pikachu.png',
                    ),
                    SizedBox(height: 40.0),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Column(
//                          children: <Widget>[
//                            Container(
//                              height: 100,
//                              width: 100,
////                        color: Colors.green,
//                              decoration: BoxDecoration(
//                                  image: DecorationImage(
//                                image: AssetImage('images/pikachu.png'),
//                                fit: BoxFit.fill,
//                              )),
//                            ),
//                            SizedBox(height: 10),
//                            Text(
//                              'Pikachu',
//                              style: TextStyle(
//                                fontSize: 20.0,
//                                color: Colors.black54,
//                              ),
//                            ),
//                          ],
//                        ),
//                        Text(
//                          '--->',
//                          style: TextStyle(
//                            fontSize: 25.0,
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                        Column(
//                          children: <Widget>[
//                            Container(
//                              height: 100,
//                              width: 100,
////                        color: Colors.green,
//                              decoration: BoxDecoration(
//                                  image: DecorationImage(
//                                image: AssetImage('images/pikachu.png'),
//                                fit: BoxFit.fill,
//                              )),
//                            ),
//                            SizedBox(height: 10),
//                            Text(
//                              'Pikachu',
//                              style: TextStyle(
//                                fontSize: 20.0,
//                                color: Colors.black54,
//                              ),
//                            ),
//                          ],
//                        ),
//                      ],
//                    ),
//                    EvolutionChainRow(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EvolutionChainRow extends StatelessWidget {
  String name1;
  String imageURL1;

  EvolutionChainRow({this.name1, this.imageURL1});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
//                        color: Colors.green,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(imageURL1),
                fit: BoxFit.fill,
              )),
            ),
            SizedBox(height: 10),
            Text(
              name1,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        Text(
          '--->',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
//                        color: Colors.green,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('images/pikachu.png'),
                fit: BoxFit.fill,
              )),
            ),
            SizedBox(height: 10),
            Text(
              'Pikachu',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
