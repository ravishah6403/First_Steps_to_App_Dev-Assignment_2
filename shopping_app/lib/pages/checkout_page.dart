import 'package:flutter/material.dart';
import 'package:shopping_app/pages/intro_page.dart';
import 'package:shopping_app/widgets/checkout_item.dart';
import '../data/cart_data.dart';

class CheckoutPage extends StatelessWidget {
  final String total = getTotal().toStringAsFixed(2);
  CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Lato'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_rounded)),
            title: const Text("Checkout",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          body: Column(children: [
            SizedBox(
              height: 600,
              child: ListView.separated(
                  shrinkWrap: false,
                  itemBuilder: (context, index) {
                    return CheckoutItem(
                        name: cartItems[index].item.name,
                        pricePerKg: cartItems[index].item.pricePerKg,
                        pathToImg: cartItems[index].item.pathToImg,
                        qty: cartItems[index].qty);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: cartItems.length),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 150,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total:',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$$total',
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const IntroPage()),
                              (route) => false),
                          child: Container(
                            width: 160,
                            height: 60,
                            margin: const EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                color: const Color(0xFFF4F4F9),
                                borderRadius: BorderRadius.circular(60),
                                border: Border.all(
                                    color: const Color(0xFF8E9090), width: 2)),
                            child: const Center(
                                child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xFF8E9090)),
                            )),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const IntroPage()),
                              (route) => false),
                          child: Container(
                            width: 160,
                            height: 60,
                            margin: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                                color: const Color(0xFF1EAB53),
                                borderRadius: BorderRadius.circular(60)),
                            child: const Center(
                                child: Text(
                              'Next',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                          ),
                        )
                      ],
                    )
                  ]),
                ),
              ],
            )
          ])),
    );
  }
}
