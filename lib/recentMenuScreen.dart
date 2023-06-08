import 'package:flutter/material.dart';
import 'package:mechulee/recommender.dart';

import 'database/dbHelper.dart';
import 'database/record.dart';

class RecentMenuScreen extends StatefulWidget {
  @override
  RecentMenuScreenState createState() => RecentMenuScreenState();

  const RecentMenuScreen({Key? key}) : super(key: key);
}

class RecentMenuScreenState extends State<RecentMenuScreen> {
  var recentMenuList = [];

  @override
  void initState() {
    super.initState();

    var recommender = Recommender();

    DBHelper dbHelper = DBHelper();
    dbHelper.getAllRecord().then((value) => value.forEach((element) {
      recentMenuList.add([element.date, recommender.menuList[element.menuId - 1]['name']]);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "RecentMenuScreen",
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
          title: const Text("최근 먹은 기록", style: TextStyle(color: Colors.black)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          //child: GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)
          child: GridView.count(
            crossAxisCount: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 5 / 1,
            children: [
              RecentMenuCard("2023/06/08", "김치찌개")
            ],
          ),
        ),
      ),
    );
  }
}

class RecentMenuCard extends StatelessWidget {
  // 카드 내부 내용
  final String title;
  final String content;

  const RecentMenuCard(this.title, this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Card(
        color: Colors.white,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  //@TODO 최근 먹은 기록 삭제
                },
                icon: const Icon(Icons.delete),
              )
            ],
          ),
        ),
      ),
    );
  }
}
