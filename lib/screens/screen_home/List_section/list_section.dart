// ignore_for_file: must_be_immutable, invalid_required_positional_param

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test_stack_listview_transform/models/Craftsman_model.dart';
import 'package:test_stack_listview_transform/models/craftsman_list.dart';

import 'craftsman_card.dart';

class ListSection extends StatelessWidget {
  ListSection(@required this.getItem, {Key? key}) : super(key: key);

  late GetItem getItem;

  @override
  Widget build(BuildContext context) {
    List<Craftsman> craftsmanList = CraftsmanListInMemory().getItems(getItem);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sectionTitle(getItem),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(30.0, 10.0),
                    alignment: Alignment.bottomRight,
                  ),
                  onPressed: () {},
                  child: const Text(
                    "More",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 130,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  CraftsmanCard(craftsmanList[index]),
              itemCount: craftsmanList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(getItem) {
    var title = "";
    switch (getItem) {
      case GetItem.byBestOfMonth:
        title = "Best Of Month";
        break;
      case GetItem.byLatest:
        title = "Latest";
        break;
      case GetItem.byFeatured:
        title = "Featured";
        break;
      default:
        title = "All";
    }
    return Text(
      title,
      style: sectionTitleStyle(),
    );
  }
}

TextStyle sectionTitleStyle() {
  return const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}
