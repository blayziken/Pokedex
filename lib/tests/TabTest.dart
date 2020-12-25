import 'package:flutter/material.dart';

class TabTest extends StatefulWidget {
  TabTest({
    this.pokeHeight,
    this.pokeWeight,
    this.description,
    this.genderMale,
    this.genderFemale,
    this.starter,
    this.gen,
  });

  String pokeHeight;
  String pokeWeight;
  String description;
  double genderMale;
  double genderFemale;
  int gen;
  bool starter;

  @override
  _TabTestState createState() => _TabTestState();
}

class _TabTestState extends State<TabTest> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String pokeHeight = widget.pokeHeight;
    String pokeWeight = widget.pokeWeight;
    String description = widget.description;
    double genderMale = widget.genderMale;
    double genderFemale = widget.genderFemale;
    int gen = widget.gen;
    bool starter = widget.starter;

    return Container(
      margin: EdgeInsets.only(top: 14),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Container(
//                  height: 50,
              width: double.infinity,
//                  color: Colors.,
              child: TabBar(
                indicatorColor: Colors.blue,
                controller: _tabController,
                tabs: <Widget>[
                  Tab(
                      child: Text(
                    'About',
                    style: TextStyle(color: Colors.black54),
                  )),
                  Tab(
                      child: Text(
                    'Base Stats',
                    style: TextStyle(color: Colors.black54),
                  )),
                  Tab(
                      child: Text(
                    'Evolution',
                    style: TextStyle(color: Colors.black54),
                  )),
                  Tab(
                      child: Text(
                    'Moves',
                    style: TextStyle(color: Colors.black54),
                  )),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                About(
                  pokeHeight: pokeHeight,
                  pokeWeight: pokeWeight,
                  description: description,
                  genderMale: genderMale,
                  genderFemale: genderFemale,
                  gen: gen,
                  starter: starter,
                ),
                Test1(),
                Test2(),
                Test3(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class About extends StatelessWidget {
  About({
    this.pokeHeight,
    this.pokeWeight,
    this.description,
    this.genderFemale,
    this.gen,
    this.genderMale,
    this.starter,
  });
  String pokeHeight;
  String pokeWeight;
  String description;
  double genderMale;
  double genderFemale;
  int gen;
  bool starter;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 30.0, top: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              flex: 0,
              child: Center(
                child: Container(
                  height: 80,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, top: 15.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Height',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 16.0,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
//                              '2\' 04"',
                              pokeHeight,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 80.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Weight',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 16.0,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
//                              '15.2 lbs',
                              pokeWeight,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Breeding',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 15),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(width: 36),
                    Text(
                      '$genderMale% $genderFemale%',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    Text(
                      'Generation',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '$gen',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    Text(
                      'Starter',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(width: 40),
                    Text(
                      '$starter',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Test1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 30.0, top: 15.0, bottom: 30.0, right: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 270,
              width: double.infinity,
//              color: Colors.redAccent,
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
//              BaseStatsRow(title: 'Hp', titleValue: '20'),
//              BaseStatsRow(title: 'Attack', titleValue: '20'),
//              BaseStatsRow(title: 'Sp. Atk', titleValue: '20'),
//              BaseStatsRow(title: 'Sp. Def', titleValue: '20'),
//              BaseStatsRow(title: 'Speed', titleValue: '20'),
//              BaseStatsRow(title: 'Total', titleValue: '20'),
                      Text(
                        'Hp',
                        style: TextStyle(fontSize: 16.0, color: Colors.black54),
                      ),
                      Text(
                        'Attack',
                        style: TextStyle(fontSize: 16.0, color: Colors.black54),
                      ),
                      Text(
                        'Defense',
                        style: TextStyle(fontSize: 16.0, color: Colors.black54),
                      ),
                      Text(
                        'Sp. Atk',
                        style: TextStyle(fontSize: 16.0, color: Colors.black54),
                      ),
                      Text(
                        'Sp. Def',
                        style: TextStyle(fontSize: 16.0, color: Colors.black54),
                      ),
                      Text(
                        'Speed',
                        style: TextStyle(fontSize: 16.0, color: Colors.black54),
                      ),
                      Text(
                        'Total',
                        style: TextStyle(fontSize: 16.0, color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BaseStatsRow(
                        value: '20',
                        valueBar: 20.0 * 2,
                      ),
                      BaseStatsRow(value: '40'),
                      BaseStatsRow(value: '70'),
                      BaseStatsRow(value: '20'),
                      BaseStatsRow(value: '90'),
                      BaseStatsRow(value: '20'),
                      BaseStatsRow(value: '100'),
                    ],
                  ),
//              Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  children: <Widget>[
//                    Text('20'),
//                    Text('30'),
//                    Text('20'),
//                    Text('20'),
//                    Text('30'),
//                    Text('20'),
//                    Text('20'),
//                  ]),
//              SizedBox(width: 20),
//              Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  children: <Widget>[
//                    Container(width: 50, color: Colors.black, height: 5),
//                    Text('30'),
//                    Text('20'),
//                    Text('20'),
//                    Text('30'),
//                    Text('20'),
//                    Text('20'),
//                  ]),
                ],
              ),
            ),
            SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Type defenses',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'The effectiveness of each type on Bulbasaur.',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'blah bla blah blah bla blah blah bla blah blah bla blah\n blah bla blahblah bla blah blah bla blah blah bla blah blah bla blah blah bla blah blah bla blah blah bla blah blah bla blah',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BaseStatsRow extends StatelessWidget {
  String value;
  double valueBar;
  BaseStatsRow({this.value, this.valueBar});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          value,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(width: 20),
        Container(width: valueBar, color: Colors.red, height: 5),
      ],
    );
  }
}

//class BaseStatsRow extends StatelessWidget {
//  String title;
//  String titleValue;
//
//  BaseStatsRow({this.title, this.titleValue});
//
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      children: <Widget>[
//        Text(title),
////        SizedBox(width: 70.0),
//        Spacer(),
//        Text(titleValue),
//        Spacer(),
////        SizedBox(width: 30.0),
//        Container(
//          color: Colors.black,
//          width: 50.0,
//          height: 10,
//        ),
//        Spacer(),
////                  Spacer(),
//      ],
//    );
//  }
//}

class Test2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}

class Test3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
    );
  }
}

//Center(
//child: Container(
////                        color: Colors.white,
//height: 170,
//width: 170,
//decoration: BoxDecoration(
//image: DecorationImage(
//image: AssetImage('images/pokeball32.png'),
//fit: BoxFit.fill,
//),
//),
//alignment: Alignment.bottomCenter,
//child: Container(
//height: 650,
//width: 650,
////                          color: Colors.white,
//decoration: BoxDecoration(
////                                color: Colors.teal,
//image: DecorationImage(
//image: NetworkImage(pokePicture),
////                                  AssetImage('images/pikachu.png'),
//fit: BoxFit.fill,
//),
//),
//),
//)),
