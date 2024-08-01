import 'package:flutter/material.dart';
import 'package:islamiapp/Presentation/UI/splachscreen/splachScreen.dart';
import 'package:islamiapp/models/FavoriteProvider.dart';

import 'Presentation/UI/Home/Taps/Radio/Radio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> favoriteRadios = [];


  @override
  Widget build(BuildContext context) {

    return
      MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
