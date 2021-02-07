import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_search/Screens/detail.dart';

//
import 'package:http/http.dart' as http;
import 'package:poke_search/tests/httpTest.dart';
import 'dart:convert';
import '../services/NetworkAPI.dart';

class Search extends StatefulWidget {
  static const routeName = '/search';

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  String searchName;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: media.height,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/starter.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Text(
                          'What Pokemon\nare you looking for?',
                          style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: media.width * 0.6,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextField(
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                              onChanged: (value) {
                                searchName = value;
                              },
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Search Pokemon',
                                prefixIcon: Icon(Icons.search),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            width: media.width * 0.36,
                            height: 52.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              color: Colors.lightGreen[700],
                              splashColor: Colors.black,
                              onPressed: () {
                                print(searchName);
                                print('Pressed');
                                print('--------------------------');
                                if (searchName == null) {
                                  print('NUlllll!!!!!!!!!!!');
                                  return showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                            title: Text(
                                              '🙃',
                                              style: TextStyle(
                                                fontSize: 25,
                                              ),
                                            ),
                                            content: Text(
                                              'No input received!',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text(
                                                  'Try again',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop;
                                                },
                                              )
                                            ],
                                          ));
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        pokemonName: searchName,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Center(
                                child: Text(
                                  ' GO🚀',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Center(
                          child: AnimatedBuilder(
                            animation: animationController,
                            builder: (BuildContext context, widget) {
                              return Transform.rotate(
                                angle: animationController.value * 6.3,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('images/unnamed.png'),
                                    fit: BoxFit.fill,
                                  )),
                                ),
                              );
                            },
//                            child:
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/All-Generation');
                          },
                          child: Center(
                            child: Text(
                              'Check out the full pokedex❗',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
