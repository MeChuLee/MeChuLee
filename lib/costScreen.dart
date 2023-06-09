import 'package:flutter/material.dart';
import 'package:mechulee/recommender.dart';
import 'menuResultScreen.dart';

class CostScreen extends StatefulWidget {
  const CostScreen({Key? key}) : super(key: key);

  @override
  _CostScreenState createState() => _CostScreenState();
}

class _CostScreenState extends State<CostScreen> {
  late double startValue;
  late double endValue;
  late RangeValues _sliderRangeValues;
  late RangeLabels _sliderRangeLabels;
  late String minWonUpDown;
  late String maxWonUpDown;
  late String startRangeVal;
  late String endRangeVal;
  late String range = "~";
  late String minRange = "";
  late String maxRange = "";

  // late 키워드가 없는 변수 선언은 선언 시점에서 초기값을 제공하는 것,
  // late 키워드를 사용하는 변수 선언은 초기화를 나중에 할 수 있도록 지원한다.
  // 코드에서 초기값이 명시되어 있다면 late 키워드를 사용하지 않아도 변수를 선언하고 사용가능

  @override
  void initState() {
    super.initState();
    startValue = 5000;
    endValue = 30000;
    _sliderRangeValues = RangeValues(startValue, endValue);
    _sliderRangeLabels = const RangeLabels('5000', '30000');
    minWonUpDown = "원";
    maxWonUpDown = "원";
    startRangeVal = (_sliderRangeValues.start.round()).toString();
    endRangeVal = (_sliderRangeValues.end.round()).toString();
    range = " ~ ";
    minRange = "  ";
    maxRange = "  ";
  }

  // 클래스 멤버변수 초기화시점에 따른 이슈
  // 클래스 멤버 변수는 클래스 생성자 호출 전에 초기화되는 것이 아니라
  // 클래스 인스턴스화 후에 초기화되어야 합니다.
  // 따라서 startValue와 endValue는 클래스 멤버 변수 초기화에 사용될 수 없습니다.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CostScreen",
      theme: ThemeData(
        sliderTheme: SliderThemeData(
          activeTrackColor: Color(0xffffd864),
          inactiveTrackColor: Color(0x99ffd888),
          inactiveTickMarkColor: Colors.grey,
          thumbColor: Color(0xffffd864),
          overlayColor: Colors.pink.withOpacity(0.18),
          trackHeight: 10.0,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: const Color(0xffffd864),
          leading: IconButton(
            onPressed: () {
              setState(() {
                startValue = 5000;
                endValue = 30000;
              });
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: const Text("비용", style: TextStyle(color: Colors.black)),
        ),

        // RangeSlider부분 시작
        // https://www.youtube.com/watch?v=bxNUmqMvbB4
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color(0xffffd864),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "$minRange$startRangeVal$minWonUpDown$range$endRangeVal$maxWonUpDown$maxRange",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0), // card와 slider사이 여백
              Container(
                  width: 380,
                  child: RangeSlider(
                    min: 5000,
                    max: 30000,
                    divisions: 5,
                    labels: _sliderRangeLabels,
                    values: _sliderRangeValues,
                    onChanged: (RangeValues value) {
                      setState(() {
                        // 상자에 나오는 전체를 String으로 해서 바꾸려고 하면
                        // 상태를 변경하는 것 2가지가 겹쳐서 동작하지 않음

                        _sliderRangeValues = value;
                        startRangeVal = value.start.round().toString();
                        endRangeVal = value.end.round().toString();

                        if (value.start.round() == 30000) {
                          startRangeVal = "  ";
                          minWonUpDown = "";
                          maxWonUpDown = "원 이상";
                          minRange = "";
                          range = "";
                          maxRange = " ~ ";
                        } else if (value.end.round() == 5000) {
                          minWonUpDown = "원 이하  ";
                          endRangeVal = "";
                          maxWonUpDown = "";
                          minRange = " ~ ";
                          range = "";
                          maxRange = "";
                        } else {
                          minWonUpDown = "원";
                          maxWonUpDown = "원";
                          minRange = " ";
                          range = " ~ ";
                          maxRange = " ";
                        }
                        _sliderRangeLabels = RangeLabels(
                            '${value.start.round()}원', '${value.end.round()}원');
                      });
                    },
                  )),
            ], // children
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
                        child: const Text("취소", style: TextStyle(fontSize: 18)),
                      ))),
              const VerticalDivider(
                  color: Color.fromARGB(255, 211, 211, 211), thickness: 1.0),
              Expanded(
                  child: InkWell(
                      onTap: () {
                        var recommender = Recommender();
                        var menuId = recommender.recommendedAtCost(
                            _sliderRangeValues.start.round(),
                            _sliderRangeValues.end.round());
                        print(menuId);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MenuResultScreen(menuId)));
                      },
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        child: const Text("선택", style: TextStyle(fontSize: 18)),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
