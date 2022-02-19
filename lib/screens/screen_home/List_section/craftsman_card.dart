// ignore_for_file: must_be_immutable, invalid_required_positional_param

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test_stack_listview_transform/models/Craftsman_model.dart';

import '../../profile.dart';

class CraftsmanCard extends StatelessWidget {
  CraftsmanCard(@required this.craftsman, {Key? key}) : super(key: key);
  late Craftsman craftsman;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profile(craftsman)),
          );
        },
        child: Card(
          color: Colors.grey[200],
          clipBehavior: Clip.antiAlias,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                fit: BoxFit.fill,
                height: 60,
                width: 112,
                image: AssetImage(craftsman.image),
              ),
              Text(
                craftsman.name.substring(0, craftsman.name.indexOf(' ')),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 13, height: 1.5),
              ),
              Text(
                "${craftsman.number} : تلفون ",
                style: cartTextStyle(),
              ),
              Text(
                "  بيشه : ${craftsman.job}  ",
                style: cartTextStyle(),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle cartTextStyle() {
    return const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 11, height: 1.2);
  }
}
