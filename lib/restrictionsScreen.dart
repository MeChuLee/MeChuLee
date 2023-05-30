import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mechulee/recommender.dart';
import 'menuResult.dart';

class RestrictionsScreen extends StatefulWidget {
  const RestrictionsScreen({Key? key}) : super(key: key);

  @override
  _RestrictionsScreen createState() => _RestrictionsScreen();
}

class _RestrictionsScreen extends State<RestrictionsScreen> {
  double buttonHeight = 40;
  double buttonWidth = 70;
  double sliderVal4 = 500; // slider의 초기값 설정

  List<Color> buttonColors = List.filled(15, const Color(0xffF4F4F4));
  Color beforeButtonColor = const Color(0xffF4F4F4); // 이전 버튼 색깔
  Color clickedButtonColor = const Color(0xfffff7de); // 클릭한 버튼 색깔

  List<bool> selectedBoolList =
      List.filled(15, false); // false -> 버튼이 눌리지 않은 경우를 나타냄

  bool beforeClickedVegButton = false;
  final queue = Queue<int>();

  void vegButtonClick(int buttonIndex) {
    // 채식주의 버튼 클릭 함수
    if (beforeClickedVegButton == false &&
        selectedBoolList[buttonIndex] == false) {
      queue.add(buttonIndex);
      buttonColors[buttonIndex] = clickedButtonColor;
      selectedBoolList[buttonIndex] = true;
      beforeClickedVegButton = true;
    } else if (beforeClickedVegButton == true &&
        selectedBoolList[buttonIndex] == true) {
      queue.removeFirst();
      selectedBoolList[buttonIndex] = false;
      buttonColors[buttonIndex] = beforeButtonColor;
      beforeClickedVegButton = false;
    } else if (beforeClickedVegButton == true &&
        selectedBoolList[buttonIndex] == false) {
      int beforeClickedVegButtonIndex = queue.removeFirst();
      selectedBoolList[beforeClickedVegButtonIndex] = false;
      buttonColors[beforeClickedVegButtonIndex] = beforeButtonColor;

      queue.add(buttonIndex);
      buttonColors[buttonIndex] = clickedButtonColor;
      selectedBoolList[buttonIndex] = true;
      beforeClickedVegButton = true;
    }
    print("$selectedBoolList  $sliderVal4");
  }

  void buttonClick(buttonIndex) {
    // 알러지, 맛 버튼 클릭 함수
    if (selectedBoolList[buttonIndex] == false) {
      selectedBoolList[buttonIndex] = true;
    } else {
      selectedBoolList[buttonIndex] = false;
    }

    if (buttonColors[buttonIndex] != beforeButtonColor) {
      buttonColors[buttonIndex] = beforeButtonColor;
    } else {
      buttonColors[buttonIndex] = clickedButtonColor; // 버튼 클릭시 변하는 색깔
    }
    print("$selectedBoolList  $sliderVal4");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "RestrictionsScreen",
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: const Color(0xffffd864),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ),
            title: const Text("식단 제약", style: TextStyle(color: Colors.black)),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                // 알러지 기준나열 시작부분 ------------------------------------------------
                const SizedBox(
                  // 기준 제목 위쪽 여백 조정
                  height: 20,
                ),
                Container(
                  // 기준제목 container
                  width: double.infinity, // 넓이가 화면에 꽉 차도록
                  decoration: const BoxDecoration(),
                  child: Row(
                    children: const [
                      SizedBox(
                        // 기준 제목 왼쪽 여백 조정
                        width: 30,
                      ),
                      Text(
                        '알러지',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  // 기준나열 4개씩 가로 정렬
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // 1번 기준 container
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: buttonWidth, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            buttonClick(0);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            // 버튼 스타일 설정
                            backgroundColor: buttonColors[0], // 버튼 색깔 설정
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text(
                            // 버튼 text 설정
                            "달걀",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      // 1번 기준 container
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: buttonWidth, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            buttonClick(1);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            // 버튼 스타일 설정
                            backgroundColor: buttonColors[1],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text(
                            // 버튼 text 설정
                            "우유",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      // 1번 기준 container
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: buttonWidth, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            buttonClick(2);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            // 버튼 스타일 설정
                            backgroundColor: buttonColors[2],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text(
                            // 버튼 text 설정
                            "밀",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      // 1번 기준 container
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: buttonWidth, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            buttonClick(3);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            // 버튼 스타일 설정
                            backgroundColor: buttonColors[3],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text(
                            // 버튼 text 설정
                            "땅콩",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  // 기준나열 4개씩 가로 정렬
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // 1번 기준 container
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: buttonWidth, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            buttonClick(4);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            // 버튼 스타일 설정
                            backgroundColor: buttonColors[4],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text(
                            // 버튼 text 설정
                            "밤",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      // 1번 기준 container
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: buttonWidth, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            buttonClick(5);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            // 버튼 스타일 설정
                            backgroundColor: buttonColors[5],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text(
                            // 버튼 text 설정
                            "생선",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      // 1번 기준 container
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: buttonWidth, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            buttonClick(6);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            // 버튼 스타일 설정
                            backgroundColor: buttonColors[6],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text(
                            // 버튼 text 설정
                            "조개",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(
                      // 마지막 여백 조정
                      width: buttonWidth,
                    ),
                  ],
                ),
                // 알러지 기준나열 끝부분 ------------------------------------------------

                // 채식주의 기준나열 시작부분 ------------------------------------------------
                const SizedBox(
                  // 기준 제목 위쪽 여백 조정
                  height: 40,
                ),
                Container(
                  // 기준제목 container
                  width: double.infinity, // 넓이가 화면에 꽉 차도록
                  decoration: const BoxDecoration(
                      //color: Colors.pink,
                      ),
                  child: Row(
                    children: const [
                      SizedBox(
                        // 기준 제목 왼쪽 여백 조정
                        width: 30,
                      ),
                      Text(
                        '채식주의',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  // 기준나열 4개씩 가로 정렬
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // 1번 기준 container
                      margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                      color: Colors.white,
                      // 컨테이너 범위 확인 색깔
                      width: buttonWidth,
                      // 버튼 상하크기조절
                      height: buttonHeight,
                      // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            vegButtonClick(7);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            // 버튼 스타일 설정
                            backgroundColor: buttonColors[7],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text(
                            // 버튼 text 설정
                            "비건",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      // 1번 기준 container
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: buttonWidth, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            vegButtonClick(8);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            // 버튼 스타일 설정
                            backgroundColor: buttonColors[8],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text(
                            // 버튼 text 설정
                            "폴로",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      // 1번 기준 container
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: 75, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            vegButtonClick(9);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            // 버튼 스타일 설정
                            backgroundColor: buttonColors[9],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text(
                            // 버튼 text 설정
                            "페스코",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      // 1번 기준 container
                      margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      color: Colors.white,
                      // 컨테이너 범위 확인 색깔
                      width: 85,
                      // 버튼 상하크기조절
                      height: buttonHeight,
                      // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            vegButtonClick(10);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            // 버튼 스타일 설정
                            backgroundColor: buttonColors[10],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text(
                            // 버튼 text 설정
                            "락토오보",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                // 채식주의 기준나열 끝부분 ---------------------------------------------

                // 맛 기준나열 시작부분 ------------------------------------------------
                const SizedBox(
                  // 기준 제목 위쪽 여백 조정
                  height: 40,
                ),
                Container(
                  // 기준제목 container
                  width: double.infinity, // 넓이가 화면에 꽉 차도록
                  decoration: const BoxDecoration(),
                  child: Row(
                    children: const [
                      SizedBox(
                        // 기준 제목 왼쪽 여백 조정
                        width: 30,
                      ),
                      Text(
                        '맛',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  // 기준 제목 위쪽 여백 조정
                  height: 20,
                ),
                Row(
                  // 기준나열 4개씩 가로 정렬
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // 1번 기준 container
                      margin: const EdgeInsets.fromLTRB(9, 0, 0, 0),
                      color: Colors.white,
                      // 컨테이너 범위 확인 색깔
                      width: 80,
                      // 버튼 상하크기조절
                      height: buttonHeight,
                      // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            buttonClick(11);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            // 버튼 스타일 설정
                            backgroundColor: buttonColors[11],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text(
                            // 버튼 text 설정
                            "매운맛",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      // 1번 기준 container
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: buttonWidth, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            buttonClick(12);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            // 버튼 스타일 설정
                            backgroundColor: buttonColors[12],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text(
                            // 버튼 text 설정
                            "짠맛",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      // 1번 기준 container
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: buttonWidth, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            buttonClick(13);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            // 버튼 스타일 설정
                            backgroundColor: buttonColors[13],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text(
                            // 버튼 text 설정
                            "단맛",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      // 1번 기준 container
                      margin: const EdgeInsets.fromLTRB(0, 0, 9, 0),
                      color: Colors.white,
                      // 컨테이너 범위 확인 색깔
                      width: 85,
                      // 버튼 상하크기조절
                      height: buttonHeight,
                      // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            buttonClick(14);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            // 버튼 스타일 설정
                            backgroundColor: buttonColors[14],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text(
                            // 버튼 text 설정
                            "느끼한맛",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                // 맛 기준나열 끝 부분 ------------------------------------------------
                // 칼로리 기준 시작 부분 ------------------------------------------------

                const SizedBox(
                  // 기준 제목 위쪽 여백 조정
                  height: 40,
                ),
                Container(
                  // 기준제목 container
                  width: double.infinity, // 넓이가 화면에 꽉 차도록
                  decoration: const BoxDecoration(),
                  child: Row(
                    children: [
                      const SizedBox(
                        // 기준 제목 왼쪽 여백 조정
                        width: 30,
                      ),
                      const Text(
                        '칼로리  ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0),
                      ),
                      Text(
                        '${sliderVal4.round()} kcal',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  // 기준 제목 위쪽 여백 조정
                  height: 5,
                ),

                // 칼로리 기준 끝 부분 ------------------------------------------------

                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: SliderTheme(
                      data: const SliderThemeData(
                        activeTrackColor: Color(0xffffd864),
                        inactiveTrackColor: Color(0xffEEEEEE),
                        activeTickMarkColor: Color(0xffffd864),
                        inactiveTickMarkColor: Color(0xffEEEEEE),
                        thumbColor: Colors.amber,
                        disabledThumbColor: Colors.amber,
                        valueIndicatorColor: Colors.amber,
                        trackShape: RoundedRectSliderTrackShape(),
                        trackHeight: 20,
                        thumbShape: RoundSliderThumbShape(
                            pressedElevation: 0,
                            disabledThumbRadius: 10,
                            enabledThumbRadius: 0,
                            elevation: 0),
                        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      ),
                      child: Slider(
                        value: sliderVal4,
                        // min: 5,
                        max: 1000,
                        divisions: 100,
                        // label: sliderVal4.round().toString(),
                        onChanged: (double newValue) {
                          setState(() {
                            sliderVal4 = newValue;
                            if (sliderVal4 == 0 || sliderVal4 <= 150) {
                              sliderVal4 = 150; // 칼로리 최소 부분 *******
                            }
                            print("$selectedBoolList  $sliderVal4");
                          });
                        },
                      )),
                ),
                Row(
                  children: const [
                    SizedBox(width: 30),
                    Text("0kal", style: TextStyle(fontSize: 18)),
                    Spacer(),
                    Text("1000kal", style: TextStyle(fontSize: 18)),
                    SizedBox(width: 30),
                  ],
                )
              ],
            ),
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
                          child:
                              const Text("취소", style: TextStyle(fontSize: 18)),
                        ))),
                const VerticalDivider(
                    color: Color.fromARGB(255, 211, 211, 211), thickness: 1.0),
                Expanded(
                    child: InkWell(
                        onTap: () {
                          Recommender recommender = Recommender();
                          int menuId = recommender.recommendedAsRestriction(
                              selectedBoolList, sliderVal4.round());
                          if (menuId == -1) {
                            showNoRecommendedResults();
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MenuResultScreen(menuId)));
                          }
                        },
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          child:
                              const Text("선택", style: TextStyle(fontSize: 18)),
                        ))),
              ],
            ),
          ),
        ));
  }
}

void showNoRecommendedResults() {
  Fluttertoast.showToast(
    msg: "추천 결과가 없습니다.",
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.white,
    fontSize: 20,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}
