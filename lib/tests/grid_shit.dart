import 'package:flutter/material.dart';
import 'package:poke_search/models/pokemon.dart';

class GridShit extends StatefulWidget {
  static const routeName = '/grid-shit';

  @override
  _GridShitState createState() => _GridShitState();
}

class _GridShitState extends State<GridShit> {
//  List<Pokemon> loadedPokemons = [
//    Pokemon(
//      name: 'Charizard',
//      image: 'images/Graphic1.png',
//      type1: 'Fighting',
//      type2: 'Fire',
//      backgroundColor: Colors.red,
//    ),
//    Pokemon(
//      name: 'Squitle',
//      image: '',
//      type1: 'Water',
//      type2: '',
//      backgroundColor: Colors.lightBlue,
//    ),
//    Pokemon(
//      name: 'Bulbasaur',
//      image: '',
//      type1: 'Grass',
//      type2: 'Poison',
//      backgroundColor: Colors.green,
//    ),
//    Pokemon(
//      name: 'Ditto',
//      image: '',
//      type1: 'Poison',
//      type2: '',
//      backgroundColor: Colors.deepPurple,
//    ),
//  ];

  List calculateList = [];

  void calculate() {
    for (var i = 0; i <= 10; i++) {
      print(i);
      calculateList.add(Container(
        color: Colors.red,
        height: 20,
        width: 20,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: media.height,
      width: double.infinity,
      padding: EdgeInsets.all(12),
      child: InkWell(
        onTap: () {
          calculate();
        },
        child: Center(
          child: Text(
            'AAA',
            style: TextStyle(
              fontSize: 59,
            ),
          ),
        ),
      ),

//      GridView.builder(
//          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//              crossAxisCount: 2,
//              mainAxisSpacing: 10,
//              crossAxisSpacing: 10,
//              childAspectRatio: 3 / 2),
//          itemCount: loadedPokemons.length,
//          itemBuilder: (ctx, i) => Item(
//                imageUrl: loadedPokemons[i].image,
//              )),
    ));
//    return Scaffold(
//      body: Container(
//          height: media.height,
//          width: double.infinity,
//          child: GridView.count(
//            crossAxisCount: 2,
////            crossAxisSpacing: 9.0,
////            mainAxisSpacing: 89,
//            children: List.generate(choices.length, (index) {
//              return Center(
//                child: SelectCard(choice: choices[index]),
//              );
//            }),
//          )),
//    );
  }
}

class Item extends StatelessWidget {
  final String imageUrl;

  Item({this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
          ),
        ),
      ),
    );
  }
}

//class Choice {
//  const Choice({this.title, this.icon});
//  final String title;
//  final IconData icon;
//}
//
//const List<Choice> choices = const <Choice>[
//  const Choice(title: 'Home', icon: Icons.home),
//  const Choice(title: 'Contact', icon: Icons.contacts),
//  const Choice(title: 'Map', icon: Icons.home),
//  const Choice(title: 'Phone', icon: Icons.contacts),
//  const Choice(title: 'Camera', icon: Icons.home),
//  const Choice(title: 'Setting', icon: Icons.contacts),
//];
//
//class SelectCard extends StatelessWidget {
//  const SelectCard({Key key, this.choice}) : super(key: key);
//  final Choice choice;
//
//  @override
//  Widget build(BuildContext context) {
//    final TextStyle textStyle = Theme.of(context).textTheme.headline4;
//
//    return Card(
//      color: Colors.orange,
//      child: Center(
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            Expanded(
//                child: Icon(
//              choice.icon,
//              size: 50,
//              color: textStyle.color,
//            )),
//            Text(
//              choice.title,
//              style: textStyle,
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
