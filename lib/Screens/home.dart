import 'package:flutter/material.dart';
import 'package:poke_search/Screens/search.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';

//  Function calculate() {
//    var i = 0;
//    while (i<10) {
//      print(i);
//      i++;
//    }
//    return;
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/search',
                  );
                },
                child: Container(
//                height: 30,
//                width: 50,
                  color: Colors.red,
                  child: Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/grid-shit',
                  );
                },
                child: Container(
//                height: 30,
//                width: 50,
                  color: Colors.green,
                  child: Text(
                    'Test',
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/generation-1',
                  );
                },
                child: Container(
//                height: 30,
//                width: 50,
                  color: Colors.green,
                  child: Text(
                    'Run',
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
