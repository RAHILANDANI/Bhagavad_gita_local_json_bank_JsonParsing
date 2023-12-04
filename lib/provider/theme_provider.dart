import 'package:flutter/cupertino.dart';
import 'package:jsonparsing/model/theme_model.dart';

class themeprovider extends ChangeNotifier {
  ThemeDetails themeDetails = ThemeDetails(isDark: false);

  void changetheme() {
    themeDetails.isDark = !themeDetails.isDark;
    notifyListeners();
  }
}
