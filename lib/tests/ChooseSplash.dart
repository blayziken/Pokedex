import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseSplash extends StatelessWidget {
  static const routeName = '/choose-splash';
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: media.height,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Graphic4.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 200),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Next2(),
                    ),
                  );
                },
                child: Text(
                  'Poke Search',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Next2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Next3(),
            ),
          );
        },
        child: Container(
          height: media.height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/Graphic15.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

class Next3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Next4(),
            ),
          );
        },
        child: Container(
          height: media.height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/poke_search.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

class Next4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Next5(),
            ),
          );
        },
        child: Container(
          height: media.height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/poke_search1.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

class Next5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Next6(),
            ),
          );
        },
        child: Container(
          height: media.height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/poke_search2.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

class Next6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Next7(),
            ),
          );
        },
        child: Container(
          height: media.height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/poke_search3.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

class Next7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChooseSplash(),
            ),
          );
        },
        child: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}
