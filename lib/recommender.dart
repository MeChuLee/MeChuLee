import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mechulee/preferenceScreen.dart';

import 'database/dbHelper.dart';

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

    List selectedMenuList = []; // 선택된 메뉴 리스트

    for (int a = 0; a < menuList.length; a++) { //json에 있는 파일 개수만큼 반복문 돌려줌
      int price = menuList[a]["price"];
      if (price >= minPrice && price <= maxPrice) {
        selectedMenuList.add(menuList[a]);
      }
    }

    selectedMenuList.shuffle();
    return selectedMenuList[0]["id"];
  }

  int recommendedAtSituation(List<bool> moodList, List<bool> weatherList,
      bool hangover, bool freeTime, int fatigue, int hungry, int people) {
    List<Map> selectedId = [];
    List<Map> tempList = [];
    tempList = [...menuList];
    // 기분과 날씨에 대한 bool list를 모두 false인 경우 고려하지 않도록
    if (moodList[0] == true ||
        moodList[1] == true ||
        moodList[2] == true ||
        moodList[3] == true ||
        moodList[4] == true) {
      // 기분
      List<String> moodValues = [
        'pleasure',
        'happiness',
        'depression',
        'annoyance',
        "stress"
      ];
      for (int i = 0; i < tempList.length; i++) {
        for (int j = 0; j < 5; j++) {
          if (moodList[j] == true) {
            if (tempList[i]['mood'][moodValues[j]] == true) {
              selectedId.add(tempList[i]);
              continue;
            }
          }
        }
      }
      if (selectedId.length == 0) {
        return -1;
      }
      tempList.clear();
      tempList = [...selectedId];
      selectedId.clear();
    }

    if (weatherList[0] == true ||
        weatherList[1] == true ||
        weatherList[2] == true) {
      // 날씨
      List<String> weatherValues = ['heat', 'cold', 'rain'];
      for (int i = 0; i < tempList.length; i++) {
        for (int j = 0; j < 3; j++) {
          if (weatherList[j] == true) {
            if (tempList[i]['weather'][weatherValues[j]] == true) {
              selectedId.add(tempList[i]);
              continue;
            }
          }
        }
      }
      if (selectedId.length == 0) {
        return -1;
      }
      tempList.clear();
      tempList = [...selectedId];
      selectedId.clear();
    }
    // 해장
    for (int i = 0; i < tempList.length; i++) {
      if (tempList[i]['hangover'] == hangover) {
        selectedId.add(tempList[i]);
      }
    }
    if (selectedId.length == 0) {
      return -1;
    }
    tempList.clear();
    tempList = [...selectedId];
    selectedId.clear();

    // 시간적 여유
    if (freeTime == false) {
      for (int i = 0; i < tempList.length; i++) {
        if (tempList[i]['freeTime'] == freeTime) {
          selectedId.add(tempList[i]);
        }
      }
      if (selectedId.length == 0) {
        return -1;
      }
      tempList.clear();
      tempList = [...selectedId];
      selectedId.clear();
    }

    // 피로도
    for (int i = 0; i < tempList.length; i++) {
      if (tempList[i]['fatigue'] == fatigue) {
        selectedId.add(tempList[i]);
      }
    }
    if (selectedId.length == 0) {
      return -1;
    }
    tempList.clear();
    tempList = [...selectedId];
    selectedId.clear();

    // 배고픔의 정도
    for (int i = 0; i < tempList.length; i++) {
      if (tempList[i]['hungry'] == hungry) {
        selectedId.add(tempList[i]);
      }
    }
    if (selectedId.length == 0) {
      return -1;
    }
    tempList.clear();
    tempList = [...selectedId];
    selectedId.clear();

    // 식사 인원
    for (int i = 0; i < tempList.length; i++) {
      if (tempList[i]['people'] <= hungry) {
        selectedId.add(tempList[i]);
      }
    }
    if (selectedId.length == 0) {
      return -1;
    }
    selectedId.shuffle();
    return selectedId[0]['id'];
  }

  Future<int> recommendedAtPreference(List<int> sexCheckList, double sliderVal,
      List<int> selectCheckList) async {
    List ageMapIdx = ['0', '10', '2030', '40'];

    List selectedIdx = [];
    List tmpIdx = [];

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

    List selectedId = [];

    // 임시 if 처리
    if (selectCheckList[1] == 1) {
      // 성별 확인 된 것들 중에 나이 확인
      for (int i = 0; i < selectedIdx.length; i++) {
        if (menuList[selectedIdx[i]]['age'][ageMapIdx[sliderVal.toInt()]]) {
          tmpIdx.add(i);
        }
      }
      selectedIdx = tmpIdx.toList();

      selectedId = await checkRecentDB(selectedIdx);
      selectedId.shuffle();
    } else {
      for (int i = 0; i < selectedIdx.length; i++) {
        selectedId.add(menuList[selectedIdx[i]]['id']);
      }
    }

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

    List newMenuList = [...menuList]; // menuList 깊은 복사 deep copy
    List restrictionList = ["egg", "milk", "wheat", "peanut", "chestnut", "fish", "shellfish",
      "vegan", "pollo", "pesco", "lacto_ovo","spicy", "salty", "sweet", "greasy"];

    List recursion(List newMenuList, int b) { // 식단제약 추천 재귀함수
      List collectedList = []; // 선택된 메뉴이름 리스트 -> 이미 값은 맞는 것만 골라온 상태
      if (b == 15) {
        return newMenuList;
      }
      if (b == 7 || b == 8 || b == 9 || b == 10) {
        for (int a = 0; a < newMenuList.length; a++) {
          if ((selectedBoolList[b] == true &&
                  newMenuList[a]["vegetarianism"][restrictionList[b]] == true) ||
              selectedBoolList[b] == false) { // 이거 어떻게 할지 생각해보기
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

      newMenuList = [...collectedList];
      List godList = recursion(newMenuList, b + 1);
      return godList;
    }

    newMenuList = [...recursion(newMenuList, 0)];

    List collectedList = [];
    for (int a = 0; a < newMenuList.length; a++) {
      if (newMenuList[a]["calorie"] <= selectedCalorie) {
        collectedList.add(newMenuList[a]);
      }
    }

    newMenuList = [...collectedList];

    for(int a = 0; a < newMenuList.length; a++){
     print(newMenuList[a]["name"]);
    }
    print("수집된 메뉴개수 ${newMenuList.length}");

    if (newMenuList == null) {
      print("조건에 맞는 메뉴가 없습니다.");
      return -1;
    } else {
      newMenuList.shuffle();
      print("최종 메뉴 이름 ${newMenuList[0]["name"]} id: ${newMenuList[0]["id"]}");
      return newMenuList[0]["id"];
    }
  }

  Future<List> checkRecentDB(List selectIdx) async {
    // DB 출력하여 확인하기
    Set resultId = {};
    DBHelper dbHelper = DBHelper();

    DateTime dt = DateTime.now();
    String startDate = "${dt.year}/${dt.month}/${dt.day}";

    await dbHelper.getAllRecord().then((value) => value.forEach((element) {
          for (int i = 0; i < selectIdx.length; i++) {
            // id 가 같으면
            if (element.menuId == menuList[selectIdx[i]]['id']) {
              print(element.menuId);
              Duration difference =
                  calculateDateDifference(startDate, element.date);
              // 5일 이후로 지난 것들만 추가하기
              if (difference.inDays > 5) {
                resultId.add(element.menuId);
              }
            }
          }
        }));

    List selectedId = resultId.toList();
    return selectedId;
  }

  Duration calculateDateDifference(String startDate, String endDate) {
    DateFormat dateFormat = DateFormat('yyyy/MM/dd');

    DateTime startDateTime = dateFormat.parse(startDate);
    DateTime endDateTime = dateFormat.parse(endDate);

    return endDateTime.difference(startDateTime);
  }
}
