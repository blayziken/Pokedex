import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:poke_search/Screens/search.dart';

class NoInternet extends StatelessWidget {
  static const routeName = '/no-internet';

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: media.height,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Container(
                height: media.height * 0.150,
                width: media.height * 0.150,
                decoration: BoxDecoration(
                  // color: Colors.brown,
                  image: DecorationImage(
                    image: AssetImage("images/pikachu.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: media.height * 0.05),
              Text(
                'Oops!',
                style: TextStyle(fontSize: media.height * 0.055, color: Colors.red, fontWeight: FontWeight.bold, letterSpacing: 1),
              ),
              SizedBox(height: media.height * 0.010),
              Text(
                'Check your internet connection. 😟',
                style: TextStyle(fontSize: media.height * 0.025),
              ),
              // SizedBox(height: media.height * 0.020),
              Spacer(),
              InkWell(
                child: Container(
                  height: media.height * 0.060,
                  width: media.height * 0.17,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      'Try Again ?',
                      style: TextStyle(color: Colors.white, fontSize: media.height * 0.03, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Search(),
                    ),
                  );
                },
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
