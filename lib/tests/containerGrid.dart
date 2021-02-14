import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

class FloatingBubble extends StatefulWidget {
  @override
  _FloatingBubbleState createState() => _FloatingBubbleState();
}

class _FloatingBubbleState extends State<FloatingBubble>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

        //Init Floating Action Bubble
//        floatingActionButton:
        child: FloatingActionBubble(
      // Menu items
      items: <Bubble>[
        // Floating action menu item
        Bubble(
          title: "All Generations",
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.donut_small,
          titleStyle: TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            Navigator.pushNamed(context, '/All-Generation');
            _animationController.reverse();
          },
        ),
        // Floating action menu item
        //Floating action menu item
        Bubble(
          title: "Search",
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.search,
          titleStyle: TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            Navigator.pushNamed(context, '/search');
            _animationController.reverse();
          },
        ),
      ],

      // animation controller
      animation: _animation,

      // On pressed change animation state
      onPress: () => _animationController.isCompleted
          ? _animationController.reverse()
          : _animationController.forward(),

      // Floating Action button Icon color
      iconColor: Colors.blue,

      // Flaoting Action button Icon
      icon: AnimatedIcons.view_list,
    ));
  }
}

//import 'package:floating_action_bubble/floating_bubble.dart';
//import 'package:flutter/material.dart';
//
//
//class MyHomePage extends StatefulWidget {
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage>
//    with SingleTickerProviderStateMixin {
//  Animation<double> _animation;
//  AnimationController _animationController;
//
//  @override
//  void initState() {
//    _animationController = AnimationController(
//      vsync: this,
//      duration: Duration(milliseconds: 260),
//    );
//
//    final curvedAnimation =
//        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
//    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
//
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//
//        //Init Floating Action Bubble
//        floatingActionButton: FloatingActionBubble(
//          // Menu items
//          items: <Bubble>[
//            // Floating action menu item
//            Bubble(
//              title: "Settings",
//              iconColor: Colors.white,
//              bubbleColor: Colors.blue,
//              icon: Icons.settings,
//              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
//              onPress: () {
//                _animationController.reverse();
//              },
//            ),
//            // Floating action menu item
//            Bubble(
//              title: "Profile",
//              iconColor: Colors.white,
//              bubbleColor: Colors.blue,
//              icon: Icons.people,
//              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
//              onPress: () {
//                _animationController.reverse();
//              },
//            ),
//            //Floating action menu item
//            Bubble(
//              title: "Home",
//              iconColor: Colors.white,
//              bubbleColor: Colors.blue,
//              icon: Icons.home,
//              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
//              onPress: () {
////                Navigator.push(
////                    context,
////                    new MaterialPageRoute(
////                        builder: (BuildContext context) => Homepage()));
//                _animationController.reverse();
//              },
//            ),
//          ],
//
//          // animation controller
//          animation: _animation,
//
//          // On pressed change animation state
//          onPress: () => _animationController.isCompleted
//              ? _animationController.reverse()
//              : _animationController.forward(),
//
//          // Floating Action button Icon color
//          iconColor: Colors.blue,
//
//          // Flaoting Action button Icon
//          icon: AnimatedIcons.view_list,
//        ));
//  }
//}
//
//

//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//
//class ContainerGrid extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Container(
//        width: double.infinity,
//        height: 900,
//        color: Colors.grey,
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Container(
//              height: 170,
//              width: 260,
//              color: Colors.red,
//              child: Stack(
//                children: <Widget>[
//                  Positioned(
////                    left: 3.0,
//                    child: Column(
//                      children: <Widget>[
//                        Container(
//                          margin: EdgeInsets.only(left: 20, top: 25),
//                          child: Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Text(
//                                'Charmeleon',
//                                style: TextStyle(
//                                  color: Colors.white,
//                                  fontSize: 25.0,
//                                  fontWeight: FontWeight.bold,
//                                ),
//                              ),
//                              SizedBox(height: 15),
//                              Column(
//                                children: <Widget>[
//                                  pokeType(),
//                                  SizedBox(height: 10),
//                                  pokeType(),
//                                ],
//                              ),
//                            ],
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  Positioned(
//                    right: 1,
//                    top: 45,
//                    child: Container(
//                      height: 120,
//                      width: 140,
//                      decoration: BoxDecoration(
////                          color: Colors.white,
//                          image: DecorationImage(
//                        image: AssetImage('images/pikachu.png'),
//                        fit: BoxFit.cover,
//                      )),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//class pokeType extends StatelessWidget {
//  const pokeType({
//    Key key,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: 30,
//      width: 90,
////                      color: Colors.white,
//      decoration: BoxDecoration(
//        color: Colors.white.withOpacity(0.2),
//        borderRadius: BorderRadius.all(
//          Radius.circular(50.0),
//        ),
//      ),
//      child: Center(
//        child: Text(
//          'type',
//          style: TextStyle(
//            color: Colors.white,
//            fontSize: 18.0,
//            fontWeight: FontWeight.w900,
//          ),
//        ),
//      ),
//    );
//  }
//}
