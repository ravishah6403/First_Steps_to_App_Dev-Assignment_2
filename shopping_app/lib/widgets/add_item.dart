// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shopping_app/data/cart_data.dart';

class AddItem extends StatefulWidget {
  final int ID;
  final String name;
  final double pricePerKg;
  final String pathToImg;
  const AddItem(
      {super.key,
      required this.ID,
      required this.name,
      required this.pathToImg,
      required this.pricePerKg});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFF1EAB53),
      child: SizedBox(
          height: 50,
          width: quantity == 0 ? 55 : 115,
          child: quantity == 0
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                      updateCart(widget.ID, widget.name, widget.pricePerKg,
                          widget.pathToImg, quantity);
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            quantity--;
                            updateCart(widget.ID, widget.name,
                                widget.pricePerKg, widget.pathToImg, quantity);
                          });
                        },
                        icon: const Icon(Icons.remove, color: Colors.white)),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                            updateCart(widget.ID, widget.name,
                                widget.pricePerKg, widget.pathToImg, quantity);
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ))
                  ],
                )),
    );
  }
}
