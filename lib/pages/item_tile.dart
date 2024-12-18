import 'package:flutter/material.dart';
import 'package:shopping_app/buttons/add_to_cart.dart';
import 'package:shopping_app/models/catalog.dart';

class ItemTile extends StatelessWidget {
  final Item item;

  const ItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      height: 130,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 246, 246),
                  borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.all(10),
              //color: const Color.fromARGB(255, 246, 246, 246),
              padding: const EdgeInsets.all(10),
              height: 100,
              width: 120,
              child: Image.network(
                item.image,
                color: const Color.fromARGB(255, 246, 246, 246),
                colorBlendMode: BlendMode.darken,
              )),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item.desc, maxLines: 3, // Limit text to 3 lines
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontFamily: 'Poppins', fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(
                width: 70,
                height: 30,
              ),
              Text(
                '\$${item.price.toString()}',
                style: const TextStyle(
                    color: Color.fromARGB(255, 34, 20, 66),
                    fontWeight: FontWeight.bold),
              ),
              AddToCart(item: item),
            ],
          )
        ],
      ),
    );
  }
}
