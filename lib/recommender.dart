import 'dart:convert';

import 'package:flutter/services.dart';

/// 싱글톤 패턴으로 구성
/// 6가지 기준들을 반영하여 메뉴 추천 기능
class Recommender {

  var menuList;

  // 싱글톤 패턴
  Recommender._privateConstructor();
  static final Recommender _instance = Recommender._privateConstructor();

  factory Recommender() {
    return _instance;
  }

  Future<void> getMenuList() async {
    if (menuList == null) {
      var routeFromJsonFile = await rootBundle.loadString('assets/json/menu.json');
      menuList = jsonDecode(routeFromJsonFile);
    }
  }

  Map<String, dynamic> recommendedAtRandom() {
    getMenuList();

    var randomList = menuList..shuffle();

    print(randomList.runtimeType);
    print(randomList[0].runtimeType);

    // 메뉴 한 개 추천
    return randomList[0];
  }
}
