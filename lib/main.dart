import 'package:flutter/material.dart';
import 'package:mechulee/classificationScreen.dart';
import 'package:mechulee/costScreen.dart';
import 'package:mechulee/preferenceScreen.dart';
import 'package:mechulee/restrictionsScreen.dart';
import 'package:mechulee/situationScreen.dart';
import 'menuResult.dart';

// 태섭이의 첫 브랜치

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MeChuLee",
        home: Scaffold(
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
                onPressed: () {},
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
                MyCard("식단 제약", "편식 ㄱㄱ", "assets/salad.png", 0),
                MyCard("랜덤", "운세를 보라", "assets/shuffle.png", 1),
                MyCard("개인 선호도", "뭐가 좋니?", "assets/like.png", 2),
                MyCard("개인 상황", "렛츠고 피크닉", "assets/sun.png", 3),
                MyCard("음식 분류", "한식 중식 일식?", "assets/dish.png", 4),
              ],
            ),
          ),
        ));
  }
}

class MyCard extends StatelessWidget {
  final String title;
  final String content;
  final String img;
  final int idx;
  final statefulScreenList = <StatefulWidget>[
    const CostScreen(),
  ];
  // stateful과 stateless를 분리

  final statelessScreenList = <StatelessWidget>[
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
      home: InkWell(
          onTap: () {
            if(title == "비용"){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => statefulScreenList[idx]));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => statelessScreenList[idx]));

            }
          },
          child: Card(
            color: Colors.white,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
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
                      )),
                  SizedBox(
                    width: double.infinity,
                    child: Text(content,
                        style: const TextStyle(
                          fontSize: 12,
                        )),
                  ),
                  Flexible(fit: FlexFit.tight, child: Image.asset(img))
                ],
              ),
            ),
          )),
    );
  }
}
