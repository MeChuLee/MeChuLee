import 'package:flutter/material.dart';

import 'menuResult.dart';

class ClassificationScreen extends StatelessWidget {
  const ClassificationScreen({Key? key}) : super(key: key);

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                        "원하는 음식 분류",
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
                        print("click 한식 요리");
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
                          "한식 요리",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        print("click 일식 요리");
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
                          "일식 요리",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        print("click 중국집 요리");
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
                          "중국집 요리",
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        print("click 양식 요리");
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
                          "양식 요리",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        print("click 분식 요리");
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
                          "분식 요리",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        print("click 아시안 요리");
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
                          "아시안 요리",
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: OutlinedButton(
                        onPressed: () {
                          print("click 치킨");
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
                            "치킨",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        print("click 피자");
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
                          "피자",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        print("click 버거");
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
                          "버거",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: OutlinedButton(
                        onPressed: () {
                          print("click 샌드위치");
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
                      child: OutlinedButton(
                        onPressed: () {
                          print("click 카페 / 디저트");
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
                            "카페 / 디저트",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        print("click 고기 / 구이");
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
                          "고기 / 구이",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: OutlinedButton(
                        onPressed: () {
                          print("click 도시락 / 죽");
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
