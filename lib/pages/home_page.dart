import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/models/catalog.dart';
//import 'package:shopping_app/pages/home_categories.dart';
import 'package:shopping_app/pages/item_tile.dart';
import 'package:shopping_app/pages/search_bar.dart';
import 'package:shopping_app/utilities/fetch_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://fakestoreapi.com/products/";

  late FetchData ftObj;

  @override
  void initState() {
    super.initState();
    ftObj = FetchData(url: url);
    getData();
  }

  getData() async {
    // await Future.delayed(const Duration(seconds: 5));
    await ftObj.loadData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 246, 246),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.bars),
        ),
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
        title: const Text(
          "Hi, Rishabh",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.cart),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const SearchBAR(),
            const SizedBox(height: 30),
            //const MiddleBarCategories(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "Available Items",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            // Wrap ListView.builder with Expanded
            Expanded(
              child: (Catalog.items.isNotEmpty)
                  ? ListView.builder(
                      itemCount: Catalog.items.length,
                      itemBuilder: (context, index) =>
                          ItemTile(item: Catalog.items[index]),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
