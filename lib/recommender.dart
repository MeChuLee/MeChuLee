import 'dart:convert';

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

  // 앱 실행 시 사용될 함수 -> menu.json 파일 읽어서 저장
  Future<void> getMenuList() async {
    if (menuList == null) {
      var routeFromJsonFile =
          await rootBundle.loadString('assets/json/menu.json');
      menuList = jsonDecode(routeFromJsonFile);
    }
  }

  /// 랜덤으로 메뉴 추천
  int recommendedAtRandom() {
    var randomList = menuList.toList()..shuffle();
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

    for (int a = 0; a < menuList.length; a++) {
      //json에 있는 파일 개수만큼 반복문 돌려줌
      int price = menuList[a]["price"];
      if (price >= minPrice && price <= maxPrice) {
        selectedMenuList.add(menuList[a]);
      }
    }
    if (selectedMenuList.isEmpty) {
      return -1;
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
      if (selectedId.isEmpty) {
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
      if (selectedId.isEmpty) {
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
    if (selectedId.isEmpty) {
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
      if (selectedId.isEmpty) {
        return -1;
      }
      tempList.clear();
      tempList = [...selectedId];
      selectedId.clear();
    }

    // 배고픔의 정도
    for (int i = 0; i < tempList.length; i++) {
      if (tempList[i]['hungry'] == hungry) {
        selectedId.add(tempList[i]);
      }
    }
    if (selectedId.isEmpty) {
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
    if (selectedId.isEmpty) {
      return -1;
    }
    selectedId.shuffle();
    return selectedId[0]['id'];
  }

  /// 개인 선호도 기준 메뉴 추천 - local db 확인을 위한 async 사용 -> Future<int> return
  Future<int> recommendedAtPreference(List<int> sexCheckList, double sliderVal,
      List<int> selectCheckList) async {
    // 나이대 idx 선언 (10대 미만, 10대, 20대~30대, 40대이상)
    List ageMapIdx = ['0', '10', '2030', '40'];

    // 선택된 idx 를 저장할 변수
    List selectedIdx = [];
    // 선택된 idx 를 임시로 저장할 변수
    List tmpIdx = [];

    // 성별 확인 후 selectedIdx 에 저장
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
        print('남성 체크 o');
        print(menuList[i]['name']);
      } else if (sexCheckList[PreferenceScreenState.SEX_FEMALE] == 1 &&
          menuList[i]['sex']['f']) {
        // 남성 체크 x, 여성 체크 o
        selectedIdx.add(i);
      }
    }

    // 나이 확인 후 selectedIdx 에 저장
    for (int i = 0; i < selectedIdx.length; i++) {
      if (menuList[selectedIdx[i]]['age'][ageMapIdx[sliderVal.toInt()]]) {
        tmpIdx.add(i);
      }
    }
    selectedIdx = tmpIdx.toList();

    if (selectCheckList[1] == 1) {
      // 최근 먹은 음식 확인 후 idx 반영
      selectedIdx = await checkRecentDB(selectedIdx);
    }

    // 최종 Id 를 저장할 변수
    List selectedId = [];

    if (selectCheckList[0] == 1) {
      // 자주 먹은 음식 확인 후 id 반영
      selectedId = await checkFrequentDB(selectedIdx);

      for (int i = 0; i < selectedId.length; i++) {
        print(selectedId[i]);
      }
    } else {
      // 자주 먹은 음식 미선택 시, 현재 있는 Idx 값들을 Id 로 변환
      for (int i = 0; i < selectedIdx.length; i++) {
        selectedId.add(menuList[selectedIdx[i]]['id']);
      }
    }
    if (selectedId.isEmpty) {
      return -1;
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
      // 식단제약 추천 재귀함수
      List collectedList = []; // 선택된 메뉴이름 리스트 -> 이미 값은 맞는 것만 골라온 상태
      if (b == 15) {
        return newMenuList;
      }
      if (b == 7 || b == 8 || b == 9 || b == 10) {
        for (int a = 0; a < newMenuList.length; a++) {
          if ((selectedBoolList[b] == true &&
                  newMenuList[a]["vegetarianism"][restrictionList[b]] ==
                      true) ||
              selectedBoolList[b] == false) {
            // 이거 어떻게 할지 생각해보기
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

    for (int a = 0; a < newMenuList.length; a++) {
      print(newMenuList[a]["name"]);
    }
    print("수집된 메뉴개수 ${newMenuList.length}");

    if (newMenuList.isEmpty) {
      return -1;
    }
    newMenuList.shuffle();
    return newMenuList[0]["id"];
  }

  /// local db (sqlite) 를 확인 후 최근 목록 확인 - idx return
  Future<List> checkRecentDB(List selectIdx) async {
    // idx 를 저장, 중복 제거를 위해 set 선언
    Set resultIdx = {};

    // sqlite db 사용을 위한 helper
    DBHelper dbHelper = DBHelper();

    // 현재 시간 계산 ( 연 / 월 / 일 )
    DateTime dt = DateTime.now();
    String startDate = "${dt.year}/${dt.month}/${dt.day}";

    // sqlite 에서 모든 데이터 읽기
    List record = await dbHelper.getAllRecord();

    // 선택된 idx 목록에 최근 먹은 음식이 있고, 5일 이후로 지난 것들이 있는지 판별
    for (int i = 0; i < selectIdx.length; i++) {
      // 최근 먹은 음식에 있는지 확인을 위한 bool
      bool isTrue = false;

      for (int j = 0; j < record.length; j++) {
        if (menuList[selectIdx[i]]['id'] == record[j].menuId) {
          // 최근 먹은 음식에 있다는 여부 체크
          isTrue = true;

          // 날짜 차이 계산
          Duration difference =
              calculateDateDifference(startDate, record[j].date);

          if (difference.inDays > 5) {
            // 날짜가 5일 이후로 지난 것들만 결과에 추가
            resultIdx.add(selectIdx[i]);
            break;
          }
        }
      }

      if (!isTrue) {
        // 최근 먹은 음식에 없다면 결과에 추가
        resultIdx.add(selectIdx[i]);
      }
    }

    return resultIdx.toList();
  }

  /// 날짜의 차이를 계산
  Duration calculateDateDifference(String startDate, String endDate) {
    DateFormat dateFormat = DateFormat('yyyy/MM/dd');

    DateTime startDateTime = dateFormat.parse(startDate);
    DateTime endDateTime = dateFormat.parse(endDate);

    return endDateTime.difference(startDateTime);
  }

  /// local db (sqlite) 를 확인 후 자주 먹는 음식 확인 - id return
  Future<List> checkFrequentDB(List selectIdx) async {
    // 결과 id 저장할 변수
    List selectedId = [];

    // sqlite db 사용을 위한 helper
    DBHelper dbHelper = DBHelper();

    // sqlite 에 저장된 데이터 id 가 몇 개 있는지 세기 위해 선언된 map (id : 개수)
    Map<int, int> records = {};

    // 현재 시간 계산 ( 연 / 월 / 일 )
    DateTime dt = DateTime.now();
    String startDate = "${dt.year}/${dt.month}/${dt.day}";

    // sqlite 에서 모든 데이터 읽기
    List record = await dbHelper.getAllRecord();

    // 몇 개 있는지 카운트
    for (int i = 0; i < record.length; i++) {
      // 날짜 차이 계산
      Duration difference = calculateDateDifference(startDate, record[i].date);

      if (difference.inDays < 30) {
        // 한 달 안에 있다면
        if (records.containsKey(record[i].menuId)) {
          // 키 값이 있다면 숫자 증가
          records[record[i].menuId] = records[record[i].menuId]! + 1;
        } else {
          // 키 값이 없다면 숫자 1로 생성
          records[record[i].menuId] = 1;
        }
      }
    }

    // 최근 한 달동안 세 번 이상 먹은 음식일 경우 결과 값에 추가
    for (int i = 0; i < selectIdx.length; i++) {
      records.forEach((key, value) {
        if (menuList[selectIdx[i]]['id'] == key && value >= 3) {
          selectedId.add(key);
        }
      });
    }

    // count - 현재 Idx 목록의 80% 개수
    var count = selectIdx.length * 4;

    // Idx 목록의 80% 만큼 자주 먹은 음식 id로 채우기
    var idx = 0;
    while (selectedId.length < count && selectedId.isNotEmpty) {
      selectedId.add(selectedId[idx++]);
    }

    // Idx 에 있는 값들을 id 로 채우기
    for (int i = 0; i < selectIdx.length; i++) {
      selectedId.add(menuList[selectIdx[i]]['id']);
    }

    return selectedId;
  }
}
