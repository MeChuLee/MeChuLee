import 'package:flutter/material.dart';

class MenuResultScreen extends StatelessWidget {
  String title;

  MenuResultScreen(this.title , {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MenuResultScreen",
        home: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: const Color(0xffffd864),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ),
            title: Text(title, style: const TextStyle(color: Colors.black)),
          ),
        )
    );
  }
}
