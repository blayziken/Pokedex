import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_search/Screens/detail.dart';

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
      duration: Duration(seconds: 7),
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
            padding: EdgeInsets.all(media.height * 0.020),
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
                        padding: EdgeInsets.only(top: media.height * 0.110),
                        child: Text(
                          'What Pokemon\nare you looking for?',
                          style: TextStyle(
                            fontSize: media.height * 0.045, // 35.0,
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
                            height: media.height * 0.060, // 50,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: TextField(
                                style: TextStyle(
                                  fontSize: media.height * 0.02, // 20.0,
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
                                    horizontal: media.height * 0.020, // 20,
                                    vertical: media.height * 0.016, // 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: media.height * 0.06),
                          InkWell(
                            child: Container(
                              width: media.width * 0.35,
                              height: media.height * 0.060, // 52.0,
                              decoration: BoxDecoration(
                                color: Colors.black, // lightGreen[700],
                                borderRadius: BorderRadius.circular(30),
                              ),

                              child: Center(
                                child: Text(
                                  ' GO 🚀',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: media.height * 0.030, // 30.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              if (searchName == null) {
                                return showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                          title: Text(
                                            '🙃',
                                            style: TextStyle(
                                              fontSize: media.height * 0.025, // 25,
                                            ),
                                          ),
                                          content: Text(
                                            'Enter an input',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          actions: <Widget>[
                                            InkWell(
                                              child: Text(
                                                'Ok',
                                                style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: media.height * 0.020,
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.pop(context);
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
                                  height: media.height * 0.050, // 50,
                                  width: media.height * 0.050, // 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('images/unnamed.png'),
                                    fit: BoxFit.fill,
                                  )),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: media.height * 0.010, // 10,
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
                                fontSize: media.height * 0.015, // 15,
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
