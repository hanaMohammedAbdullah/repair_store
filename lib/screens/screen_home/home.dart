// ignore_for_file: file_names , prefer_const_constructors_in_immutables , must_be_immutable

import 'package:flutter/material.dart';
import 'package:test_stack_listview_transform/models/craftsman_list.dart';
import 'List_section/list_section.dart';
import 'image_slider.dart';

//import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  String title = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ImageSlider(),
          ListSection(GetItem.byBestOfMonth),
          CustomDivider(),
          ListSection(GetItem.byLatest),
          CustomDivider(),
          ListSection(GetItem.byFeatured),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 5,
      thickness: 0.8,
      color: Colors.grey[300],
    );
  }
}
