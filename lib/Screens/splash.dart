import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Splash extends StatefulWidget {
  static const routeName = '/splash';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushNamed(context, '/search');
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: media.height,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/poke_search.png'),
            fit: BoxFit.fill,
          ),
        ),
//         child: Column(
// //          crossAxisAlignment: CrossAxisAlignment.end,
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: CircularProgressIndicator(
//                 backgroundColor: Colors.green,
//               ),
//             ),
//             SizedBox(height: 30),
//           ],
//         ),
      ),
    );
  }
}
