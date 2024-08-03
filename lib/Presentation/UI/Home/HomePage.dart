import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamiapp/Core/Theme/MyTheme.dart';
import 'package:islamiapp/Presentation/UI/Home/Taps/Hadith/Hadith.dart';
import 'package:islamiapp/Presentation/UI/Home/Taps/Quran/Quran.dart';
import 'package:islamiapp/Presentation/UI/Home/Taps/Radio/Radio.dart';
import 'package:islamiapp/Presentation/UI/Home/Taps/Time/Time.dart';
import 'package:islamiapp/Presentation/UI/Home/Taps/sabhuh/sabhuh.dart';
import '../../../models/FavoriteProvider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  var widgetjsonData;

  late List<Widget> tabItems;
  List<Map<String, String>> favoriteRadios = [];


  Future<void> loadJsonAsset() async {
    final String jsonString =
        await rootBundle.loadString("assets/json/surahs.json");
    var data = jsonDecode(jsonString);
    setState(() {
      widgetjsonData = data;
      tabItems = [
        Quran(suraJsonData: widgetjsonData),
        const Hadith(),
        const Sabhuh(),
        FavoriteProvider(
          favoriteRadios: [],
          onFavoriteChanged: (String name, String url, bool isFavorite) async {
            // Implement the action when a favorite changes, if needed
          },
          child: const Radio2(),
        ),
        const Time(),
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonAsset();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetjsonData == null
            ? const CircularProgressIndicator()
            : tabItems[_selectedIndex],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        animationDuration: const Duration(milliseconds: 1000),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        indicatorColor: const Color(0x86212121),
        backgroundColor: MyTheme.gold,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            selectedIcon: SvgPicture.asset(
              'assets/SVG/quran-svgrepo-com.svg',
              width: 25,
              color: Colors.white,
            ),
            icon: SvgPicture.asset(
              'assets/SVG/quran-svgrepo-com.svg',
              width: 25,
              color: Colors.black,
            ),
            label: "Quran",
          ),
          NavigationDestination(
              selectedIcon: SvgPicture.asset(
                'assets/SVG/book-album-svgrepo-com 1.svg',
                width: 25,
                color: Colors.white,
              ),
              icon: SvgPicture.asset(
                'assets/SVG/book-album-svgrepo-com 1.svg',
                width: 25,
                color: MyTheme.background,
              ),
              label: "Hadith"),
          NavigationDestination(
              selectedIcon: SvgPicture.asset(
                'assets/SVG/necklace-islam-svgrepo-com 1.svg',
                width: 30,
                color: Colors.white,
              ),
              icon: SvgPicture.asset(
                'assets/SVG/necklace-islam-svgrepo-com 1.svg',
                width: 30,
                color: MyTheme.background,
              ),
              label: "Masbahuh"),
          NavigationDestination(
              selectedIcon: SvgPicture.asset(
                'assets/SVG/radio-minimalistic-svgrepo-com.svg',
                width: 33,
                color: Colors.white,
              ),
              icon: SvgPicture.asset(
                'assets/SVG/radio-minimalistic-svgrepo-com.svg',
                width: 33,
                color: MyTheme.background,
              ),
              label: "Radio"),
          NavigationDestination(
              selectedIcon: SvgPicture.asset(
                'assets/SVG/Vector.svg',
                width: 23,
                color: Colors.white,
              ),
              icon: SvgPicture.asset(
                'assets/SVG/Vector.svg',
                width: 23,
                color: MyTheme.background,
              ),
              label: "Time"),
        ],
      ),
    );
  }
}
