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

//void getData(searchName) async {
//  NetworkAPI networkAPI =
//      NetworkAPI('https://pokeapi.co/api/v2/pokemon/$searchName');
//
//  var pokemonData = await networkAPI.getData();
//
//  Navigator.push(
//    context,
//    MaterialPageRoute(
//      builder: (context) => DetailScreen(
//        result: pokemonData,
//      ),
//    ),
//  );
//}

class _SearchState extends State<Search> {
  String searchName;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: media.height,
            width: double.infinity,
//            decoration: BoxDecoration(
//              image: DecorationImage(
//                image: AssetImage('images/pokeball.png'),
//                fit: BoxFit.cover,
//
//              ),
//            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
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
                Expanded(
                  flex: 2,
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
                        SizedBox(height: 40.0),
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
//                              print(searchName);
                              print('Pressed');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    pokemonName: searchName,
                                  ),
                                ),
                              );
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
                SizedBox(height: 0),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}