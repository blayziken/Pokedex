import 'package:flutter/material.dart';

class GenerationsChoose extends StatefulWidget {
  @override
  _GenerationsChooseState createState() => _GenerationsChooseState();
}

class _GenerationsChooseState extends State<GenerationsChoose> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: media.height,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/generation-1',
                  );
                },
                child: Container(
                  color: Colors.green,
                  child: Text(
                    'Generation 1',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/generation-II',
                  );
                },
                child: Container(
                  color: Colors.green,
                  child: Text(
                    'Generation II',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/generation-III',
                  );
                },
                child: Container(
                  color: Colors.green,
                  child: Text(
                    'Generation III',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/generation-IV',
                  );
                },
                child: Container(
                  color: Colors.green,
                  child: Text(
                    'Generation IV',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/generation-V',
                  );
                },
                child: Container(
                  color: Colors.green,
                  child: Text(
                    'Generation V',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/generation-VI',
                  );
                },
                child: Container(
                  color: Colors.green,
                  child: Text(
                    'Generation VI',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
