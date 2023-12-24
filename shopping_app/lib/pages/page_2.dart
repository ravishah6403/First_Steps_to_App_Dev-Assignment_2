import 'package:flutter/material.dart';
import 'package:shopping_app/pages/checkout_page.dart';
import 'package:shopping_app/pages/intro_page.dart';
import '../widgets/item_card.dart';
import '../data/example_data.dart';
import '../data/cart_data.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
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
              title: const Text("Fruits",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            body: Column(
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2,
                            childAspectRatio: 0.7),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: fruits.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      updateCart(fruits[index].ID, fruits[index].name,
                          fruits[index].pricePerKg, fruits[index].pathToImg, 0);
                      return ItemCard(
                          ID: fruits[index].ID,
                          name: fruits[index].name,
                          pricePerKg: fruits[index].pricePerKg,
                          pathToImg: fruits[index].pathToImg);
                    }),
                const SizedBox(
                  height: 50,
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
                          style:
                              TextStyle(fontSize: 20, color: Color(0xFF8E9090)),
                        )),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckoutPage())),
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
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                      ),
                    )
                  ],
                )
              ],
            )));
  }
}
