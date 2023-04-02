import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0x33d9d9d9)),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xffffd864),
          leading: const Icon(Icons.menu, color: Colors.black),
          title: const Text("메추리", style: TextStyle(color: Colors.black)),
          actions: [Image.asset("logo.png")],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 0,
          childAspectRatio: 1 / 1,
          children: <Widget>[
            Card(
              color: Colors.white,
              margin: const EdgeInsets.fromLTRB(20, 20, 10, 10),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )
            ),
            Card(
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(10, 20, 20, 10),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )
            ),
            Card(
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )
            ),
            Card(
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )
            ),
            Card(
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )
            ),
            Card(
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )
            ),
          ],
        ),
      )
    );
  }
}
