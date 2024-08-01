import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesManager {
  static const String _key = 'favorite_radios';

  static Future<void> saveFavorites(List<Map<String, String>> favorites) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedFavorites = favorites.map((item) => jsonEncode(item)).toList();
    await prefs.setStringList(_key, encodedFavorites);
  }

  static Future<List> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedFavorites = prefs.getStringList(_key) ?? [];
    return encodedFavorites.map((item) => jsonDecode(item)).toList();
  }
}
