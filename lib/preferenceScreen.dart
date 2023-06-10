import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mechulee/recommender.dart';

import 'menuResultScreen.dart';

class PreferenceScreen extends StatefulWidget {
  @override
  PreferenceScreenState createState() => PreferenceScreenState();

  const PreferenceScreen({Key? key}) : super(key: key);
}

class PreferenceScreenState extends State<PreferenceScreen> {
  static const IDX_DEFAULT_BTN = 0;
  static const IDX_CHECKED_BTN = 1;
  static const SEX_MALE = 0;
  static const SEX_FEMALE = 1;
  static const TEN_UNDER_AGE_VALUE = 0;
  static const TEN_AGE_VALUE = 1;
  static const TWENTY_THRITY_AGEVALUE = 2;
  static const FOURTY_OVER_AGE_VALUE = 3;

  static const double buttonHeight = 40;

  var ageString = "10대";
  double sliderVal = 1;

  var sexCheckList = List<int>.filled(2, 0);
  var selectCheckList = List<int>.filled(2, 0);

  List<Color> btnColor = [const Color(0xffF4F4F4), const Color(0xfffff7de)];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PreferenceScreen",
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
          title: const Text("개인 선호도", style: TextStyle(color: Colors.black)),
          actions: [
            IconButton(
              icon: Image.asset("assets/images/resetIcon.png"),
              onPressed: () {
                // 설정한 값들 모두 리셋
                setState(() {
                  ageString = "10대";
                  sliderVal = 1;

                  sexCheckList = List<int>.filled(2, 0);
                  selectCheckList = List<int>.filled(2, 0);
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
                    child: const Text(
                      "취소",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              const VerticalDivider(
                color: Color.fromARGB(255, 211, 211, 211),
                thickness: 1.0,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    // 개인 선호도 기반 추천
                    var recommender = Recommender();
                    recommender
                        .recommendedAtPreference(
                            sexCheckList, sliderVal, selectCheckList)
                        .then((id) {
                      if (id == -1) {
                        showNoRecommendedResults();
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MenuResultScreen(id),
                          ),
                        );
                      }
                    });
                  },
                  child: Container(
                    height: 60,
                    alignment: Alignment.center,
                    child: const Text(
                      "선택",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
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
                    "성별",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
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
                  width: 70,
                  height: buttonHeight,
                  child: OutlinedButton(
                    onPressed: () {
                      // 남성 체크
                      setState(() {
                        if (sexCheckList[SEX_MALE] == IDX_CHECKED_BTN) {
                          sexCheckList[SEX_MALE] = IDX_DEFAULT_BTN;
                        } else {
                          sexCheckList[SEX_MALE] = IDX_CHECKED_BTN;
                        }
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: btnColor[sexCheckList[SEX_MALE]],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      shadowColor: Colors.black,
                      elevation: 5,
                    ),
                    child: const Text(
                      "남성",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: 70,
                  height: buttonHeight,
                  child: OutlinedButton(
                    onPressed: () {
                      // 여성 체크
                      setState(() {
                        if (sexCheckList[SEX_FEMALE] == IDX_CHECKED_BTN) {
                          sexCheckList[SEX_FEMALE] = IDX_DEFAULT_BTN;
                        } else {
                          sexCheckList[SEX_FEMALE] = IDX_CHECKED_BTN;
                        }
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: btnColor[sexCheckList[SEX_FEMALE]],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      shadowColor: Colors.black,
                      elevation: 5,
                    ),
                    child: const Text(
                      "여성",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                const SizedBox(
                  width: 70,
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
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    "나이",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    ageString,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
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
                  value: sliderVal,
                  min: 0,
                  max: 3,
                  divisions: 3,
                  onChanged: (double newValue) {
                    setState(() {
                      sliderVal = newValue;
                      switch (newValue.toInt()) {
                        case TEN_UNDER_AGE_VALUE:
                          ageString = "10대 미만";
                          break;
                        case TEN_AGE_VALUE:
                          ageString = "10대";
                          break;
                        case TWENTY_THRITY_AGEVALUE:
                          ageString = "20대 ~ 30대";
                          break;
                        case FOURTY_OVER_AGE_VALUE:
                          ageString = "40대 이상";
                          break;
                        default:
                          break;
                      }
                    });
                  },
                ),
              ),
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
                  Text(
                    "선택 사항",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
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
                  width: 165,
                  height: buttonHeight,
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        if (selectCheckList[0] == IDX_CHECKED_BTN) {
                          selectCheckList[0] = IDX_DEFAULT_BTN;
                        } else {
                          selectCheckList[0] = IDX_CHECKED_BTN;
                        }
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: btnColor[selectCheckList[0]],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      shadowColor: Colors.black,
                      elevation: 5,
                    ),
                    child: const Text(
                      "평소에 자주 먹는 음식",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: 165,
                  height: buttonHeight,
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        if (selectCheckList[1] == IDX_CHECKED_BTN) {
                          selectCheckList[1] = IDX_DEFAULT_BTN;
                        } else {
                          selectCheckList[1] = IDX_CHECKED_BTN;
                        }
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: btnColor[selectCheckList[1]],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      shadowColor: Colors.black,
                      elevation: 5,
                    ),
                    child: const Text(
                      "최근 먹은 음식 제외",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
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
