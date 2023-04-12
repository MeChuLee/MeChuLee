import 'package:flutter/material.dart';

import 'menuResult.dart';

double buttonHeight = 40;
double buttonWidth = 70;

class PreferenceScreen extends StatelessWidget {
  const PreferenceScreen({Key? key}) : super(key: key);

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
                              MaterialPageRoute(builder: (context) => MenuResultScreen("개인 선호도")));
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
                            letterSpacing: 2.0
                        ))
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
                        print("click 남성");
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
                          "남성",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: buttonWidth,
                    height: buttonHeight,
                    child: OutlinedButton(
                      onPressed: () {
                        print("click 여성");
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
                          "여성",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          )
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
                  children: const [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                        "나이",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0
                        ))
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
                        print("click 10대");
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
                          "10대",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: buttonWidth,
                    height: buttonHeight,
                    child: OutlinedButton(
                      onPressed: () {
                        print("click 20대");
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
                          "20대",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: buttonWidth,
                    height: buttonHeight,
                    child: OutlinedButton(
                      onPressed: () {
                        print("click 30대");
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
                          "30대",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: buttonWidth,
                    height: buttonHeight,
                    child: OutlinedButton(
                      onPressed: () {
                        print("click 40대");
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
                          "40대",
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
                    color: Colors.white,
                    width: buttonWidth,
                    height: buttonHeight,
                    child: OutlinedButton(
                      onPressed: () {
                        print("click 50대");
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
                          "50대",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: buttonWidth,
                    height: buttonHeight,
                    child: OutlinedButton(
                      onPressed: () {
                        print("click 60대");
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
                          "60대",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: 100,
                    height: buttonHeight,
                    child: OutlinedButton(
                      onPressed: () {
                        print("click 70대 이상");
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
                          "70대 이상",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 38,
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
                    Text(
                        "선택 사항",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0
                        ))
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
                        print("click 평소에 자주 먹는 음식");
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
                          "평소에 자주 먹는 음식",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: 165,
                    height: buttonHeight,
                    child: OutlinedButton(
                      onPressed: () {
                        print("click 최근 먹은 음식 제외");
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
                          "최근 먹은 음식 제외",
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
          ),
        ));
  }
}
