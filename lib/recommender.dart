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
    // 수정완료
    for (int a = 0; a < menuList.length; a++) {
      //json에 있는 파일 개수만큼 반복문 돌려줌
      int price = menuList[a]["price"];
      if (price >= minPrice && price <= maxPrice) {
        selectedMenuList.add(menuList[a]["id"]); // json파일의 id를 리스트에 넣는다.
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

  int recommendedAsRestriction(List selectedBoolList, var selectedCalorie) {
    // 식단제약 추천
    // var selectedCheckList = List<bool>.filled(15, false);
    // 0~6 알러지, 7~10 채식주의, 11~14 맛.
    // 알러지는 false인걸 가져오고, 채식주의는 true인걸 가져온다.
    // 맛은 false인걸 가져온다.

    // 채식주의는 1개만 가져오기
    // 알러지랑 채식주의 우선순위 생각해보기

    // List<bool> selectedCheckList = [false,false,false,false,false,false,false,
    //   true,true,true,true,true,true,false,false]; // 김치볶음밥
    List newMenuList = [...menuList]; // menuList 깊은 복사 deep copy
    List restrictionList = [
      "egg",
      "milk",
      "wheat",
      "peanut",
      "chestnut",
      "fish",
      "shellfish",
      "vegan",
      "pollo",
      "pesco",
      "lacto_ovo",
      "spicy",
      "salty",
      "sweet",
      "greasy"
    ];

    List recursion(List newMenuList, int b) {
      // allergy 재귀함수
      List collectedList = []; // 선택된 메뉴이름 리스트 -> 이미 값은 맞는 것만 골라온 상태
      if (b == 15) {
        return newMenuList;
      }
      if (b == 7 || b == 8 || b == 9 || b == 10) {
        for (int a = 0; a < newMenuList.length; a++) {
          if ((selectedBoolList[b] == true &&
                  newMenuList[a]["vegetarianism"][restrictionList[b]] ==
                      false) ||
              selectedBoolList[b] == false) {
            collectedList.add(newMenuList[a]);
          }
        }
      } else if (b == 11 || b == 12 || b == 13 || b == 14) {
        for (int a = 0; a < newMenuList.length; a++) {
          if ((selectedBoolList[b] == true &&
                  newMenuList[a]["taste"][restrictionList[b]] == false) ||
              selectedBoolList[b] == false) {
            collectedList.add(newMenuList[a]);
          }
        }
      } else {
        for (int a = 0; a < newMenuList.length; a++) {
          if ((selectedBoolList[b] == true &&
                  newMenuList[a]["allergy"][restrictionList[b]] == false) ||
              selectedBoolList[b] == false) {
            collectedList.add(newMenuList[a]);
          }
        }
      }
      print(collectedList.length);

      newMenuList = [...collectedList];
      List godList = recursion(newMenuList, b + 1);
      return godList;
    }

    newMenuList = [...recursion(newMenuList, 0)];

    print(newMenuList.length);
    print(newMenuList[0]["name"]);

    List collectedList = [];
    for (int a = 0; a < newMenuList.length; a++) {
      if (newMenuList[a]["calorie"] <= selectedCalorie) {
        collectedList.add(newMenuList[a]);
      }
    }

    newMenuList = [...collectedList];

    print(newMenuList);

    if (newMenuList == null) {
      print("조건에 맞는 메뉴가 없습니다.");
      return -1;
    } else {
      newMenuList.shuffle();
      return newMenuList[0]["id"];
    }
  }
}
