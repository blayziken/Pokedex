import 'package:flutter/material.dart';
import 'package:poke_search/Screens/widgets/customMenu.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class TestTestTest extends StatefulWidget {
  @override
  _TestTestTestState createState() => _TestTestTestState();
}

class _TestTestTestState extends State<TestTestTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
//        color: Colors.teal,
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              // child: SvgPicture.asset("images/looks_3-24px.svg"),
            ),
            Center(
              child: Container(
                child: CustomDropDownButton(),
              ),
            ),
            SizedBox(height: 200),
            Container(
              height: 150,
              width: 150,
              color: Colors.red,
              child: Icon(
                MdiIcons.genderFemale,
                color: Colors.white,
                size: 100,
              ),
            ),
            SizedBox(height: 50),
            GradientCard(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(60),
                ),
              ),
              gradient: Gradients.blush,
              shadowColor: Gradients.cosmicFusion.colors.last.withOpacity(0.25),
              elevation: 8,
              child: Container(
                height: 40,
                width: 100,
                child: Center(
                  child: Text(
                    'Electric',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
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

//import 'package:flutter/material.dart';
//import 'package:poke_search/tests/clipPointArrow.dart';
//
//class CustomDropDownMenu extends StatefulWidget {
//  final List<Icon> icons;
//  final BorderRadius borderRadius;
//  final Color backgroundColor;
//  final Color iconColor;
//  final ValueChanged<int> onChange;
//
//  const CustomDropDownMenu({
//    Key key,
//    this.icons,
//    this.borderRadius,
//    this.backgroundColor = const Color(0xFFF67C0B9),
//    this.iconColor = Colors.purpleAccent,
//    this.onChange,
//  })  : assert(icons != null),
//        super(key: key);
//  @override
//  _CustomDropDownMenuState createState() => _CustomDropDownMenuState();
//}
//
//class _CustomDropDownMenuState extends State<CustomDropDownMenu>
//    with SingleTickerProviderStateMixin {
//  GlobalKey _key;
//  bool isMenuOpen = false;
//  Offset buttonPosition;
//  Size buttonSize;
//  OverlayEntry _overlayEntry;
//  BorderRadius _borderRadius;
//  AnimationController _animationController;
//
//  @override
//  void initState() {
//    _animationController = AnimationController(
//      vsync: this,
//      duration: Duration(milliseconds: 250),
//    );
//    _borderRadius = widget.borderRadius ?? BorderRadius.circular(4);
//    _key = LabeledGlobalKey("button_icon");
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    _animationController.dispose();
//    super.dispose();
//  }
//
//  findButton() {
//    RenderBox renderBox = _key.currentContext.findRenderObject();
//    buttonSize = renderBox.size;
//    buttonPosition = renderBox.localToGlobal(Offset.zero);
//  }
//
//  void closeMenu() {
//    setState(() {
//      _overlayEntry.remove();
//      _animationController.reverse();
//      isMenuOpen = !isMenuOpen;
//    });
//  }
//
//  void openMenu() {
//    findButton();
//    _animationController.forward();
//    _overlayEntry = _overlayEntryBuilder();
//    Overlay.of(context).insert(_overlayEntry);
//    isMenuOpen = !isMenuOpen;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // MAIN OPEN/CLOSE BUTTON
//    return Container(
//      key: _key,
//      decoration: BoxDecoration(
//        color: Color(0xFFF5C6373), //greyish
////        color: Colors.lightGreen[800],
//        borderRadius: _borderRadius,
//      ),
//      child: IconButton(
//        icon: AnimatedIcon(
//          icon: AnimatedIcons.menu_close,
//          progress: _animationController,
//        ),
//        color: Colors.white,
//        onPressed: () {
//          if (isMenuOpen) {
//            closeMenu();
//          } else {
//            openMenu();
//          }
//        },
//      ),
//    );
//  }
//
//  OverlayEntry _overlayEntryBuilder() {
//    return OverlayEntry(
//      builder: (context) {
//        return Positioned(
//            top: buttonPosition.dy,
//            left: 50,
//            width: buttonSize.width * 7,
//            child: Material(
//                color: Colors.transparent,
//                child: Stack(
//                  children: <Widget>[
//                    Padding(
//                        padding: const EdgeInsets.only(top: 0.0),
//                        child: Row(
//                          children: [
//                            Container(
////                    height: widget.icons.length * buttonSize.height,
//                                height: 50,
//                                decoration: BoxDecoration(
////                              color: widget.backgroundColor,
//                                  color: Colors.lightGreen[300],
//                                  borderRadius: _borderRadius,
//                                ),
//                                child: Theme(
//                                    data: ThemeData(
//                                      iconTheme: IconThemeData(
////                                    color: widget.iconColor,
//                                        color: Colors.black,
//                                      ),
//                                    ),
//                                    child: Row(
////                        mainAxisSize: MainAxisSize.min,
//                                      children: [
//                                        IconFullDetails(
//                                            buttonSize: buttonSize,
//                                            widget: widget,
//                                            iconIndex: widget.icons[0],
//                                            onTapFunction: () {
//                                              Navigator.pushNamed(
//                                                  context, '/generation-1');
//                                              closeMenu();
//                                            }),
//                                        IconFullDetails(
//                                            buttonSize: buttonSize,
//                                            widget: widget,
//                                            iconIndex: widget.icons[1],
//                                            onTapFunction: () {
//                                              Navigator.pushNamed(
//                                                  context, '/generation-II');
//                                              closeMenu();
//                                            }),
//                                        IconFullDetails(
//                                            buttonSize: buttonSize,
//                                            widget: widget,
//                                            iconIndex: widget.icons[2],
//                                            onTapFunction: () {
//                                              Navigator.pushNamed(
//                                                  context, '/generation-III');
//                                              closeMenu();
//                                            }),
//                                        IconFullDetails(
//                                            buttonSize: buttonSize,
//                                            widget: widget,
//                                            iconIndex: widget.icons[3],
//                                            onTapFunction: () {
//                                              Navigator.pushNamed(
//                                                  context, '/generation-IV');
//                                              closeMenu();
//                                            }),
//                                        IconFullDetails(
//                                            buttonSize: buttonSize,
//                                            widget: widget,
//                                            iconIndex: widget.icons[4],
//                                            onTapFunction: () {
//                                              Navigator.pushNamed(
//                                                  context, '/generation-V');
//                                              closeMenu();
//                                            }),
//                                        IconFullDetails(
//                                            buttonSize: buttonSize,
//                                            widget: widget,
//                                            iconIndex: widget.icons[5],
//                                            onTapFunction: () {
//                                              Navigator.pushNamed(
//                                                  context, '/generation-VI');
//                                              closeMenu();
//                                            }),
//                                      ],
//                                    ))),
//                            ClipPointArrow(),
//                          ],
//                        )),
//                  ],
//                )));
//      },
//    );
//  }
//}
//
//class IconFullDetails extends StatelessWidget {
//  Icon iconIndex;
//  Function onTapFunction;
//  IconFullDetails({
//    @required this.buttonSize,
//    @required this.widget,
//    this.iconIndex,
//    this.onTapFunction,
//  });
//
//  final Size buttonSize;
//  final CustomDropDownMenu widget;
//
//  @override
//  Widget build(BuildContext context) {
//    return InkWell(
//      onTap: onTapFunction,
//      child: Container(
//        width: buttonSize.width,
//        height: buttonSize.height,
//        child: iconIndex,
//      ),
//    );
//  }
//}
//
//class CustomDropDownButton extends StatefulWidget {
//  @override
//  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
//}
//
//class _CustomDropDownButtonState extends State<CustomDropDownButton> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Padding(
//        padding: EdgeInsets.only(top: 20, right: 20.0),
//        child: Align(
//          alignment: Alignment.topRight,
//          child: CustomDropDownMenu(
//            icons: [
//              Icon(Icons.add),
//              Icon(Icons.search),
//              Icon(Icons.business),
//              Icon(Icons.wifi),
//              Icon(Icons.lock_outline),
//              Icon(Icons.vpn_key),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
