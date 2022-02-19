// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_stack_listview_transform/screens/favorite.dart';
import 'package:test_stack_listview_transform/screens/notifications.dart';
import 'package:test_stack_listview_transform/screens/rearby.dart';
import 'package:test_stack_listview_transform/screens/screen_home/home.dart';
import 'customdrawer.dart';

class CustomIcon {
  late int id;
  String label;
  late IconData type;
  CustomIcon(this.id, this.label, this.type);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color get _iconColor => Colors.white;
  double get _iconSize => 33;
  Color get _themeColor => Color(0xFF0E1558);

  /// for changing layoout body and bottom navigation bar state
  var _current_index = 0;

  ///

  List<Widget> screen = [
    Home(),
    Favorite(),
    NearBy(),
    Notifications(),
  ];

  List<CustomIcon> icons = [
    CustomIcon(0, "home", Icons.home),
    CustomIcon(1, "favorite", Icons.favorite),
    CustomIcon(2, "nearby", Icons.blur_circular),
    CustomIcon(3, "notification", Icons.notification_add_outlined),
  ];

  double _x = 0;
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      //
      //
      //
      //
      //
      body: SafeArea(
        child: Transform.translate(
          offset: Offset(_x, 0),
          child: Container(
            height: screenHeight,
            width: screenWidth,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    height: screenHeight * (8 / 100),
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: Color(0xFF0E1558),
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(15)),
                    ),
                    child: getTapBar(),
                  ),
                ),
                Positioned(
                  top: screenHeight * (8 / 100),
                  child: Container(
                    height: screenHeight * (84 / 100),
                    width: screenWidth,
                    color: Colors.white,
                    child: screen[_current_index],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: screenHeight * (8 / 100),
                    width: screenWidth,
                    child: getBottomBar(),
                  ),
                ),
                Positioned(
                  left: -screenWidth / 2,
                  child: Container(
                      color: Colors.white,
                      height: screenHeight,
                      width: screenWidth / 2,
                      child: CustomDrawer()),
                ),
              ],
            ),
          ),
        ),
      ),
      //
      //
      //
      //
      //
    );
  }

  Widget getTapBar() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IconButton(
        onPressed: () {
          if (_x == 0) {
            _x = screenWidth / 2;
          } else {
            _x = 0;
          }
          setState(() {});
        },
        icon: Icon(
          Icons.sort,
          color: _iconColor,
          size: _iconSize,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.location_on,
          size: _iconSize,
          color: _iconColor,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.search,
          size: _iconSize,
          color: _iconColor,
        ),
      ),
    ]);
  }

  Widget getBottomBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: _themeColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: icons.map((icon) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              (_current_index == icon.id)
                  ? popedIcon(icon)
                  : bottomBarIcon(icon),
              bottombottomBarIconlabel(icon.label),
            ],
          );
        }).toList(),
      ),
    );
  }

  Padding bottombottomBarIconlabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Text(text, style: TextStyle(color: _iconColor)),
    );
  }

  Container bottomBarIcon(@required CustomIcon icon) {
    return Container(
      height: 40,
      child: IconButton(
          onPressed: () {
            _current_index = icon.id;
            setState(() {});
          },
          icon: Icon(
            icon.type,
            color: _iconColor,
          )),
    );
  }

  Widget popedIcon(CustomIcon icon) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: SizedBox(
            height: 20,
            width: 55,
          ),
        ),
        Positioned(
          bottom: 20,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle, // be able to add circular border
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              color: _themeColor,
            ),
            child: IconButton(
              iconSize: _iconSize,
              onPressed: () {},
              color: Colors.white,
              icon: Icon(
                icon.type,
                color: _iconColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
