// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:test_stack_listview_transform/icons/instagram_icons.dart';
import 'package:test_stack_listview_transform/icons/right_sign_icons.dart';
import 'package:test_stack_listview_transform/icons/snap_chat_icons.dart';
import 'package:test_stack_listview_transform/models/Craftsman_model.dart';

import '../screen_layout.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  Profile(@required this.craftsman, {Key? key}) : super(key: key);
  late Craftsman craftsman;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLiked = false;
  Color _themeColor = Color(0xFF0E1558);
  int _starIndex = -1;

  double width = 0.0;
  double height = 0.0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          color: Colors.white,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                height: height * (38 / 100),
                color: Colors.white,
                width: width,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0, 1),
                          blurRadius: 7,
                        )
                      ]),
                      child: Image.asset(
                        'assets/images/map.JPG',
                        fit: BoxFit.fill,
                        width: width,
                        height: height * (25 / 100),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      left: 20,
                      child: Container(
                        height: 120,
                        width: 120,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[400]!,
                              offset: Offset(0, 1),
                              blurRadius: 7,
                            )
                          ],
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          widget.craftsman.image,
                          height: 150,
                          width: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: _themeColor,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      right: 0,
                      child: Container(
                        height: 26,
                        width: 55,
                        alignment: Alignment.topRight,
                        decoration: BoxDecoration(
                            color: _themeColor,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(20))),
                        child: IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            isLiked = !isLiked;
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.favorite,
                            size: 25,
                            color: (isLiked) ? Colors.red : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 17,
                      right: 55,
                      height: 75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          getStrPattern("ناف", widget.craftsman.name),
                          getStrPattern("زمارى تلفون", widget.craftsman.number),
                          getStrPattern("بيشه", widget.craftsman.job),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 2,
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: getAlbumList(widget.craftsman.album),
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 2,
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: getRating(),
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 2,
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: getCommunicationIcon(),
              ),
              Divider(
                color: Colors.white,
                thickness: 0,
                height: 5,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {},
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: _themeColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(17))),
          alignment: Alignment.center,
          child: Icon(
            Icons.call,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget getStrPattern(String key, String value) {
    TextStyle textStyle = TextStyle(
        color: _themeColor,
        fontFamily: 'IBMPlexSansArabic',
        fontSize: 17,
        fontWeight: FontWeight.bold);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(value, style: textStyle),
        Text("  :  ", style: textStyle),
        Text(key, style: textStyle),
      ],
    );
  }

  Widget getAlbumList(List<String> album) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 8,
            bottom: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ئةلبومى كارهكانم",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _themeColor,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "زياتر ببينه",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[500],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 120,
          width: width,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              onTap: () {},
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23), // if you need this
                ),
                child: Image.asset(
                  widget.craftsman.album[index],
                  fit: BoxFit.fill,
                  // height: 100,
                  // width: 100,
                ),
              ),
            ),
            itemCount: widget.craftsman.album.length,
          ),
        ),
      ],
    );
  }

  Widget getRating() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 7.0),
          child: SizedBox(
            width: width,
            child: Text(
              "دةنكدان",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: _themeColor),
            ),
          ),
        ),
        Center(
          child: SizedBox(
            width: width / 1.7,
            height: 27,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [1, 2, 3, 4, 5].map((t) {
                int currentIndex = t;
                return IconButton(
                  onPressed: () {
                    _starIndex = t;
                    setState(() {});
                  },
                  icon: Icon(
                    currentIndex <= _starIndex
                        ? Icons.star_rounded
                        : Icons.star_outline_rounded,
                    color: _themeColor,
                    size: 30,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: _themeColor,
            ),
            margin: EdgeInsets.only(top: 13),
            height: 40,
            width: 100,
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(
                RightSign.ok_circled,
                color: Colors.white,
              ),
              label: Text(
                "دانكدان",
                style: TextStyle(
                    backgroundColor: _themeColor, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getCommunicationIcon() {
    return Column(
      children: [
        Center(
          child: SizedBox(
            height: 47,
            width: width / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: _themeColor,
                    child: Icon(
                      Icons.facebook_sharp,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 27,
                    backgroundColor: _themeColor,
                    child: Icon(
                      Instagram.instagram_1,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 8,
                          style: BorderStyle.solid,
                          color: _themeColor),
                    ),
                    child: CircleAvatar(
                      radius: 19,
                      backgroundColor: Colors.white,
                      child: Icon(
                        SnapChat.snapchat_ghost,
                        color: _themeColor,
                        size: 28,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 8,
                          style: BorderStyle.solid,
                          color: _themeColor),
                    ),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Image.asset('assets/images/tiktok.jpg'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
