import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ProductsScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(
          CupertinoIcons.back,
        ),
        backgroundColor: Colors.blue,
        title: const Text(
          "Figma",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            const Text(
              "Welcome to Figma",
              style: TextStyle(
                fontSize: 40,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: username,
              decoration: const InputDecoration(
                hintText: "Enter Username",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: password,
              decoration: const InputDecoration(
                hintText: "Enter Password",
              ),
            ),
             const SizedBox(
               height: 18,
             ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed:(){
                      Navigator.pop(context);
                      Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => ProductsScreen(username: username.text)
                          ),
                      );
                    },
                    child: const Text(
                        "Login",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                ),
              ],
            ),

          ],

        ),

      ),

    );
  }
}
