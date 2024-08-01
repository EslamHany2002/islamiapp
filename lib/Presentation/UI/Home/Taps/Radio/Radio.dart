import 'package:flutter/material.dart';
import 'package:islamiapp/Core/Theme/MyTheme.dart';
import 'package:islamiapp/Presentation/UI/Home/Taps/Radio/Radio%20Favour.dart';
import 'package:islamiapp/Presentation/UI/Home/Taps/Radio/Radio%20List.dart';
import 'package:islamiapp/models/Favorites%20Manager.dart';

class Radio2 extends StatefulWidget {
  const Radio2({super.key});

  @override
  State<Radio2> createState() => _Radio2State();
}

class _Radio2State extends State<Radio2> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, String>> favoriteRadios = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    List loadedFavorites = await FavoritesManager.loadFavorites();
    setState(() {
      favoriteRadios = loadedFavorites.map((item) => Map<String, String>.from(item)).toList();
    });
  }

  Future<void> _saveFavorites() async {
    await FavoritesManager.saveFavorites(favoriteRadios);
  }

  void _addFavorite(String name, String url, bool isFavorite) {
    setState(() {
      if (isFavorite) {
        favoriteRadios.add({'name': name, 'url': url});
      } else {
        favoriteRadios.removeWhere((radio) => radio['name'] == name);
      }
      _saveFavorites();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/PNG/radio Background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.055,
            left: MediaQuery.of(context).size.width * 0.15,
            child: Image.asset(
              'assets/PNG/Mosque-01.png',
              width: MediaQuery.of(context).size.width * 0.7,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.128,
            left: MediaQuery.of(context).size.width * 0.16,
            child: Image.asset(
              'assets/PNG/Islami.png',
              width: MediaQuery.of(context).size.width * 0.7,
            ),
          ),
          Positioned(
            top: 200,
            left: 10,
            right: 10,
            bottom: 0,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF202020),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: MyTheme.gold,
                    ),
                    unselectedLabelColor: Colors.white,
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "janna",
                      color: Colors.black,
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text("Radio"),
                        ),
                      ),
                      Tab(
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text("Favorite"),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      RadioList(
                        onFavoriteChanged: _addFavorite,
                        favoriteRadios: favoriteRadios,
                      ),
                      RadioFav(
                        favoriteRadios: favoriteRadios,
                        onFavoriteChanged: _addFavorite,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
