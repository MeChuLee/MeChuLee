import 'package:flutter/material.dart';
import 'package:mechulee/classificationScreen.dart';
import 'package:mechulee/costScreen.dart';
import 'package:mechulee/preferenceScreen.dart';
import 'package:mechulee/profileScreen.dart';
import 'package:mechulee/restrictionsScreen.dart';
import 'package:mechulee/situationScreen.dart';

import 'menuResult.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MeChuLee",
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffffd864),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text("메추리", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Image.asset("assets/logo.png"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1,
          children: <Widget>[
            MyCard("비용", "돈 아껴야 돼~", "assets/money.png", 0),
            MyCard("식단 제약", "편식 ㄱㄱ", "assets/salad.png", 1),
            MyCard("랜덤", "운세를 보라", "assets/shuffle.png", 2),
            MyCard("개인 선호도", "뭐가 좋니?", "assets/like.png", 3),
            MyCard("개인 상황", "렛츠고 피크닉", "assets/sun.png", 4),
            MyCard("음식 분류", "한식 중식 일식?", "assets/dish.png", 5),
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final String title;
  final String content;
  final String img;
  final int idx;
  final screenList = <StatelessWidget>[
    const CostScreen(),
    const RestrictionsScreen(),
    MenuResultScreen("랜덤"),
    const PreferenceScreen(),
    const SituationScreen(),
    const ClassificationScreen(),
  ];

  MyCard(this.title, this.content, this.img, this.idx, {super.key});

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
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screenList[idx]),
            );
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    content,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                Flexible(fit: FlexFit.tight, child: Image.asset(img))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
