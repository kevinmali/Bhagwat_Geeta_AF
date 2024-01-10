import 'package:flutter/cupertino.dart';
import 'package:geeta_pr/app/home_screen/modal/english.dart';

class EnglishProvider extends ChangeNotifier {
  EnglishModel englishModel =
      EnglishModel(english: false, gujarati: false, hindi: false);

  void english() {
    englishModel.english = !englishModel.english;
    notifyListeners();
  }

  void gujarati() {
    englishModel.gujarati = !englishModel.gujarati;
    notifyListeners();
  }

  void hindi() {
    englishModel.hindi = !englishModel.hindi;
    notifyListeners();
  }
}
