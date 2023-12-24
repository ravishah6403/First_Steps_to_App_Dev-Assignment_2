import 'package:flutter/material.dart';

class CheckoutItem extends StatelessWidget {
  final String name;
  final double pricePerKg;
  final String pathToImg;
  final int qty;

  const CheckoutItem(
      {super.key,
      required this.name,
      required this.pricePerKg,
      required this.pathToImg,
      required this.qty});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        SizedBox(
          width: 80,
          child: Image(image: AssetImage(pathToImg)),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$$pricePerKg',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFBB4D6C)),
            )
          ],
        ),
        const Spacer(),
        Row(
          children: [
            const Text('X'),
            const SizedBox(
              width: 20,
            ),
            Text(
              qty.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const Spacer(),
        Text('\$${pricePerKg * qty}',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
      ]),
    );
  }
}
