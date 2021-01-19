import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
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
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

        //Init Floating Action Bubble
        floatingActionButton: FloatingActionBubble(
          // Menu items
          items: <Bubble>[
            // Floating action menu item
            Bubble(
              title: "Settings",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.settings,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                _animationController.reverse();
              },
            ),
            // Floating action menu item
            Bubble(
              title: "Profile",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.people,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                _animationController.reverse();
              },
            ),
            //Floating action menu item
            Bubble(
              title: "Home",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.home,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
//                Navigator.push(
//                    context,
//                    new MaterialPageRoute(
//                        builder: (BuildContext context) => Homepage()));
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
