// ignore_for_file: prefer_const_constructors, unnecessary_this, file_names

import 'package:flutter/material.dart';

class LanguageChangeProvider with ChangeNotifier {
  Locale _currentLocale = Locale("tr");

  Locale get currentLocale => _currentLocale;

  void changeLocale(String _locale) {
    this._currentLocale = Locale(_locale);
    notifyListeners();
  }
}
