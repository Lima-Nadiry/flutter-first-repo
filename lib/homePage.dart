import 'package:flutter/material.dart';
import 'package:khanagi_app/Widgets/Image_Grid.dart';
import 'package:khanagi_app/Widgets/homeWidget.dart';
import 'package:khanagi_app/Widgets/category_box.dart';
import 'package:khanagi_app/data.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("  ")),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 226, 227, 228),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.category_outlined)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    //Image(image: AssetImage("images/profile.jpg")),
                    Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 400,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const homeWidget(),
                      const homeWidget(),
                      const homeWidget()
                    ],
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Our Recommendation",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    //Image(image: AssetImage("images/profile.jpg")),
                    Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      categories.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: CategoryBox(
                          isActive: selectedCategoryIndex == index,
                          data: categories[index],
                          onTap: () {
                            setState(() {
                              selectedCategoryIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const ImageGrid(),
              ],
            ),
          ),
        ));
  }
}
