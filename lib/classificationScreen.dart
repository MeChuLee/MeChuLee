import 'package:flutter/material.dart';

import 'menuResult.dart';



class ClassificationScreen extends StatefulWidget {
  const ClassificationScreen({Key? key}) : super(key: key);

  @override
  _ClassificationScreen createState() => _ClassificationScreen();
}

class _ClassificationScreen extends State<ClassificationScreen> {
  double buttonHeight = 40;
  double buttonWidth = 70;
  bool selected = false;
  int clickedIndex = 99;

  Color beforeButtonColor = const Color(0xffF4F4F4);
  Color clickedButtonColor = const Color(0xfffff7de);
  var buttonColors = List<Color>.filled(13, Color(0xffF4F4F4));


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ClassificationScreen",
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
              title: const Text("음식 분류", style: TextStyle(color: Colors.black)),
            ),
            bottomNavigationBar: Container(
              height: 60,
              color: const Color(0x99ffd648),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            child: const Text("취소",
                                style: TextStyle(fontSize: 18)),
                          ))),
                  const VerticalDivider(
                      color: Color.fromARGB(255, 211, 211, 211),
                      thickness: 1.0),
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MenuResultScreen("음식 분류")));
                          },
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            child: const Text("선택",
                                style: TextStyle(fontSize: 18)),
                          ))),
                ],
              ),
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                          "원하는 음식 분류",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: 100, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if(!selected) {
                              selected = true;
                            }else {
                              buttonColors[clickedIndex] = beforeButtonColor;
                            }
                            clickedIndex = 0;
                            buttonColors[clickedIndex] = clickedButtonColor;
                          });
                          print("click 한식 요리");
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[0],
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            shadowColor: Colors.black,
                            elevation: 5
                        ),
                        child: const Text(
                            "한식 요리",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: 100, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if(!selected) {
                              selected = true;
                            }else {
                              buttonColors[clickedIndex] = beforeButtonColor;
                            }
                            clickedIndex = 1;
                            buttonColors[clickedIndex] = clickedButtonColor;
                          });
                          print("click 일식 요리");
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[1],
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            shadowColor: Colors.black,
                            elevation: 5
                        ),
                        child: const Text(
                            "일식 요리",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: 100, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if(!selected) {
                              selected = true;
                            }else {
                              buttonColors[clickedIndex] = beforeButtonColor;
                            }
                            clickedIndex = 2;
                            buttonColors[clickedIndex] = clickedButtonColor;
                          });
                          print("click 중국집 요리");
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[2],
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            shadowColor: Colors.black,
                            elevation: 5
                        ),
                        child: const Text(
                            "중국집 요리",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: 100, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if(!selected) {
                              selected = true;
                            }else {
                              buttonColors[clickedIndex] = beforeButtonColor;
                            }
                            clickedIndex = 3;
                            buttonColors[clickedIndex] = clickedButtonColor;
                          });
                          print("click 양식 요리");
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[3],
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            shadowColor: Colors.black,
                            elevation: 5
                        ),
                        child: const Text(
                            "양식 요리",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: 100, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if(!selected) {
                              selected = true;
                            }else {
                              buttonColors[clickedIndex] = beforeButtonColor;
                            }
                            clickedIndex = 4;
                            buttonColors[clickedIndex] = clickedButtonColor;
                          });
                          print("click 분식 요리");
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[4],
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            shadowColor: Colors.black,
                            elevation: 5
                        ),
                        child: const Text(
                            "분식 요리",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: 100, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if(!selected) {
                              selected = true;
                            }else {
                              buttonColors[clickedIndex] = beforeButtonColor;
                            }
                            clickedIndex = 5;
                            buttonColors[clickedIndex] = clickedButtonColor;
                          });
                          print("click 아시안 요리");
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[5],
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            shadowColor: Colors.black,
                            elevation: 5
                        ),
                        child: const Text(
                            "아시안 요리",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: buttonWidth, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if(!selected) {
                              selected = true;
                            }else {
                              buttonColors[clickedIndex] = beforeButtonColor;
                            }
                            clickedIndex = 6;
                            buttonColors[clickedIndex] = clickedButtonColor;
                          });
                          print("click 치킨");
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[6],
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            shadowColor: Colors.black,
                            elevation: 5
                        ),
                        child: const Text(
                            "치킨",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: buttonWidth, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if(!selected) {
                              selected = true;
                            }else {
                              buttonColors[clickedIndex] = beforeButtonColor;
                            }
                            clickedIndex = 7;
                            buttonColors[clickedIndex] = clickedButtonColor;
                          });
                          print("click 피자");
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[7],
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            shadowColor: Colors.black,
                            elevation: 5
                        ),
                        child: const Text(
                            "피자",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: buttonWidth, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if(!selected) {
                              selected = true;
                            }else {
                              buttonColors[clickedIndex] = beforeButtonColor;
                            }
                            clickedIndex = 8;
                            buttonColors[clickedIndex] = clickedButtonColor;
                          });
                          print("click 버거");
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[8],
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            shadowColor: Colors.black,
                            elevation: 5
                        ),
                        child: const Text(
                            "버거",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: 90, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if(!selected) {
                              selected = true;
                            }else {
                              buttonColors[clickedIndex] = beforeButtonColor;
                            }
                            clickedIndex = 9;
                            buttonColors[clickedIndex] = clickedButtonColor;
                          });
                          print("click 샌드위치");
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[9],
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            shadowColor: Colors.black,
                            elevation: 5
                        ),
                        child: const Text(
                            "샌드위치",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: 115, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if(!selected) {
                              selected = true;
                            }else {
                              buttonColors[clickedIndex] = beforeButtonColor;
                            }
                            clickedIndex = 10;
                            buttonColors[clickedIndex] = clickedButtonColor;
                          });
                          print("click 카페 / 디저트");
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[10],
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            shadowColor: Colors.black,
                            elevation: 5
                        ),
                        child: const Text(
                            "카페 / 디저트",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: 105, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if(!selected) {
                              selected = true;
                            }else {
                              buttonColors[clickedIndex] = beforeButtonColor;
                            }
                            clickedIndex = 11;
                            buttonColors[clickedIndex] = clickedButtonColor;
                          });
                          print("click 고기 / 구이");
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[11],
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            shadowColor: Colors.black,
                            elevation: 5
                        ),
                        child: const Text(
                            "고기 / 구이",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: 100, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if(!selected) {
                              selected = true;
                            }else {
                              buttonColors[clickedIndex] = beforeButtonColor;
                            }
                            clickedIndex = 12;
                            buttonColors[clickedIndex] = clickedButtonColor;
                          });
                          print("click 도시락 / 죽");
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[12],
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            shadowColor: Colors.black,
                            elevation: 5
                        ),
                        child: const Text(
                            "도시락 / 죽",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}