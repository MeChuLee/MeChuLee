import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mechulee/classificationScreen.dart';
import 'package:mechulee/costScreen.dart';
import 'package:mechulee/preferenceScreen.dart';
import 'package:mechulee/recentMenuScreen.dart';
import 'package:mechulee/recommender.dart';
import 'package:mechulee/restrictionsScreen.dart';
import 'package:mechulee/situationScreen.dart';
import 'database/dbHelper.dart';
import 'firebase/firebase_options.dart';
import 'menuResultScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 앱 실행 시 json 파일 한 번 읽고 난 후 runApp 실행
  var recommender = Recommender();
  recommender.getMenuList().then((value) => runApp(const MyApp()));
}

// stateful 화면 list
final statefulScreenList = <StatefulWidget>[
  const CostScreen(),
  const RestrictionsScreen(),
  const MenuResultScreen(0),
  const PreferenceScreen(),
  const SituationScreen(),
  const ClassificationScreen(),
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
    var recommender = Recommender();
    recommender.getMenuList().then((value) => {});

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffffd864),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("메추리", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Image.asset("assets/images/logo.png"),
            onPressed: () {
              // 메추리 아이콘 클릭 이벤트
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              accountName: const Text(
                'LV 1 병아리',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: const Text(
                '메뉴 추천 리스트',
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
              leading: const Icon(Icons.info_outline),
              iconColor: const Color(0xffffd864),
              focusColor: const Color(0xffffd864),
              title: const Text('정보'),
              onTap: () {
                //@TODO 햄버거 정보 버튼 클릭 이벤트
              },
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: const Icon(Icons.list_alt_outlined),
              iconColor: const Color(0xffffd864),
              focusColor: const Color(0xffffd864),
              title: const Text('결정 기록 리스트'),
              onTap: () {
                // 최근 먹은 메뉴 화면으로 이동
                DBHelper dbHelper = DBHelper();
                dbHelper
                    .getAllRecord()
                    .then(
                      (value) => {
                        if(value.isEmpty) {
                          showNoRecord()
                        }else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecentMenuScreen(value),
                            ),
                          )
                        }
                      },
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
            MyCard("비용", "돈 아껴야 돼~", "assets/images/money.png", 0),
            MyCard("식단 제약", "제약사항 확인해요!", "assets/images/salad.png", 1),
            MyCard("랜덤", "운세를 보라", "assets/images/shuffle.png", 2),
            MyCard("개인 선호도", "뭐가 좋니?", "assets/images/like.png", 3),
            MyCard("개인 상황", "오늘 어때?", "assets/images/sun.png", 4),
            MyCard("음식 분류", "한식 중식 일식?", "assets/images/dish.png", 5),
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
            if (title == "랜덤") {
              // 랜덤으로 추천
              var recommender = Recommender();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MenuResultScreen(recommender.recommendedAtRandom()),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => statefulScreenList[idx],
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

void showNoRecord() {
  Fluttertoast.showToast(
    msg: "저장된 기록이 없습니다.",
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.white,
    fontSize: 20,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}
