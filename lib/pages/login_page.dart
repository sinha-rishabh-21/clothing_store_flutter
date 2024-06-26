import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "WELCOME",
              style: TextStyle(color: Colors.blueAccent, fontFamily: 'Oswald'),
            ),
          ),
        ),
        body: Column(
          children: [
            Image.asset(name)
          ],
        ));
  }
}
