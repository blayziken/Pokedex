import 'package:flutter/material.dart';
import 'package:poke_search/tests/clipPointArrow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropDownMenu extends StatefulWidget {
  final List<Icon> icons;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color iconColor;
  final ValueChanged<int> onChange;

  const CustomDropDownMenu({
    Key key,
    this.icons,
    this.borderRadius,
    this.backgroundColor = const Color(0xFFF67C0B9),
    this.iconColor = Colors.purpleAccent,
    this.onChange,
  }) : super(key: key);
  @override
  _CustomDropDownMenuState createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu>
    with SingleTickerProviderStateMixin {
  GlobalKey _key;
  bool isMenuOpen = false;
  Offset buttonPosition;
  Size buttonSize;
  OverlayEntry _overlayEntry;
  BorderRadius _borderRadius;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _borderRadius = widget.borderRadius ?? BorderRadius.circular(4);
    _key = LabeledGlobalKey("button_icon");
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  findButton() {
    RenderBox renderBox = _key.currentContext.findRenderObject();
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  void closeMenu() {
    setState(() {
      _overlayEntry.remove();
      _animationController.reverse();
      isMenuOpen = !isMenuOpen;
    });
  }

  void openMenu() {
    findButton();
    _animationController.forward();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context).insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    // MAIN OPEN/CLOSE BUTTON
    return Container(
      key: _key,
      decoration: BoxDecoration(
        color: Color(0xFFF5C6373), //greyish
//        color: Colors.lightGreen[800],
        borderRadius: _borderRadius,
      ),
      child: IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animationController,
        ),
        color: Colors.white,
        onPressed: () {
          if (isMenuOpen) {
            closeMenu();
          } else {
            openMenu();
          }
        },
      ),
    );
  }

  OverlayEntry _overlayEntryBuilder() {
    //
    Widget _allRomanNavigation() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          romanNavigation(
            assetImageString: 'images/looks_one-24px.svg',
            onTap: () {
              Navigator.pushNamed(context, '/generation-1');
              closeMenu();
            },
          ),
          romanNavigation(
            assetImageString: 'images/looks_two-24px.svg',
            onTap: () {
              Navigator.pushNamed(context, '/generation-II');
              closeMenu();
            },
          ),
          romanNavigation(
            assetImageString: 'images/looks_3-24px.svg',
            onTap: () {
              Navigator.pushNamed(context, '/generation-III');
              closeMenu();
            },
          ),
          romanNavigation(
            assetImageString: 'images/looks_4-24px.svg',
            onTap: () {
              Navigator.pushNamed(context, '/generation-IV');
              closeMenu();
            },
          ),
          romanNavigation(
            assetImageString: 'images/looks_5-24px.svg',
            onTap: () {
              Navigator.pushNamed(context, '/generation-V');
              closeMenu();
            },
          ),
          romanNavigation(
            assetImageString: 'images/looks_6-24px.svg',
            onTap: () {
              Navigator.pushNamed(context, '/generation-VI');
              closeMenu();
            },
          ),
        ],
      );
    }

    return OverlayEntry(
      builder: (context) {
        return Positioned(
            top: buttonPosition.dy,
            left: 40,
            width: buttonSize.width * 7,
            child: Material(
                color: Colors.transparent,
                child: Stack(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Row(
                          children: [
                            Container(
//                    height: widget.icons.length * buttonSize.height,
                              height: 50,
                              decoration: BoxDecoration(
//                              color: widget.backgroundColor,
//                                  color: Colors.lightGreen[300],
//                                color: Colors.black26,
                                borderRadius: _borderRadius,
                              ),
                              child: Theme(
                                data: ThemeData(
                                  iconTheme: IconThemeData(
//                                    color: widget.iconColor,
                                    color: Colors.black,
                                  ),
                                ),
                                child: _allRomanNavigation(),
                              ),
                            ),
                            ClipPointArrow(),
                          ],
                        )),
                  ],
                )));
      },
    );
  }
}

class romanNavigation extends StatelessWidget {
  Function onTap;
  String assetImageString;
  romanNavigation({this.onTap, this.assetImageString});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 60,
        width: 50,
        child: SvgPicture.asset(
          assetImageString,
          color: Colors.lightGreen[700],
//                                              color: Colors.transparent,
        ),
      ),
      onTap: onTap,
    );
  }
}

class IconFullDetails extends StatelessWidget {
  Icon iconIndex;
  Function onTapFunction;
  IconFullDetails({
    @required this.buttonSize,
    @required this.widget,
    this.iconIndex,
    this.onTapFunction,
  });

  final Size buttonSize;
  final CustomDropDownMenu widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        width: buttonSize.width,
        height: buttonSize.height,
        child: iconIndex,
      ),
    );
  }
}

class CustomDropDownButton extends StatefulWidget {
  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 20, right: 20.0),
        child: Align(
          alignment: Alignment.topRight,
          child: CustomDropDownMenu(),
        ),
      ),
    );
  }
}
