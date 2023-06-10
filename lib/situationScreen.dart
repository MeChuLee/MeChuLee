import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mechulee/recommender.dart';

import 'menuResultScreen.dart';

class SituationScreen extends StatefulWidget {
  const SituationScreen({Key? key}) : super(key: key);

  @override
  _SituationScreen createState() => _SituationScreen();
}

class _SituationScreen extends State<SituationScreen> {
  // 밑에 int 값으로 변경
  double sliderVal1 = 2; // 피로도 초기 값
  double sliderVal2 = 2; // 배고픔 정도 초기 값
  double sliderVal3 = 1; // 식사 인원 수 초기 값

  double buttonWidth = 70;
  double buttonHeight = 40;

  Color beforeButtonColor = const Color(0xffF4F4F4);
  Color clickedButtonColor = const Color(0xfffff7de);

  var moodButtonColors = List<Color>.filled(5, Color(0xffF4F4F4));
  var weatherButtonColors = List<Color>.filled(3, Color(0xffF4F4F4));

  var moodBoolList = List<bool>.filled(5, false);
  var weatherBoolList = List<bool>.filled(3, false);
  int nowSelectedWeather = -1;

  bool hangover = false;
  bool haveFreeTime = true;
  bool freeTimeButtonClicked = false;

  Color hangoverButtonColor = Color(0xffF4F4F4);
  Color haveFreeTimeButtonColor = Color(0xffF4F4F4);

  // 리스트로 기분, 날씨 등은 설정
  // 나머지는 상황에 맞게 설정
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SituationScreen",
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
            title: const Text("개인 상황", style: TextStyle(color: Colors.black)),
            actions: [
              IconButton(
                icon: Image.asset("assets/images/resetIcon.png"),
                onPressed: () {
                  // 설정한 값들 모두 리셋
                  setState(() {
                    sliderVal1 = 2;
                    sliderVal2 = 2;
                    sliderVal3 = 1;

                    moodButtonColors =
                        List<Color>.filled(5, const Color(0xffF4F4F4));
                    weatherButtonColors =
                        List<Color>.filled(3, const Color(0xffF4F4F4));

                    moodBoolList = List<bool>.filled(5, false);
                    weatherBoolList = List<bool>.filled(3, false);
                    nowSelectedWeather = -1;

                    hangover = false;
                    haveFreeTime = true;
                    freeTimeButtonClicked = false;
                    hangoverButtonColor = const Color(0xffF4F4F4);
                    haveFreeTimeButtonColor = const Color(0xffF4F4F4);
                  });
                },
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
                          int fatigue = sliderVal1.toInt();
                          int hungry = sliderVal2.toInt();
                          int people = sliderVal3.toInt();
                          var recommender = Recommender();

                          print(weatherBoolList);

                          int menuId = recommender.recommendedAtSituation(
                              moodBoolList,
                              weatherBoolList,
                              hangover,
                              haveFreeTime,
                              fatigue,
                              hungry,
                              people);
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
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity, // 넓이가 화면에 꽉 차도록
                  decoration: const BoxDecoration(),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 30,
                      ),
                      Text("기분",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0))
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
                      color: Colors.white,
                      width: buttonWidth,
                      height: buttonHeight,
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (moodBoolList[0] == false) {
                              moodBoolList[0] = true;
                              moodButtonColors[0] = clickedButtonColor;
                            } else {
                              moodBoolList[0] = false;
                              moodButtonColors[0] = beforeButtonColor;
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: moodButtonColors[0],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("기쁨",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: buttonWidth,
                      height: buttonHeight,
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (moodBoolList[1] == false) {
                              moodBoolList[1] = true;
                              moodButtonColors[1] = clickedButtonColor;
                            } else {
                              moodBoolList[1] = false;
                              moodButtonColors[1] = beforeButtonColor;
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: moodButtonColors[1],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("행복",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: buttonWidth,
                      height: buttonHeight,
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (moodBoolList[2] == false) {
                              moodBoolList[2] = true;
                              moodButtonColors[2] = clickedButtonColor;
                            } else {
                              moodBoolList[2] = false;
                              moodButtonColors[2] = beforeButtonColor;
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: moodButtonColors[2],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("우울",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: buttonWidth,
                      height: buttonHeight,
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (moodBoolList[3] == false) {
                              moodBoolList[3] = true;
                              moodButtonColors[3] = clickedButtonColor;
                            } else {
                              moodBoolList[3] = false;
                              moodButtonColors[3] = beforeButtonColor;
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: moodButtonColors[3],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("짜증",
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: Colors.white,
                      width: 85,
                      height: buttonHeight,
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (moodBoolList[4] == false) {
                              moodBoolList[4] = true;
                              moodButtonColors[4] = clickedButtonColor;
                            } else {
                              moodBoolList[4] = false;
                              moodButtonColors[4] = beforeButtonColor;
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: moodButtonColors[4],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("스트레스",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity, // 넓이가 화면에 꽉 차도록
                  decoration: const BoxDecoration(),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 30,
                      ),
                      Text("날씨",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0))
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
                      color: Colors.white,
                      width: buttonWidth,
                      height: buttonHeight,
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            int nowIdx = 0;
                            if (nowSelectedWeather == -1) {
                              weatherBoolList[nowIdx] = true;
                              weatherButtonColors[nowIdx] = clickedButtonColor;
                              nowSelectedWeather = 0;
                            } else {
                              if (nowSelectedWeather == nowIdx) {
                                weatherBoolList[nowIdx] = false;
                                weatherButtonColors[nowIdx] = beforeButtonColor;
                                nowSelectedWeather = -1;
                              } else {
                                weatherBoolList[nowSelectedWeather] = false;
                                weatherButtonColors[nowSelectedWeather] =
                                    beforeButtonColor;
                                nowSelectedWeather = 0;
                                weatherBoolList[nowIdx] = true;
                                weatherButtonColors[nowIdx] =
                                    clickedButtonColor;
                              }
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: weatherButtonColors[0],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("더움",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: buttonWidth,
                      height: buttonHeight,
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            int nowIdx = 1;
                            if (nowSelectedWeather == -1) {
                              weatherBoolList[nowIdx] = true;
                              weatherButtonColors[nowIdx] = clickedButtonColor;
                              nowSelectedWeather = 1;
                            } else {
                              if (nowSelectedWeather == nowIdx) {
                                weatherBoolList[nowIdx] = false;
                                weatherButtonColors[nowIdx] = beforeButtonColor;
                                nowSelectedWeather = -1;
                              } else {
                                weatherBoolList[nowSelectedWeather] = false;
                                weatherButtonColors[nowSelectedWeather] =
                                    beforeButtonColor;
                                nowSelectedWeather = 1;
                                weatherBoolList[nowIdx] = true;
                                weatherButtonColors[nowIdx] =
                                    clickedButtonColor;
                              }
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: weatherButtonColors[1],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("추움",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: buttonWidth,
                      height: buttonHeight,
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            int nowIdx = 2;
                            if (nowSelectedWeather == -1) {
                              weatherBoolList[nowIdx] = true;
                              weatherButtonColors[nowIdx] = clickedButtonColor;
                              nowSelectedWeather = 2;
                            } else {
                              if (nowSelectedWeather == nowIdx) {
                                weatherBoolList[nowIdx] = false;
                                weatherButtonColors[nowIdx] = beforeButtonColor;
                                nowSelectedWeather = -1;
                              } else {
                                weatherBoolList[nowSelectedWeather] = false;
                                weatherButtonColors[nowSelectedWeather] =
                                    beforeButtonColor;
                                nowSelectedWeather = 2;
                                weatherBoolList[nowIdx] = true;
                                weatherButtonColors[nowIdx] =
                                    clickedButtonColor;
                              }
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: weatherButtonColors[2],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("비",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(
                      width: 70,
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity, // 넓이가 화면에 꽉 차도록
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(
                        width: 30,
                      ),
                      Text("해장",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0))
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
                      color: Colors.white,
                      width: buttonWidth,
                      height: buttonHeight,
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (hangover == false) {
                              hangover = true;
                              hangoverButtonColor = clickedButtonColor;
                            } else {
                              hangover = false;
                              hangoverButtonColor = beforeButtonColor;
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: hangoverButtonColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("필요",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    const SizedBox(
                      width: 70,
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity, // 넓이가 화면에 꽉 차도록
                  decoration: const BoxDecoration(),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 30,
                      ),
                      Text("시간적 여유",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0))
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
                      color: Colors.white,
                      width: 100,
                      height: buttonHeight,
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (haveFreeTime == true) {
                              haveFreeTime = false;
                              haveFreeTimeButtonColor = clickedButtonColor;
                            } else {
                              haveFreeTime = true;
                              haveFreeTimeButtonColor = beforeButtonColor;
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: haveFreeTimeButtonColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("여유 없음",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 30,
                    ),
                    const Text("배고픔의 정도",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0)),
                    const Spacer(),
                    if (sliderVal2 == 1)
                      const Text("낮음", style: TextStyle(fontSize: 20)),
                    if (sliderVal2 == 2)
                      const Text("중간", style: TextStyle(fontSize: 20)),
                    if (sliderVal2 == 3)
                      const Text("높음", style: TextStyle(fontSize: 20)),
                    const SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
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
                        value: sliderVal2,
                        min: 1,
                        max: 3,
                        divisions: 2,
                        // label: sliderVal2.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            sliderVal2 = value;
                          });
                        },
                      )),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                  child: Row(
                    children: const [
                      Text("낮음", style: TextStyle(fontSize: 18)),
                      Spacer(),
                      Text("높음", style: TextStyle(fontSize: 18))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      width: 30,
                    ),
                    const Text("식사 인원",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0)),
                    const Spacer(),
                    if (sliderVal3 == 1)
                      const Text("1명", style: TextStyle(fontSize: 20)),
                    if (sliderVal3 == 2)
                      const Text("2명", style: TextStyle(fontSize: 20)),
                    if (sliderVal3 == 3)
                      const Text("3명 이상", style: TextStyle(fontSize: 20)),
                    const SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
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
                        value: sliderVal3,
                        min: 1,
                        max: 3,
                        divisions: 2,
                        // label: sliderVal3.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            sliderVal3 = value;
                          });
                        },
                      )),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 20, 40),
                  child: Row(
                    children: const [
                      Text("1명", style: TextStyle(fontSize: 18)),
                      Spacer(),
                      Text("3명 이상", style: TextStyle(fontSize: 18))
                    ],
                  ),
                )
              ]))),
    );
  }
}

void showToastMsg() {
  Fluttertoast.showToast(
    msg: "중복 선택은 할 수 없습니다.",
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.white,
    fontSize: 20,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}

void showNoRecommendedResults() {
  Fluttertoast.showToast(
    msg: "조건을 만족하는 추천 결과가 없습니다.",
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.white,
    fontSize: 20,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}
