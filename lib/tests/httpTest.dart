import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void getData() async {
  http.Response response =
      await http.get('https://pokeapi.co/api/v2/pokemon/ditto');
//  print(response.body);

  if (response.statusCode == 200) {
//    String data = response.body;
//    var abcd = jsonDecode(response.body)['abilities'][0]['ability']['name']
    var abcd = jsonDecode(response.body)['name'];
    print(abcd);
    return;
  } else {
    print(response.statusCode);
  }
}

//{
//  abilities
//  [
//    {
//      ability:
//      {
//        name: static, url: 'https://pokeapi.co/api/v2/ability/9/'
//      }, is_hidden: false, slot: 1
//    },
//    {
//      ability:
//      {
//        name: lightning-rod, url: 'https://pokeapi.co/api/v2/ability/31/'
//      }, is_hidden: true, slot: 3
//      }
//   ]
//}

class HttpTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    getData();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Colors.blueAccent,
        child: FlatButton(
          onPressed: () {
            print('Pressed');
            getData();
          },
          child: Text(
            'Pressss',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
