import 'package:flutter/material.dart';
import 'package:mechulee/classificationScreen.dart';
import 'package:mechulee/costScreen.dart';
import 'package:mechulee/preferenceScreen.dart';
import 'package:mechulee/profileScreen.dart';
import 'package:mechulee/restrictionsScreen.dart';
import 'package:mechulee/situationScreen.dart';
import 'menuResult.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'firebaseTest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

// stateful 화면 list
final statefulScreenList = <StatefulWidget>[
  const CostScreen(),
  const RestrictionsScreen(),
  MenuResultScreen("랜덤"),
  const ClassificationScreen(),
];

// stateless 화면 list
final statelessScreenList = <StatelessWidget>[
  const PreferenceScreen(),
  const SituationScreen(),
];


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

/// 메인 화면
/// 역할 : 화면 전환 (6가지 기준 화면, 회원 정보 화면)
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffffd864),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("메추리", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Image.asset("assets/logo.png"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'),
              ),
              accountName: const Text(
                '나는 나야',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: const Text(
                'example1234@naver.com',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onDetailsPressed: () {},
              decoration: const BoxDecoration(
                color: Color(0xffffd864),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              iconColor: const Color(0xffffd864),
              focusColor: const Color(0xffffd864),
              title: const Text('회원 정보'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: const Icon(Icons.attach_money),
              iconColor: const Color(0xffffd864),
              focusColor: const Color(0xffffd864),
              title: const Text('비용 기준 추천'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => statefulScreenList[0],
                  ),
                );
              },
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: const Icon(Icons.sick_outlined),
              iconColor: const Color(0xffffd864),
              focusColor: const Color(0xffffd864),
              title: const Text('식단 제약 기준 추천'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => statelessScreenList[0],
                  ),
                );
              },
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: const Icon(Icons.shuffle),
              iconColor: const Color(0xffffd864),
              focusColor: const Color(0xffffd864),
              title: const Text('랜덤 기준 추천'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => statefulScreenList[1],
                  ),
                );
              },
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: const Icon(Icons.thumb_up),
              iconColor: const Color(0xffffd864),
              focusColor: const Color(0xffffd864),
              title: const Text('개인 선호도 기준 추천'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => statelessScreenList[1],
                  ),
                );
              },
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: const Icon(Icons.brightness_6),
              iconColor: const Color(0xffffd864),
              focusColor: const Color(0xffffd864),
              title: const Text('개인 상황 기준 추천'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => statelessScreenList[2],
                  ),
                );
              },
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: const Icon(Icons.list_alt_outlined),
              iconColor: const Color(0xffffd864),
              focusColor: const Color(0xffffd864),
              title: const Text('음식 분류 기준 추천'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => statelessScreenList[3],
                  ),
                );
              },
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              iconColor: const Color(0xffffd864),
              focusColor: const Color(0xffffd864),
              title: const Text('설정'),
              onTap: () {
                //@TODO 햄버거 설정 버튼 클릭 이벤트
              },
              trailing: const Icon(Icons.navigate_next),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1,
          children: const <Widget>[
            MyCard("비용", "돈 아껴야 돼~", "assets/money.png", 0),
            MyCard("식단 제약", "편식 ㄱㄱ", "assets/salad.png", 1),
            MyCard("랜덤", "운세를 보라", "assets/shuffle.png", 2),
            MyCard("개인 선호도", "뭐가 좋니?", "assets/like.png", 0),
            MyCard("개인 상황", "렛츠고 피크닉", "assets/sun.png", 1),
            MyCard("음식 분류", "한식 중식 일식?", "assets/dish.png", 3),
          ],
        ),
      ),
    );
  }
}

/// 6가지 기준 화면 이동 카드 커스텀 화면
class MyCard extends StatelessWidget {
  // 카드 내부 내용
  final String title;
  final String content;
  final String img;
  final int idx;

  const MyCard(this.title, this.content, this.img, this.idx, {super.key});

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
            if (title == "비용" || title == "식단 제약" || title == "랜덤" || title =="음식 분류") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => statefulScreenList[idx],
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => statelessScreenList[idx],
                ),
              );
            }
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
