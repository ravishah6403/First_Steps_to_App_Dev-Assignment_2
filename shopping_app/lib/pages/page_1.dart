import 'package:flutter/material.dart';
import 'package:shopping_app/data/cart_data.dart';
import 'package:shopping_app/pages/intro_page.dart';
import 'package:shopping_app/pages/page_2.dart';
import '../widgets/item_card.dart';
import '../data/example_data.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
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
              title: const Text("Vegetables",
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
                    itemCount: vegetables.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      updateCart(
                          vegetables[index].ID,
                          vegetables[index].name,
                          vegetables[index].pricePerKg,
                          vegetables[index].pathToImg,
                          0);
                      return ItemCard(
                          ID: vegetables[index].ID,
                          name: vegetables[index].name,
                          pricePerKg: vegetables[index].pricePerKg,
                          pathToImg: vegetables[index].pathToImg);
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
                              builder: (context) => const Page2())),
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
