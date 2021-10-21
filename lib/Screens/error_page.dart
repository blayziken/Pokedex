import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_search/Screens/search.dart';

class ErrorPage extends StatelessWidget {
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
              Spacer(),

              Text(
                'Error',
                style: TextStyle(fontSize: media.height * 0.055, color: Colors.green, fontWeight: FontWeight.bold, letterSpacing: 1),
              ),
              SizedBox(height: media.height * 0.020),
              Text(
                'There\'s no such pokemon',
                style: TextStyle(fontSize: media.height * 0.020),
              ),
              // SizedBox(height: media.height * 0.020),
              Spacer(),
              InkWell(
                child: Container(
                  color: Colors.red,
                  height: media.height * 0.040,
                  width: media.height * 0.070,
                  child: Center(
                    child: Text(
                      'Back',
                      style: TextStyle(color: Colors.white, fontSize: media.height * 0.025),
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
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
