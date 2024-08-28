import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "images/login.jpg",
                fit: BoxFit.fitWidth,
              ),
              const Text(
                "LOGIN",
                style: TextStyle(
                    fontFamily: 'Oswald',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(hintText: "Enter Username"),
                  )),
                  SizedBox(
                    width: 50,
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(hintText: "Enter Password"),
                  )),
                  SizedBox(
                    width: 50,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                // onHover: ,
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
                ),
                child: const Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ));
  }
}
