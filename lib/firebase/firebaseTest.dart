import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //https://velog.io/@kyj5394/WidgetsFlutterBinding.ensureInitialized-%EC%82%AC%EC%9A%A9-%EC%9D%B4%EC%9C%A0
  //ensureInitialized() 해야되는 이유
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final firestore = FirebaseFirestore.instance;

  var result = await firestore.collection('menu_info').doc('1').get();
  print(result.data());
  print('firebase 데이터 가져와기 완료');;
}

class FirebaseTest {
  void getDate() async{
      final firestore = FirebaseFirestore.instance;

      var result = await firestore.collection('menu_info').doc('1').get();
      print(result.data());
      print('firebase 데이터 가져와기 완료');
  }
}

