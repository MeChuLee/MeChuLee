import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mechulee/recommender.dart';
import 'menuResult.dart';

class ClassificationScreen extends StatefulWidget {
  const ClassificationScreen({Key? key}) : super(key: key);

  @override
  _ClassificationScreen createState() => _ClassificationScreen();
}

class _ClassificationScreen extends State<ClassificationScreen> {
  int selectedCount = 0;

  double buttonHeight = 40;
  double buttonWidth = 70;
  var selectedCheckList = List<bool>.filled(13, false);

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
                            List lst = showBooleanList(selectedCheckList);

                            if (lst[0] == "") {
                              showNotSelectedToastMsg();
                            } else {
                              var recommender = Recommender();
                              var menuId =
                                  recommender.recommendedAtClassification(
                                      lst[0], lst[1], lst[2]);

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
                      Text("원하는 음식 분류",
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
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: 100, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (selectedCheckList[0] == true) {
                              // 이미 눌려져 있던 상황
                              buttonColors[0] =
                                  beforeButtonColor; // 버튼색 원래대로 돌림
                              selectedCheckList[0] =
                                  false; // 선택되었음을 나타내는 리스트 수정
                              selectedCount--;
                            } else {
                              if (selectedCount != 3) {
                                buttonColors[0] =
                                    clickedButtonColor; // 클릭한 색상으로 변경
                                selectedCheckList[0] =
                                    true; // 선택되었음을 나타내는 리스트 수정
                                selectedCount++; // 선택된 횟수 증가시키기
                              } else {
                                showWrongSelectToastMsg(); // 더 누를수 없기 때문에 토스트 메시지 출력
                              }
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[0],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("한식 요리",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: 100, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (selectedCheckList[1] == true) {
                              // 이미 눌려져 있던 상황
                              buttonColors[1] =
                                  beforeButtonColor; // 버튼색 원래대로 돌림
                              selectedCheckList[1] =
                                  false; // 선택되었음을 나타내는 리스트 수정
                              selectedCount--;
                            } else {
                              if (selectedCount != 3) {
                                buttonColors[1] =
                                    clickedButtonColor; // 클릭한 색상으로 변경
                                selectedCheckList[1] =
                                    true; // 선택되었음을 나타내는 리스트 수정
                                selectedCount++; // 선택된 횟수 증가시키기
                              } else {
                                showWrongSelectToastMsg(); // 더 누를수 없기 때문에 토스트 메시지 출력
                              }
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[1],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("일식 요리",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: 100, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (selectedCheckList[2] == true) {
                              // 이미 눌려져 있던 상황
                              buttonColors[2] =
                                  beforeButtonColor; // 버튼색 원래대로 돌림
                              selectedCheckList[2] =
                                  false; // 선택되었음을 나타내는 리스트 수정
                              selectedCount--;
                            } else {
                              if (selectedCount != 3) {
                                buttonColors[2] =
                                    clickedButtonColor; // 클릭한 색상으로 변경
                                selectedCheckList[2] =
                                    true; // 선택되었음을 나타내는 리스트 수정
                                selectedCount++; // 선택된 횟수 증가시키기
                              } else {
                                showWrongSelectToastMsg(); // 더 누를수 없기 때문에 토스트 메시지 출력
                              }
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[2],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("중식 요리",
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
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: 100, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (selectedCheckList[3] == true) {
                              // 이미 눌려져 있던 상황
                              buttonColors[3] =
                                  beforeButtonColor; // 버튼색 원래대로 돌림
                              selectedCheckList[3] =
                                  false; // 선택되었음을 나타내는 리스트 수정
                              selectedCount--;
                            } else {
                              if (selectedCount != 3) {
                                buttonColors[3] =
                                    clickedButtonColor; // 클릭한 색상으로 변경
                                selectedCheckList[3] =
                                    true; // 선택되었음을 나타내는 리스트 수정
                                selectedCount++; // 선택된 횟수 증가시키기
                              } else {
                                showWrongSelectToastMsg(); // 더 누를수 없기 때문에 토스트 메시지 출력
                              }
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[3],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("양식 요리",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: 100, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (selectedCheckList[4] == true) {
                              // 이미 눌려져 있던 상황
                              buttonColors[4] =
                                  beforeButtonColor; // 버튼색 원래대로 돌림
                              selectedCheckList[4] =
                                  false; // 선택되었음을 나타내는 리스트 수정
                              selectedCount--;
                            } else {
                              if (selectedCount != 3) {
                                buttonColors[4] =
                                    clickedButtonColor; // 클릭한 색상으로 변경
                                selectedCheckList[4] =
                                    true; // 선택되었음을 나타내는 리스트 수정
                                selectedCount++; // 선택된 횟수 증가시키기
                              } else {
                                showWrongSelectToastMsg(); // 더 누를수 없기 때문에 토스트 메시지 출력
                              }
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[4],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("분식 요리",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: 100, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (selectedCheckList[5] == true) {
                              // 이미 눌려져 있던 상황
                              buttonColors[5] =
                                  beforeButtonColor; // 버튼색 원래대로 돌림
                              selectedCheckList[5] =
                                  false; // 선택되었음을 나타내는 리스트 수정
                              selectedCount--;
                            } else {
                              if (selectedCount != 3) {
                                buttonColors[5] =
                                    clickedButtonColor; // 클릭한 색상으로 변경
                                selectedCheckList[5] =
                                    true; // 선택되었음을 나타내는 리스트 수정
                                selectedCount++; // 선택된 횟수 증가시키기
                              } else {
                                showWrongSelectToastMsg(); // 더 누를수 없기 때문에 토스트 메시지 출력
                              }
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[5],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("아시안 요리",
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
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      color: Colors.white,
                      // 컨테이너 범위 확인 색깔
                      width: buttonWidth,
                      // 버튼 상하크기조절
                      height: buttonHeight,
                      // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (selectedCheckList[6] == true) {
                              // 이미 눌려져 있던 상황
                              buttonColors[6] =
                                  beforeButtonColor; // 버튼색 원래대로 돌림
                              selectedCheckList[6] =
                                  false; // 선택되었음을 나타내는 리스트 수정
                              selectedCount--;
                            } else {
                              if (selectedCount != 3) {
                                buttonColors[6] =
                                    clickedButtonColor; // 클릭한 색상으로 변경
                                selectedCheckList[6] =
                                    true; // 선택되었음을 나타내는 리스트 수정
                                selectedCount++; // 선택된 횟수 증가시키기
                              } else {
                                showWrongSelectToastMsg(); // 더 누를수 없기 때문에 토스트 메시지 출력
                              }
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[6],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("치킨",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: buttonWidth, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (selectedCheckList[7] == true) {
                              // 이미 눌려져 있던 상황
                              buttonColors[7] =
                                  beforeButtonColor; // 버튼색 원래대로 돌림
                              selectedCheckList[7] =
                                  false; // 선택되었음을 나타내는 리스트 수정
                              selectedCount--;
                            } else {
                              if (selectedCount != 3) {
                                buttonColors[7] =
                                    clickedButtonColor; // 클릭한 색상으로 변경
                                selectedCheckList[7] =
                                    true; // 선택되었음을 나타내는 리스트 수정
                                selectedCount++; // 선택된 횟수 증가시키기
                              } else {
                                showWrongSelectToastMsg(); // 더 누를수 없기 때문에 토스트 메시지 출력
                              }
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[7],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("피자",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: buttonWidth, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (selectedCheckList[8] == true) {
                              // 이미 눌려져 있던 상황
                              buttonColors[8] =
                                  beforeButtonColor; // 버튼색 원래대로 돌림
                              selectedCheckList[8] =
                                  false; // 선택되었음을 나타내는 리스트 수정
                              selectedCount--;
                            } else {
                              if (selectedCount != 3) {
                                buttonColors[8] =
                                    clickedButtonColor; // 클릭한 색상으로 변경
                                selectedCheckList[8] =
                                    true; // 선택되었음을 나타내는 리스트 수정
                                selectedCount++; // 선택된 횟수 증가시키기
                              } else {
                                showWrongSelectToastMsg(); // 더 누를수 없기 때문에 토스트 메시지 출력
                              }
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[8],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("버거",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      color: Colors.white,
                      // 컨테이너 범위 확인 색깔
                      width: 90,
                      // 버튼 상하크기조절
                      height: buttonHeight,
                      // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (selectedCheckList[9] == true) {
                              // 이미 눌려져 있던 상황
                              buttonColors[9] =
                                  beforeButtonColor; // 버튼색 원래대로 돌림
                              selectedCheckList[9] =
                                  false; // 선택되었음을 나타내는 리스트 수정
                              selectedCount--;
                            } else {
                              if (selectedCount != 3) {
                                buttonColors[9] =
                                    clickedButtonColor; // 클릭한 색상으로 변경
                                selectedCheckList[9] =
                                    true; // 선택되었음을 나타내는 리스트 수정
                                selectedCount++; // 선택된 횟수 증가시키기
                              } else {
                                showWrongSelectToastMsg(); // 더 누를수 없기 때문에 토스트 메시지 출력
                              }
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[9],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("샌드위치",
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
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      color: Colors.white,
                      // 컨테이너 범위 확인 색깔
                      width: 115,
                      // 버튼 상하크기조절
                      height: buttonHeight,
                      // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (selectedCheckList[10] == true) {
                              // 이미 눌려져 있던 상황
                              buttonColors[10] =
                                  beforeButtonColor; // 버튼색 원래대로 돌림
                              selectedCheckList[10] =
                                  false; // 선택되었음을 나타내는 리스트 수정
                              selectedCount--;
                            } else {
                              if (selectedCount != 3) {
                                buttonColors[10] =
                                    clickedButtonColor; // 클릭한 색상으로 변경
                                selectedCheckList[10] =
                                    true; // 선택되었음을 나타내는 리스트 수정
                                selectedCount++; // 선택된 횟수 증가시키기
                              } else {
                                showWrongSelectToastMsg(); // 더 누를수 없기 때문에 토스트 메시지 출력
                              }
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[10],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("카페 / 디저트",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      color: Colors.white, // 컨테이너 범위 확인 색깔
                      width: 105, // 버튼 상하크기조절
                      height: buttonHeight, // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (selectedCheckList[11] == true) {
                              // 이미 눌려져 있던 상황
                              buttonColors[11] =
                                  beforeButtonColor; // 버튼색 원래대로 돌림
                              selectedCheckList[11] =
                                  false; // 선택되었음을 나타내는 리스트 수정
                              selectedCount--;
                            } else {
                              if (selectedCount != 3) {
                                buttonColors[11] =
                                    clickedButtonColor; // 클릭한 색상으로 변경
                                selectedCheckList[11] =
                                    true; // 선택되었음을 나타내는 리스트 수정
                                selectedCount++; // 선택된 횟수 증가시키기
                              } else {
                                showWrongSelectToastMsg(); // 더 누를수 없기 때문에 토스트 메시지 출력
                              }
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[11],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("고기 / 구이",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      color: Colors.white,
                      // 컨테이너 범위 확인 색깔
                      width: 100,
                      // 버튼 상하크기조절
                      height: buttonHeight,
                      // 버튼 좌우크기조절
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (selectedCheckList[12] == true) {
                              // 이미 눌려져 있던 상황
                              buttonColors[12] =
                                  beforeButtonColor; // 버튼색 원래대로 돌림
                              selectedCheckList[12] =
                                  false; // 선택되었음을 나타내는 리스트 수정
                              selectedCount--;
                            } else {
                              if (selectedCount != 3) {
                                buttonColors[12] =
                                    clickedButtonColor; // 클릭한 색상으로 변경
                                selectedCheckList[12] =
                                    true; // 선택되었음을 나타내는 리스트 수정
                                selectedCount++; // 선택된 횟수 증가시키기
                              } else {
                                showWrongSelectToastMsg(); // 더 누를수 없기 때문에 토스트 메시지 출력
                              }
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColors[12],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            shadowColor: Colors.black,
                            elevation: 5),
                        child: const Text("도시락 / 죽",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}

void showWrongSelectToastMsg() {
  Fluttertoast.showToast(
    msg: "3개를 넘는 설정은 할 수 없습니다.",
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.white,
    fontSize: 20,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}

void showNotSelectedToastMsg() {
  Fluttertoast.showToast(
    msg: "분류를 설정하고 선택을 눌러주세요.",
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.white,
    fontSize: 20,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}

List showBooleanList(List<bool> lst) {
  var classificationList = [
    "한식",
    "일식",
    "중식",
    "양식",
    "분식",
    "아시안",
    "치킨",
    "피자",
    "버거",
    "샌드위치",
    "카페/디저트",
    "고기/구이",
    "도시락/죽"
  ];
  var selectedList = ["", "", ""];
  int selectedIndex = 0;
  for (int i = 0; i < classificationList.length; i++) {
    if (lst[i] == true) {
      selectedList[selectedIndex++] = classificationList[i];
    }
  }
  return selectedList;
}
