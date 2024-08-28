import 'package:flutter/material.dart';

class MiddleBarCategories extends StatelessWidget {
  const MiddleBarCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: Color(0x50B33771), shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "images/shirt.png",
                    height: 40,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("SHIRT")
            ],
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: Color(0x50B33771), shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "images/trousers.png",
                    height: 40,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("TROUSER")
            ],
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: Color(0x50B33771), shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "images/sneakers.png",
                    height: 40,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("SNEAKERS")
            ],
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: Color(0x50B33771), shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "images/accessory.png",
                    height: 40,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("ACCESSORIES")
            ],
          ),
        ],
      ),
    );
  }
}
