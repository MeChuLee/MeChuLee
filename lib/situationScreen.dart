import 'package:flutter/material.dart';

import 'menuResult.dart';

// 피로도, 배고픔의 정도, 식사 소요시간, 식사 인원의 value 표기 하는곳
// 스타일 필요하다면 수정 필요
class SituationScreen extends StatelessWidget {
  const SituationScreen({Key? key}) : super(key: key);

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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MenuResultScreen("개인 상황")));
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
          body: const SingleChildScrollView(
            child: MyStatefulWidget())
        ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double sliderVal1 = 50; // 피로도 초기 값
  double sliderVal2 = 50; // 배고픔 정도 초기 값
  double sliderVal3 = 30; // 식사 소요 시간 초기 값
  double sliderVal4 = 1;  // 식사 인원 수 초기 값
  bool tmp = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(
              width: 40,
            ),
            Text(
                "기분",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: () {
                print("click 기쁨");
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xffF4F4F4),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  shadowColor: Colors.black,
                  elevation: 5
              ),
              child: const Text(
                  "기쁨",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
            OutlinedButton(
              onPressed: () {
                print("click 행복");
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xffF4F4F4),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  shadowColor: Colors.black,
                  elevation: 5
              ),
              child: const Text(
                  "행복",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
            OutlinedButton(
              onPressed: () {
                print("click 우울");
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xffF4F4F4),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  shadowColor: Colors.black,
                  elevation: 5
              ),
              child: const Text(
                  "우울",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
            OutlinedButton(
              onPressed: () {
                print("click 짜증");
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xffF4F4F4),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  shadowColor: Colors.black,
                  elevation: 5
              ),
              child: const Text(
                  "짜증",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            OutlinedButton(
              onPressed: () {
                print("click 스트레스");
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xffF4F4F4),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  shadowColor: Colors.black,
                  elevation: 5
              ),
              child: const Text(
                  "스트레스",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(
              width: 40,
            ),
            Text(
                "날씨",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: () {
                print("click 더움");
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xffF4F4F4),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  shadowColor: Colors.black,
                  elevation: 5
              ),
              child: const Text(
                  "더움",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
            OutlinedButton(
              onPressed: () {
                print("click 추움");
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xffF4F4F4),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  shadowColor: Colors.black,
                  elevation: 5
              ),
              child: const Text(
                  "추움",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
            OutlinedButton(
              onPressed: () {
                print("click 비");
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xffF4F4F4),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  shadowColor: Colors.black,
                  elevation: 5
              ),
              child: const Text(
                  "비",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
            const SizedBox(
              width: 60,
            )
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(
              width: 40,
            ),
            Text(
                "해장",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            OutlinedButton(
              onPressed: () {
                print("click 필요");
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xffF4F4F4),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  shadowColor: Colors.black,
                  elevation: 5
              ),
              child: const Text(
                  "필요",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(
              width: 40,
            ),
            Text(
                "시간적 여유",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: () {
                print("click 여유 없음");
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xffF4F4F4),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  shadowColor: Colors.black,
                  elevation: 5
              ),
              child: const Text(
                  "여유 없음",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
            OutlinedButton(
              onPressed: () {
                print("click 여유 있음");
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xffF4F4F4),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  shadowColor: Colors.black,
                  elevation: 5
              ),
              child: const Text(
                  "여유 있음",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            const SizedBox(
              width: 40,
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [
            const SizedBox(
              width: 40,
            ),
            const Text(
                "피로도",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                )
            ),
            const Spacer(),
            Text(
                sliderVal1.round().toString(),
              style: const TextStyle(
                fontSize: 20.0,
              ),

            ),
            const Text(
                "%",
                style: TextStyle(
                    fontSize: 20,
                )
            ),
            const SizedBox(
              width: 40,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [
              SliderTheme(
                  data: const SliderThemeData(
                    activeTrackColor: Color(0xffffd864),
                    thumbColor: Colors.amber,
                    valueIndicatorColor: Colors.amber,
                    trackHeight: 20,
                    thumbShape:
                    RoundSliderThumbShape(enabledThumbRadius: 2.0, elevation: 1.0),
                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  ),
                  child: Slider(
                    value: sliderVal1,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: sliderVal1.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        sliderVal1 = value;
                      });
                    },
                  )
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(30, 0, 20, 0),
          child: Row(
            children: const [
              Text("0%", style: TextStyle(fontSize: 18)),
              Spacer(),
              Text("100%", style: TextStyle(fontSize: 18))
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
              width: 40,
            ),
            const Text(
                "배고픔의 정도",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                )
            ),
            const Spacer(),
            Text(
              sliderVal2.round().toString(),
              style: const TextStyle(
                fontSize: 20.0,
              ),

            ),
            const Text(
                "%",
                style: TextStyle(
                    fontSize: 20
                )
            ),
            const SizedBox(
              width: 40,
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
                thumbColor: Colors.amber,
                valueIndicatorColor: Colors.amber,
                trackShape: RectangularSliderTrackShape(),
                trackHeight: 20,
                thumbShape:
                RoundSliderThumbShape(enabledThumbRadius: 2.0, elevation: 1.0),
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              ),
              child: Slider(
                value: sliderVal2,
                min: 0,
                max: 100,
                divisions: 10,
                label: sliderVal2.round().toString(),
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
              Text("0%", style: TextStyle(fontSize: 18)),
              Spacer(),
              Text("100%", style: TextStyle(fontSize: 18))
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
              width: 40,
            ),
            const Text(
                "식사 소요 시간",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                )
            ),
            const Spacer(),
            if (sliderVal3 == 10)
              const Text(
                  "10분 이내",
                  style: TextStyle(
                      fontSize: 30.0
                  )
              )
            ,
            if (sliderVal3 == 60)
              const Text(
                  "60분 이상",
                  style: TextStyle(
                      fontSize: 30.0
                  )
              )
            ,
            if (sliderVal3 == 20 || sliderVal3 == 30 || sliderVal3 == 40 || sliderVal3 == 50)
              Row(
                children: [
                  Text(
                    sliderVal3.round().toString(),
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  const Text(
                    "분",
                    style: TextStyle(
                      fontSize: 20.0
                    )
                  )
                ],
              )
            ,
            const SizedBox(
              width: 40,
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
                thumbColor: Colors.amber,
                valueIndicatorColor: Colors.amber,
                trackShape: RectangularSliderTrackShape(),
                trackHeight: 20,
                thumbShape:
                RoundSliderThumbShape(enabledThumbRadius: 2.0, elevation: 1.0),
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              ),
              child: Slider(
                value: sliderVal3,
                min: 10,
                max: 60,
                divisions: 5,
                label: sliderVal3.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    sliderVal3 = value;
                  });
                },
              )
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(30, 0, 20, 0),
          child: Row(
            children: const[
              Text("10분 이내", style: TextStyle(fontSize: 18)),
              Spacer(),
              Text("60분 이상", style: TextStyle(fontSize: 18))
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [
            const SizedBox(
              width: 40,
            ),
            const Text(
                "식사 인원",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                )
            ),
            const Spacer(),
            if (sliderVal4 == 1)
              const Text(
                  "1명",
                  style: TextStyle(
                      fontSize: 20
                  )
              )
            ,
            if (sliderVal4 == 2)
              const Text(
                  "2명",
                  style: TextStyle(
                      fontSize: 20
                  )
              )
            ,
            if (sliderVal4 == 3)
              const Text(
                  "3명",
                  style: TextStyle(
                      fontSize: 20
                  )
              )
            ,
            if (sliderVal4 == 4)
              const Text(
                  "4명 이상",
                  style: TextStyle(
                      fontSize: 20
                  )
              )

            ,
            const SizedBox(
              width: 40,
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
                thumbColor: Colors.amber,
                valueIndicatorColor: Colors.amber,
                trackShape: RectangularSliderTrackShape(),
                trackHeight: 20,
                thumbShape:
                RoundSliderThumbShape(enabledThumbRadius: 2.0, elevation: 1.0),
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              ),
              child: Slider(
                value: sliderVal4,
                min: 1,
                max: 4,
                divisions: 3,
                label: sliderVal4.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    sliderVal4 = value;
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
              Text("4명 이상", style: TextStyle(fontSize: 18))
            ],
          ),
        )
    ]);
  }
}