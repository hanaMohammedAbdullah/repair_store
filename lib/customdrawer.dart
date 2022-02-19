// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_stack_listview_transform/icons/snap_chat_icons.dart';

import 'icons/instagram_icons.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: Color(0xFF0E1558),
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * (22 / 100),
          width: MediaQuery.of(context).size.width / 2,
          child: getHeader(),
        ),
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * (23 / 100),
          width: MediaQuery.of(context).size.width / 2,
          child: getBody(),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          color: Colors.white,
          height: MediaQuery.of(context).size.height * (47 / 100),
          width: MediaQuery.of(context).size.width / 2,
          child: getFooter(),
        ),
      ],
    );
  }

  Widget getHeader() {
    Color fontColor = Colors.white;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 85,
          width: 85,
          clipBehavior: Clip.hardEdge,
          child: Image.asset(
            'assets/images/pic.png',
            fit: BoxFit.fill,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.yellow,
          ),
        ),
        Text("ناو: هيمن كامران هيوا", style: TextStyle(color: fontColor)),
        Text("زمارة موبايل : 075044545", style: TextStyle(color: fontColor)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("عراق/هةولير", style: TextStyle(color: fontColor)),
            Icon(Icons.location_on, color: fontColor)
          ],
        )
      ],
    );
  }

  Widget getBody() {
    Color? fontColor = Color(0xFF10185F);
    double marginForIconRight = 6;
    FontWeight bold = FontWeight.bold;
    double _fontSize = 16;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(right: marginForIconRight),
                  child: Icon(Icons.input, color: fontColor)),
              Text(
                "جوونة زوورةوه",
                style: TextStyle(
                    color: fontColor, fontWeight: bold, fontSize: _fontSize),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(right: marginForIconRight),
                  child: Icon(Icons.group, color: fontColor)),
              Text(
                "دةربارى ئيمة",
                style: TextStyle(
                    color: fontColor, fontWeight: bold, fontSize: _fontSize),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(right: marginForIconRight),
                  child: Icon(Icons.feedback, color: fontColor)),
              Text(
                "بةيوةندة كردن بة ئيمه",
                style: TextStyle(
                    color: fontColor, fontWeight: bold, fontSize: _fontSize),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          height: 10,
        ),
      ],
    );
  }

  getFooter() {
    Color iconColor = Color(0xFF10185F);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: iconColor,
          child: Icon(
            Icons.facebook_sharp,
            color: Colors.white,
            size: 40,
          ),
        ),
        CircleAvatar(
          radius: 27,
          backgroundColor: iconColor,
          child: Icon(
            Instagram.instagram_1,
            color: Colors.white,
            size: 40,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                width: 8, style: BorderStyle.solid, color: iconColor),
          ),
          child: CircleAvatar(
            radius: 19,
            backgroundColor: Colors.white,
            child: Icon(
              SnapChat.snapchat_ghost,
              color: iconColor,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
}
