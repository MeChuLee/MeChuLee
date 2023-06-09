import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mechulee/database/record.dart';
import 'package:mechulee/recommender.dart';

import 'database/dbHelper.dart';

class RecentMenuScreen extends StatefulWidget {
  final List<Record> recentMenuList;

  @override
  RecentMenuScreenState createState() => RecentMenuScreenState();

  const RecentMenuScreen(this.recentMenuList, {Key? key}) : super(key: key);
}

class RecentMenuScreenState extends State<RecentMenuScreen> {
  var recentMenuList = [];
  var recommender = Recommender();

  @override
  void initState() {
    super.initState();

    recentMenuList = List.from(widget.recentMenuList.reversed);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "RecentMenuScreen",
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
          title: const Text("최근 먹은 기록", style: TextStyle(color: Colors.black)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: recentMenuList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, //1 개의 행에 보여줄 item 개수
              childAspectRatio: 5 / 1, //item 의 가로 1, 세로 1 의 비율
              mainAxisSpacing: 10, //수평 Padding
              crossAxisSpacing: 10, //수직 Padding
            ),
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                background: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerRight,
                  color: Colors.red,
                  child: const Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  // 최근 먹은 기록 삭제
                  DBHelper dbHelper = DBHelper();
                  dbHelper.deleteRecord(recentMenuList[index].id).then(
                        (value) => {
                          setState(() {
                            if (direction == DismissDirection.startToEnd) {
                              recentMenuList.removeAt(index);
                            }
                          }),
                          recentMenuList.removeAt(index),
                        },
                      );

                  Fluttertoast.showToast(
                    msg: "기록이 삭제되었습니다.",
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.white,
                    fontSize: 20,
                    textColor: Colors.white,
                    toastLength: Toast.LENGTH_SHORT,
                  );
                },
                confirmDismiss: (direction) {
                  return showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: const Text('정말 삭제하시겠습니까?'),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              return Navigator.of(this.context).pop(false);
                            },
                            child: const Text('취소'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              return Navigator.of(this.context).pop(true);
                            },
                            child: const Text('삭제'),
                          ),
                        ],
                      );
                    },
                  );
                },
                key: UniqueKey(),
                child: RecentMenuCard(
                  recentMenuList[index].date,
                  recommender.menuList[recentMenuList[index].menuId - 1]
                      ['name'],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class RecentMenuCard extends StatelessWidget {
  final String title;
  final String content;

  const RecentMenuCard(this.title, this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Card(
        color: Colors.white,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    content,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
