import 'package:flutter/material.dart';
import 'package:jsonparsing/provider/theme_provider.dart';
import 'package:jsonparsing/screens/homepage.dart';
import 'package:provider/provider.dart';

import 'screens/splashscreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => themeprovider(),
      builder: (context, _) => MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode:
            (Provider.of<themeprovider>(context).themeDetails.isDark == false)
                ? ThemeMode.light
                : ThemeMode.dark,
        home: splash(),
      ),
    ),
  );
}
