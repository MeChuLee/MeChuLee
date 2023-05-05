import 'package:flutter/material.dart';
import 'menuResult.dart';

class CostScreen extends StatefulWidget {
  const CostScreen({Key? key}) : super(key: key);

  @override
  _CostScreenState createState() => _CostScreenState();
}

// RangeSlider를 움직이는 것이 실시간으로 화면에 반영돼야하기때문에
// StatefulWidget으로 설정했다.
// stateless로 하게 되면 RangeSlider의 onChanged()부분에서 에러가 발생

class _CostScreenState extends State<CostScreen> {
  RangeValues _sliderRangeValues = RangeValues(0, 10);
  RangeLabels _sliderRangeLabels = RangeLabels('0', '100000');

  @override
  Widget build(BuildContext context) {
    //iniital value for start range and end range
    double startval1 = 20, endval1 = 70;

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

          // rangeTrackShape: RoundedRectRangeSliderTrackShape(),
          // rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
          // valueIndicatorColor: Colors.pink,
          // rangeTickMarkShape:
          //   RoundRangeSliderTickMarkShape(tickMarkRadius: 1.2),
          // rangeThumbShape: RoundRangeSliderThumbShape(
          //     enabledThumbRadius: 20.0,
          //     elevation: 20.0,
          //     pressedElevation: 50.0,
          //     ),
        ),
      ),
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
          title: const Text("비용", style: TextStyle(color: Colors.black)),
        ),

        //RangeSlider부분 시작
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
                      '최소 ${_sliderRangeValues.start.round()}만원',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '최대 ${_sliderRangeValues.end.round()}만원',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0), // card와 slider사이 여백
              RangeSlider(
                min: 0,
                max: 10,
                divisions: 10,
                //slide interval
                labels: _sliderRangeLabels,
                values: _sliderRangeValues,
                onChanged: (RangeValues value) {
                  setState(() {
                    _sliderRangeValues = value;
                    _sliderRangeLabels = RangeLabels(
                        '${value.start.round()}만원', '${value.end.round()}만원');
                  });
                  print(_sliderRangeValues.start);
                  print(_sliderRangeValues.end);
                },
              )
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MenuResultScreen("비용")));
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
