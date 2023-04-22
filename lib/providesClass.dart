import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void Setcount() {
    _count++;
    notifyListeners();
  }
}

class ColorProvider with ChangeNotifier {
  double _values = 1.0;
  double get values => _values;
  void SetColor(double value) {
    _values = value;
    notifyListeners();
  }
}

class FavouriteProvider with ChangeNotifier {
  List<int> _favouriteList = [];
  List<int> get favouriteList => _favouriteList;

  void addValue(int item) {
    _favouriteList.add(item);
    notifyListeners();
  }

  void removeValue(int item) {
    _favouriteList.remove(item);
    notifyListeners();
  }

  void getFavourite() {
    notifyListeners();
  }
}

class ThemeColorProvider with ChangeNotifier {
  var _themeModes = ThemeMode.light;
  ThemeMode get themeMode => _themeModes;

  void SetTheme(themeMode) {
    _themeModes = themeMode;
    notifyListeners();
  }
}
