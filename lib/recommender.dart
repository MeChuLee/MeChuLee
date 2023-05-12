import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mechulee/preferenceScreen.dart';

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
    return randomList[0]['id'];
  }

  int recommendedAtClassification(String str1, String str2, String str3) {
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

    //@TODO selectedMenuList.add(a) 처럼 index를 추가하는 것이 아니라 id 를 추가해야 할 듯
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

  int recommendedAtPreference(List<int> sexCheckList, double sliderVal) {
    getMenuList();

    List ageMapIdx = ['0', '10', '2030', '40'];

    List selectedIdx = [];
    List selectedId = [];

    // 성별 확인
    for (int i = 0; i < menuList.length; i++) {
      if ((sexCheckList[PreferenceScreenState.SEX_MALE] == 0 &&
              sexCheckList[PreferenceScreenState.SEX_FEMALE] == 0) ||
          (sexCheckList[PreferenceScreenState.SEX_MALE] == 1 &&
              sexCheckList[PreferenceScreenState.SEX_FEMALE] == 1)) {
        // 남성 여성 체크 o or 남성 여성 체크 x
        selectedIdx.add(i);
      } else if (sexCheckList[PreferenceScreenState.SEX_MALE] == 1 &&
          menuList[i]['sex']['m']) {
        // 남성 체크 o, 여성 체크 x
        selectedIdx.add(i);
      } else if (sexCheckList[PreferenceScreenState.SEX_FEMALE] == 1 &&
          menuList[i]['sex']['f']) {
        // 남성 체크 x, 여성 체크 o
        selectedIdx.add(i);
      }
    }

    // 성별 확인 된 것들 중에 나이 확인
    for (int i = 0; i < selectedIdx.length; i++) {
      if (menuList[selectedIdx[i]]['age'][ageMapIdx[sliderVal.toInt()]]) {
        selectedId.add(menuList[selectedIdx[i]]['id']);
      }
    }

    selectedId.shuffle();
    return selectedId[0];
  }
}
