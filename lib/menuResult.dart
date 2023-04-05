import 'package:flutter/material.dart';

class MenuResultScreen extends StatelessWidget {
  String title;

  MenuResultScreen(this.title, {Key? key}) : super(key: key);

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
        body: Column(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_left,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        width: 100,
                        height: 300,
                        child: Card(
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset("assets/foodExample.png"),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_right,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Flexible(
              flex: 1,
              child: Text(
                "김치찌개",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    iconSize: 70,
                    icon: Image.asset(
                      "assets/restaurantIcon.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Text("식당 찾기",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  //@TODO 결정하기 기능
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xffffd864),
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "결정하기",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
