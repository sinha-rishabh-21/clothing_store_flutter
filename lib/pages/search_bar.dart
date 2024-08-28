import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBAR extends StatelessWidget {
  const SearchBAR({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'find your style!',
          hintStyle: const TextStyle(color: Color.fromARGB(255, 216, 216, 216)),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          suffixIcon: IconButton(
            icon: const Icon(
              CupertinoIcons.search,
              size: 25,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
