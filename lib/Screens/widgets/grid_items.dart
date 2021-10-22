import 'package:flutter/material.dart';
import 'package:poke_search/Screens/Generations/widgets/PokeTypes.dart';
import '../detail.dart';

class GridItem extends StatelessWidget {
  final String name;
  final String image;
  final Color color;
  final String type1;
  final String type2;
  final String id;

  GridItem({this.name, this.image, this.color, this.type1, this.type2, this.id});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    //
    //Checking if Pokemon Type 2 is empty
    Widget _pokemonTypesPlacement() {
      if (type2 == '') {
        return Column(
          children: <Widget>[
            SizedBox(height: media.height * 0.014),
            pokeType(type: type1),
          ],
        );
      } else {
        return Column(
          children: <Widget>[
            pokeType(type: type1),
            SizedBox(height: media.height * 0.010),
            pokeType(type: type2),
          ],
        );
      }
    }

    return GridTile(
        child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              pokemonName: name,
            ),
          ),
        );
      },
      child: Container(
//        height: 170,
//        width: 5260,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.08), BlendMode.dstATop),
              fit: BoxFit.scaleDown,
              image: AssetImage('images/pokeball.png'),
              alignment: Alignment.bottomRight,
            ),
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(media.height * 0.018),
            ),
          ),
          child: Stack(children: <Widget>[
            Positioned(
              right: 0,
              left: media.height * 0.059,
              top: media.height * 0.020,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: media.height * 0.150,
                  width: media.height * 0.190,
                  // color: Colors.teal,
                  child: Image.network(
                    image,
                    // fit: BoxFit.fitHeight,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
//                    left: 3.0,
                child: Column(
              children: <Widget>[
                Container(
//                    color: Colors.teal,
//                    height: media.height * 0.12,
                    margin: EdgeInsets.only(left: media.height * 0.010, top: media.height * 0.010),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              name, //Charmeleon
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: media.height * 0.025,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: media.height * 0.01),
                              child: Text(
                                id,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: media.height * 0.025,
                                  color: Colors.white54,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: media.height * 0.012),
                        _pokemonTypesPlacement(),
                      ],
                    ))
              ],
            ))
          ])),
    ));
  }
}
