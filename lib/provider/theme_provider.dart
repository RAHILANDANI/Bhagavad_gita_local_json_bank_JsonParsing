import 'package:flutter/cupertino.dart';
import 'package:jsonparsing/model/language_model.dart';
import 'package:jsonparsing/model/theme_model.dart';

class themeprovider extends ChangeNotifier {
  ThemeDetails themeDetails = ThemeDetails(isDark: false);
  language languages = language(ishindi: false);

  void changetheme() {
    themeDetails.isDark = !themeDetails.isDark;
    notifyListeners();
  }

  void changelanguage() {
    languages.ishindi = !languages.ishindi;
    notifyListeners();
  }
}
