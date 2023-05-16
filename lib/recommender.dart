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
      var routeFromJsonFile =
          await rootBundle.loadString('assets/json/menu.json');
      menuList = jsonDecode(routeFromJsonFile);
    }
  }

  int recommendedAtRandom() {
    var randomList = menuList..shuffle();

    // 메뉴 한 개 추천
    return randomList[0]['id'];
  }

  int recommendedAtClassification(String str1, String str2, String str3) {
    getMenuList();
    List<int> selectedId = [];

    if (str1 != "") {
      for (int i = 0; i < menuList.length; i++) {
        if (menuList[i]['classification'] == str1) {
          selectedId.add(menuList[i]['id']);
        }
      }
    } else {
      // 아무것도 선택하지 않았을 경우
      return -1;
    }
    if (str2 != "") {
      for (int i = 0; i < menuList.length; i++) {
        if (menuList[i]['classification'] == str2) {
          selectedId.add(menuList[i]['id']);
        }
      }
    }
    if (str3 != "") {
      for (int i = 0; i < menuList.length; i++) {
        if (menuList[i]['classification'] == str3) {
          selectedId.add(menuList[i]['id']);
        }
      }
    }
    selectedId.shuffle();
    return selectedId[0];
  }

  int recommendedAtCost(minPrice, maxPrice) {
    // 선택된 메뉴 리스트
    List selectedMenuList = [];

    for (int a = 0; a < menuList.length; a++) {
      //json에 있는 파일 개수만큼 반복문 돌려줌
      int price = menuList[a]["price"];
      if (price >= minPrice && price <= maxPrice) {
        selectedMenuList.add(a); // json파일의 인덱스를 리스트에 넣는다.
      }
    }

    selectedMenuList.shuffle();

    return selectedMenuList[0];
  }

  int recommendedAtSituation(List<bool> moodList, List<bool> weatherList, bool hangover,
      bool freeTime, int fatigue, int hungry, int people) {
    getMenuList();

    List<Map> selectedId = [];
    List<Map> tempList = [];
    tempList = [...menuList];
    // 기분
    List<String> moodValues = ['pleasure', 'happiness', 'depression', 'annoyance', "stress"];
    for (int i = 0; i < tempList.length; i++) {
      for (int j = 0; j < 5; j++) {
        if (moodList[j] == true) {
          if (tempList[i]['mood'][moodValues[j]] == true) {
            selectedId.add(tempList[i]);
            print("기분쪽 출력입니다.");
            continue;
          }
        }
      }
    }
    if(selectedId.length == 0) {
      print("기분 계산 후 출력할 값이 없습니다.");
      return -1;
    }
    tempList.clear();
    tempList = [...selectedId];
    selectedId.clear();

    // 날씨
    List<String> weatherValues = ['heat', 'cold', 'rain'];
    for (int i = 0; i < tempList.length; i++) {
      for (int j = 0; j < 3; j++) {
        if (weatherList[j] == true) {
          if (tempList[i]['weather'][weatherValues[j]] == true) {
            selectedId.add(tempList[i]);
            print("날씨쪽 출력입니다.");
            continue;
          }
        }
      }
    }
    if(selectedId.length == 0) {
      print("날씨 계산 후 출력할 값이 없습니다.");
      return -1;
    }
    tempList.clear();
    tempList = [...selectedId];
    selectedId.clear();

    // 해장
    for (int i = 0; i < tempList.length; i++) {
      if(tempList[i]['hangover'] == hangover) {
        selectedId.add(tempList[i]);
        print("해장쪽 출력입니다.");
      }
    }
    if(selectedId.length == 0) {
      print("해장 계산 후 출력할 값이 없습니다.");
      return -1;
    }
    tempList.clear();
    tempList = [...selectedId];
    selectedId.clear();

    // 시간적 여유
    if(freeTime == false) {
      for (int i = 0; i < tempList.length; i++) {
        if(tempList[i]['freeTime'] == freeTime) {
          selectedId.add(tempList[i]);
          print("시간적 여유쪽 출력입니다.");
        }
      }
      if(selectedId.length == 0) {
        print("시간적 여유 계산 후 출력할 값이 없습니다.");
        return -1;
      }
      tempList.clear();
      tempList = [...selectedId];
      selectedId.clear();
    }



    // 피로도
    for (int i = 0; i < tempList.length; i++) {
      if(tempList[i]['fatigue'] == fatigue) {
        selectedId.add(tempList[i]);
        print("피로도쪽 출력입니다.");
      }
    }
    if(selectedId.length == 0) {
      print("피로도 계산 후 출력할 값이 없습니다.");
      return -1;
    }
    tempList.clear();
    tempList = [...selectedId];
    selectedId.clear();

    // 배고픔의 정도
    for (int i = 0; i < tempList.length; i++) {
      if(tempList[i]['hungry'] == hungry) {
        selectedId.add(tempList[i]);
        print("배고픔의 정도쪽 출력입니다.");
      }
    }
    if(selectedId.length == 0) {
      print("배고픔의 정도 계산 후 출력할 값이 없습니다.");
      return -1;
    }
    tempList.clear();
    tempList = [...selectedId];
    selectedId.clear();

    // 식사 인원
    for (int i = 0; i < tempList.length; i++) {
      if(tempList[i]['people'] <= hungry) {
        selectedId.add(tempList[i]);
        print("식사 인원쪽 출력입니다.");
      }
    }
    if(selectedId.length == 0) {
      print("식사 인원 계산 후 출력할 값이 없습니다.");
      return -1;
    }
    print("제대로 출력");
    selectedId.shuffle();
    return selectedId[0]['id'];
  }
}
