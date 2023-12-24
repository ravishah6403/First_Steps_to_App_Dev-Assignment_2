import 'package:flutter/material.dart';
import 'package:shopping_app/pages/page_1.dart';
import '../data/cart_data.dart';

void main() {
  runApp(const IntroPage());
}

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Lato'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF1EAB53),
        body: Center(
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            const Image(
                image: AssetImage(
                    'assets/imgs/shopping-bag-with-groceries-isolated.png')),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              width: 380,
              child: Text(
                "Buy Your\nFavourite\nGrocery Items.",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: () => [
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Page1())),
                cartItems.clear()
              ],
              child: Container(
                height: 70,
                width: 380,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: const Color(0xFFF7E552),
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                    child: Row(
                  children: [
                    Text(
                      "Get Started",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(Icons.keyboard_double_arrow_right)
                  ],
                )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
