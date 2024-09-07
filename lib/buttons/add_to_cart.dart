import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/core/mutations.dart';
import 'package:shopping_app/core/store.dart';
import 'package:shopping_app/models/cart_model.dart';
import 'package:shopping_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context,
        on: [AddMutation, RemoveMutation]); //takes list of mutations

    //Coverting Product item from catalog item
    final Prod prod = Prod(id: item.id, title: item.title, price: item.price);

    // final MyStore store = VxState.store as MyStore;
    // bool isInCart = store.cart.products.contains(prod);

    //Another way of writing the same above two lines
    final CartCatalog cart = (VxState.store as MyStore).cart;
    bool isInCart = cart.products.contains(prod);

    return (!isInCart)
        ? IconButton(
            icon: const Icon(
              CupertinoIcons.cart_badge_plus,
            ),
            onPressed: () {
              AddMutation(id: item.id);
            })
        : const Icon(Icons.check).p(12);
  }
}
