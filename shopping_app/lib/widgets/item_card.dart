// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../widgets/add_item.dart';

class ItemCard extends StatelessWidget {
  final int ID;
  final String name;
  final double pricePerKg;
  final String pathToImg;

  const ItemCard(
      {super.key,
      required this.ID,
      required this.name,
      required this.pricePerKg,
      required this.pathToImg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 250,
      decoration: BoxDecoration(
          color: const Color(0xFFF4F4F9),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SizedBox(
            height: 130,
            child: Image(image: AssetImage(pathToImg)),
          ),
          Container(
            width: 190,
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              width: 190,
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                '1kg, \$$pricePerKg',
                style: const TextStyle(
                    color: Color(0xFFBB4D6C),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )),
          AddItem(
            ID: ID,
            name: name,
            pricePerKg: pricePerKg,
            pathToImg: pathToImg,
          ),
        ],
      ),
    );
  }
}
