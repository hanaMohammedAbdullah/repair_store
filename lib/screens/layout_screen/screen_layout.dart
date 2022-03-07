// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:test_stack_listview_transform/screens/favorite.dart';
import 'package:test_stack_listview_transform/screens/notifications.dart';
import 'package:test_stack_listview_transform/screens/rearby.dart';
import 'package:test_stack_listview_transform/screens/screen_home/home.dart';
import '../../models/Icon_model.dart';
import 'customdrawer.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  /// some constant value that we use mostly

  final Color _iconColor = Colors.white;
  final double  _iconSize = 33;
  final Color  _themeColor = Color(0xFF0E1558);

  /// for changing layoout body and bottom navigation bar state
  var _current_index = 0;

  ///

  List<Widget> screen = [
    /// the screen we have 
    Home(),
    Favorite(),
    NearBy(),
    Notifications(),
  ];

  List<CustomIcon> icons = [
    // the bottom action to adding home huch you want or delete it 
    CustomIcon(0, "home", Icons.home),
    CustomIcon(1, "favorite", Icons.favorite),
    CustomIcon(2, "nearby", Icons.blur_circular),
    CustomIcon(3, "notification", Icons.notification_add_outlined),
  ];

  double _x = 0; // this is the value that we will change 
  late double screenWidth ;// late is a build in function used for flutter use if you create a var and want to assign value after for null safity
  late double screenHeight ;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Transform.translate(
          offset: Offset(_x, 0),
          child: Container(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    height: screenHeight * (8 / 100),
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: _themeColor,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(15)),
                    ),
                    child: getUpBar(),
                  ),
                ),
                Positioned(
                  top: screenHeight * (8 / 100),
                  child: Container(
                    height: screenHeight * (84 / 100),
                    width: screenWidth,
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

  Widget getUpBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
      children: [
      IconButton(
        onPressed: () {
          
          setState(() {
            if (_x == 0) {
            _x = (screenWidth / 2);
          } else {
            _x = 0;
          }
          });
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
      height: screenHeight * (8 / 100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: _themeColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: icons.map((icon) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (_current_index == icon.id)
                  ? popedIcon(icon)
                  : bottomBarIcon(icon),
              bottomBarIconlabel(icon.label),
            ],
          );
        }).toList(),
      ),
    );
  }

  Padding bottomBarIconlabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
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
          bottom: 10,
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
