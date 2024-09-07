import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/core/store.dart';
//import 'package:shopping_app/pages/home_categories.dart';
import 'package:shopping_app/pages/item_tile.dart';
import 'package:shopping_app/pages/search_bar.dart';
import 'package:shopping_app/utilities/fetch_data.dart';
import 'package:shopping_app/utilities/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Yaha ka URL change krna pad skta hai barr barr due to dynamic IP addressing
  final url = "http://192.168.84.88:8002/products";
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
    final MyStore store =
        VxState.store as MyStore; //this line is important to accesss store
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 246, 246),
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     Scaffold.of(context).openDrawer();
        //   },
        //   icon: const Icon(CupertinoIcons.bars),
        // ),
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
        title: const Text(
          "Hi, Rishabh",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.cart),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.cartRoute);
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            "Home".text.xl2.make(),
            "Settings".text.xl2.make(),
            "Help".text.xl2.make()
          ],
        ).p(10),
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
              child: (store.catalog.items.isNotEmpty)
                  ? ListView.builder(
                      itemCount: store.catalog.items.length,
                      itemBuilder: (context, index) =>
                          ItemTile(item: store.catalog.items[index]),
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
