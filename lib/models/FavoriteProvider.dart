import 'package:flutter/material.dart';

class FavoriteProvider extends InheritedWidget {
  final List<Map<String, String>> favoriteRadios;
  final void Function(String name, String url, bool isFavorite) onFavoriteChanged;

  FavoriteProvider({
    required Widget child,
    required this.favoriteRadios,
    required this.onFavoriteChanged,
  }) : super(child: child);

  static FavoriteProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FavoriteProvider>();
  }

  @override
  bool updateShouldNotify(FavoriteProvider oldWidget) {
    return favoriteRadios != oldWidget.favoriteRadios;
  }
}
