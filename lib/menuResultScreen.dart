import 'dart:async';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mechulee/recommender.dart';
import 'database/dbHelper.dart';
import 'database/record.dart';

/// 메뉴 결과 화면
class MenuResultScreen extends StatefulWidget {
  final int id;

  @override
  MenuResultScreenState createState() => MenuResultScreenState();
  const MenuResultScreen(this.id, {Key? key}) : super(key: key);
}

class MenuResultScreenState extends State<MenuResultScreen> {
  bool isBack = true;
  double angle = 0;

  bool isLoadResult = false;

  late String imageUrl;
  late String imageUrl2;
  final storage = FirebaseStorage.instance;
  var recommender = Recommender();

  @override
  void initState() {
    super.initState();

    // Set the initial value of imageUrl to an empty string
    imageUrl = '';
    imageUrl2 = '';

    getImageInfoUrl().then((value) => {getImageUrl()});
    //메뉴상세정보를 미리 받아온 뒤 메뉴이미지 url 받아오기
  }

  Future<void> getImageUrl() async {
    final ref = storage.ref().child('menu_photo/${widget.id}.jpg');
    final url = await ref.getDownloadURL();
    setState(() {
      imageUrl = url;
      print(imageUrl);
    });
  }

  Future<void> getImageInfoUrl() async {
    final ref = storage.ref().child('menu_info/${widget.id}.png');
    final url = await ref.getDownloadURL();
    setState(() {
      imageUrl2 = url;
      print(imageUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(Image.network(imageUrl2).image, context);
    precacheImage(Image.network(imageUrl).image, context);
    // 캐시로 미리 받아서 이미지 로딩시간 줄이기

    // 2초 후 로딩 화면 끝내기
    Timer(const Duration(seconds: 2), () {
      setState(() {
        isLoadResult = true;
      });
    });

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
          title: const Text("결과", style: TextStyle(color: Colors.black)),
        ),
        body: widgetBody()
      ),
    );
  }

  Widget widgetBody() {
    NetworkImage myImg1 = NetworkImage(imageUrl);
    NetworkImage myImg2 = NetworkImage(imageUrl2);

    if (isLoadResult) {
      return Column(
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
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            angle = (angle + pi) % (2 * pi);
                          });
                        },
                        child: TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0, end: angle),
                          duration: const Duration(milliseconds: 1000),
                          builder: (BuildContext con, double val, _) {
                            isBack = (val >= (pi / 2)) ? false : true;
                            return Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.001)
                                ..rotateY(val),
                              child: Container(
                                width: 250,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: isBack ? myImg1 : myImg2),
                                ),
                              ),
                            );
                          },
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
          Flexible(
            flex: 1,
            child: Text(
              recommender.menuList[widget.id - 1]['name'],
              style: const TextStyle(fontSize: 30),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    //@TODO 식당 화면
                  },
                  iconSize: 70,
                  icon: Image.asset(
                    "assets/images/restaurantIcon.png",
                    fit: BoxFit.fill,
                  ),
                ),
                const Text(
                  "식당 찾기",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: ElevatedButton(
              onPressed: () async {
                // 현재 날짜 확인
                DateTime dt = DateTime.now();
                String date = "${dt.year}/${dt.month}/${dt.day}";

                // Local DB 에 현재 날짜와 선택한 메뉴 추가
                DBHelper dbHelper = DBHelper();

                dbHelper
                    .insertRecord(Record(date: date, menuId: widget.id))
                    .then((value) => {
                  Navigator.of(context)
                      .popUntil((route) => route.isFirst)
                });

                Fluttertoast.showToast(
                  msg: "메뉴가 기록되었습니다.",
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.white,
                  fontSize: 20,
                  textColor: Colors.white,
                  toastLength: Toast.LENGTH_SHORT,
                );
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
      );
    } else {
      return const Center(
          child: CircularProgressIndicator() //progressbar 추가
      );
    }
  }
}
