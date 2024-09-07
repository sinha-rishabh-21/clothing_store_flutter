import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/core/mutations.dart';
import 'package:shopping_app/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final MyStore store = VxState.store as MyStore;
    final num totalPrice = store.cart.getTotalPrice();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 246, 246),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        title: const Text(
          "My Cart",
          style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: store.cart.products.length,
                itemBuilder: (context, index) => ListTile(
                      leading: const Icon(Icons.done),
                      title: store.cart.products[index].title.text.make(),
                      trailing: IconButton(
                        onPressed: () =>
                            RemoveMutation(id: store.cart.products[index].id),
                        icon: const Icon(Icons.remove),
                      ),
                    )),
          ),
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                '\$$totalPrice'.text.xl4.make(),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.blueAccent),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  child: "Buy".text.white.make(),
                ).w(125)
              ],
            ),
          )
        ],
      ).p(20),
    );
  }
}
