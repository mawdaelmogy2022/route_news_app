import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier {
  String languageCode = 'en';
  void changeLanguage({required String newLanguage}) {
    if (languageCode == newLanguage) {
      return;
    }
    languageCode = newLanguage;
    notifyListeners();
  }
}
