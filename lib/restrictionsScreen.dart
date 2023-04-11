import 'package:flutter/material.dart';

import 'menuResult.dart';

// 여백 전부 20인데 나머지는 40으로 하기
// 칼로리바 radius 적용하기

class RestrictionsScreen extends StatefulWidget {
  const RestrictionsScreen({Key? key}) : super(key: key);

  @override
  _RestrictionsScreen createState() => _RestrictionsScreen();
}

class _RestrictionsScreen extends State<RestrictionsScreen> {
  double buttonHeight = 40;
  double buttonWidth = 70;
  double sliderVal4 = 100; // 변수 선언을 build밖에다가 해주어야 slider가 잘 동작한다!!!
  List<Color> buttonColors = [
    Color(0xffF4F4F4), // 0 - 달걀
    Color(0xffF4F4F4), // 1 - 우유
    Color(0xffF4F4F4), // 2 - 밀
    Color(0xffF4F4F4), // 3 - 땅콩
    Color(0xffF4F4F4), // 4 - 밥
    Color(0xffF4F4F4), // 5 - 생선
    Color(0xffF4F4F4), // 6 - 조개
    Color(0xffF4F4F4), // 7 - 비건
    Color(0xffF4F4F4), // 8 - 폴로
    Color(0xffF4F4F4), // 9 - 오보
    Color(0xffF4F4F4), // 10 - 락토오보
    Color(0xffF4F4F4), // 11 - 매운맛
    Color(0xffF4F4F4), // 12 - 짠맛
    Color(0xffF4F4F4), // 13 - 단맛
    Color(0xffF4F4F4), // 14 - 느끼한맛
  ]; // 15개
  Color beforeButtonColor = Color(0xffF4F4F4); // 이전 버튼 색깔
  Color buttonColor = Color(0xffF4F4F4); // 이전 버튼 색깔
  // 다른 방법이 있을까요???... 헤헷 ㅋㅋㅋ
  // 버튼 class만들어서 버튼 클릭상태 정보 저장하는 멤버변수 만들어야함. -> 저장해서 결과도출할때.

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
          body: Column(
            children: [
              // 알러지 기준나열 시작부분 ------------------------------------------------
              SizedBox(
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
              SizedBox(
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
                          if (buttonColors[0] != beforeButtonColor) {
                            buttonColors[0] = beforeButtonColor;
                          } else {
                            buttonColors[0] = Color(0xfffff7de); // 버튼 클릭시 변하는 색깔
                          }
                        });
                        print("click 달걀");
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
                          if (buttonColors[1] != beforeButtonColor) {
                            buttonColors[1] = beforeButtonColor;
                          } else {
                            buttonColors[1] =
                                const Color(0xfffff7de); // 버튼 클릭시 변하는 색깔
                          }
                        });
                        print("click 우유");
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
                          if (buttonColors[2] != beforeButtonColor) {
                            buttonColors[2] = beforeButtonColor;
                          } else {
                            buttonColors[2] =
                                const Color(0xfffff7de); // 버튼 클릭시 변하는 색깔
                          }
                        });
                        print("click 밀");
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
                          if (buttonColors[3] != beforeButtonColor) {
                            buttonColors[3] = beforeButtonColor;
                          } else {
                            buttonColors[3] =
                                const Color(0xfffff7de); // 버튼 클릭시 변하는 색깔
                          }
                        });
                        print("click 행복");
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
              SizedBox(
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
                          if (buttonColors[4] != beforeButtonColor) {
                            buttonColors[4] = beforeButtonColor;
                          } else {
                            buttonColors[4] =
                                const Color(0xfffff7de); // 버튼 클릭시 변하는 색깔
                          }
                        });
                        print("click 밥");
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
                          "밥",
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
                          if (buttonColors[5] != beforeButtonColor) {
                            buttonColors[5] = beforeButtonColor;
                          } else {
                            buttonColors[5] =
                                const Color(0xfffff7de); // 버튼 클릭시 변하는 색깔
                          }
                        });
                        print("click 생선");
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
                          if (buttonColors[6] != beforeButtonColor) {
                            buttonColors[6] = beforeButtonColor;
                          } else {
                            buttonColors[6] =
                                const Color(0xfffff7de); // 버튼 클릭시 변하는 색깔
                          }
                        });
                        print("click 행복");
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
              SizedBox(
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
              SizedBox(
                height: 20,
              ),
              Row(
                // 기준나열 4개씩 가로 정렬
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // 1번 기준 container
                    margin: EdgeInsets.fromLTRB(7, 0, 0, 0),
                    color: Colors.white,
                    // 컨테이너 범위 확인 색깔
                    width: buttonWidth,
                    // 버튼 상하크기조절
                    height: buttonHeight,
                    // 버튼 좌우크기조절
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          if (buttonColors[7] != beforeButtonColor) {
                            buttonColors[7] = beforeButtonColor;
                          } else {
                            buttonColors[7] =
                                const Color(0xfffff7de); // 버튼 클릭시 변하는 색깔
                          }
                        });
                        print("click 행복");
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
                          if (buttonColors[8] != beforeButtonColor) {
                            buttonColors[8] = beforeButtonColor;
                          } else {
                            buttonColors[8] =
                                const Color(0xfffff7de); // 버튼 클릭시 변하는 색깔
                          }
                        });
                        print("click 행복");
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
                    width: buttonWidth, // 버튼 상하크기조절
                    height: buttonHeight, // 버튼 좌우크기조절
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          if (buttonColors[9] != beforeButtonColor) {
                            buttonColors[9] = beforeButtonColor;
                          } else {
                            buttonColors[9] =
                                const Color(0xfffff7de); // 버튼 클릭시 변하는 색깔
                          }
                        });
                        print("click 행복");
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
                          "오보",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    // 1번 기준 container
                    margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                    color: Colors.white,
                    // 컨테이너 범위 확인 색깔
                    width: 85,
                    // 버튼 상하크기조절
                    height: buttonHeight,
                    // 버튼 좌우크기조절
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          if (buttonColors[10] != beforeButtonColor) {
                            buttonColors[10] = beforeButtonColor;
                          } else {
                            buttonColors[10] =
                                const Color(0xfffff7de); // 버튼 클릭시 변하는 색깔
                          }
                        });
                        print("click 행복");
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
              SizedBox(
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
              SizedBox(
                // 기준 제목 위쪽 여백 조정
                height: 20,
              ),
              Row(
                // 기준나열 4개씩 가로 정렬
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // 1번 기준 container
                    margin: EdgeInsets.fromLTRB(9, 0, 0, 0),
                    color: Colors.white,
                    // 컨테이너 범위 확인 색깔
                    width: 80,
                    // 버튼 상하크기조절
                    height: buttonHeight,
                    // 버튼 좌우크기조절
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          if (buttonColors[11] != beforeButtonColor) {
                            buttonColors[11] = beforeButtonColor;
                          } else {
                            buttonColors[11] =
                                const Color(0xfffff7de); // 버튼 클릭시 변하는 색깔
                          }
                        });
                        print("click 행복");
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
                          if (buttonColors[12] != beforeButtonColor) {
                            buttonColors[12] = beforeButtonColor;
                          } else {
                            buttonColors[12] =
                                const Color(0xfffff7de); // 버튼 클릭시 변하는 색깔
                          }
                        });
                        print("click 행복");
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
                          if (buttonColors[13] != beforeButtonColor) {
                            buttonColors[13] = beforeButtonColor;
                          } else {
                            buttonColors[13] =
                                const Color(0xfffff7de); // 버튼 클릭시 변하는 색깔
                          }
                        });
                        print("click 행복");
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
                    margin: EdgeInsets.fromLTRB(0, 0, 9, 0),
                    color: Colors.white,
                    // 컨테이너 범위 확인 색깔
                    width: 85,
                    // 버튼 상하크기조절
                    height: buttonHeight,
                    // 버튼 좌우크기조절
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          if (buttonColors[14] != beforeButtonColor) {
                            buttonColors[14] = beforeButtonColor;
                          } else {
                            buttonColors[14] =
                                const Color(0xfffff7de); // 버튼 클릭시 변하는 색깔
                          }
                        });
                        print("click 행복");
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

              SizedBox(
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
                          pressedElevation: 0, disabledThumbRadius: 10 ,enabledThumbRadius: 0, elevation: 0),
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    ),
                    child: Slider(
                      value: sliderVal4,
                      // min: 5,
                      max: 1000,
                      divisions: 10,
                      // label: sliderVal4.round().toString(),
                      onChanged: (double newValue) {
                        setState(() {
                          sliderVal4 = newValue;
                          //print(sliderVal4);
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MenuResultScreen("식단 제약")));
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
