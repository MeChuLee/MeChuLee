import 'dart:convert';

import 'menu.dart';

class MenuList {
  final List<Menu>? menus;
  MenuList({this.menus});

  factory MenuList.fromJson(String jsonString) {
    List<dynamic> listFromJson = json.decode(jsonString);
    List<Menu> menus = <Menu>[];

    menus = listFromJson.map((menu) => Menu.fromJson(menu)).toList();
    return MenuList(menus: menus);
  }
}