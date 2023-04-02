import 'package:flutter/material.dart';

class RandomScreen extends StatelessWidget {
  const RandomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "RandomScreen",
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffffd864),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ),
            title: const Text("랜덤", style: TextStyle(color: Colors.black)),
          ),
        ));
  }
}
