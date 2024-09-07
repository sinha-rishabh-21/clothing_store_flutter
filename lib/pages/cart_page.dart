import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/models/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final num totalPrice = CartCatalog.getTotalPrice();
  @override
  Widget build(BuildContext context) {
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
                //Isko change krna hai taaki cart items dikh ske
                itemCount: CartCatalog.products.length,
                itemBuilder: (context, index) => ListTile(
                      leading: const Icon(Icons.done),
                      title: CartCatalog.products[index].title.text.make(),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            CartCatalog.removeById(
                                id: CartCatalog.products[index].id);
                          });
                        },
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
