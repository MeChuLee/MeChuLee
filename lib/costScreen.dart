import 'package:flutter/material.dart';
import 'package:mechulee/recommender.dart';
import 'menuResultScreen.dart';

class CostScreen extends StatefulWidget {
  const CostScreen({Key? key}) : super(key: key);

  @override
  _CostScreenState createState() => _CostScreenState();
}

double startValue = 5000;
double endValue = 30000;

RangeValues _sliderRangeValues =  RangeValues(startValue, endValue);
RangeLabels _sliderRangeLabels = const RangeLabels('5000', '30000');

String minMaxValuesText = '최소 ${_sliderRangeValues.start.round()}원  '
    '최대 ${_sliderRangeValues.end.round()}원';



//String minText = "";
class _CostScreenState extends State<CostScreen> {
String minText = "최소";
String maxText = "최대";
String minWonUpDown = "원";
String maxWonUpDown = "원";
String startRangeVal = (_sliderRangeValues.start.round()).toString();
String endRangeVal = (_sliderRangeValues.end.round()).toString();
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
                      "$minText $startRangeVal$minWonUpDown  "
                          "$maxText $endRangeVal$maxWonUpDown",
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
                        startRangeVal = value.start.round().toString() ;
                        endRangeVal = value.end.round().toString();

                        if (value.start.round() == 30000) {
                          minText = "";
                          startRangeVal = "";
                          minWonUpDown = "";
                          maxText = "최소";
                          maxWonUpDown = "원 이상  ";
                        } else if (value.end.round() == 5000) {
                          minText = "  최소";
                          minWonUpDown = "원 이하";
                          maxText = "";
                          endRangeVal = "";
                          maxWonUpDown = "";
                        } else {
                          minText = "  최소";
                          maxText = "최대";
                          minWonUpDown = "원";
                          maxWonUpDown = "원  ";
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
