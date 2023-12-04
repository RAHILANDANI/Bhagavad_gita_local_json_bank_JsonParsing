import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jsonparsing/model/information.dart';
import 'package:jsonparsing/model/language_model.dart';
import 'package:jsonparsing/provider/theme_provider.dart';
import 'package:jsonparsing/screens/detail.dart';
import 'package:provider/provider.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<info> allShloka = [];

  @override
  void initState() {
    super.initState();
    getdata().then((value) {
      setState(() {});
    });
  }

  Future<void> getdata() async {
    String data =
        await rootBundle.loadString('asset/bhagavad_gita_chapters.json');
    Map res = jsonDecode(data);

    List shloka = res['bhagavad_gita'];

    allShloka = shloka
        .map(
          (e) => info(
              image: e['image'],
              id: e['id'],
              name: e['image_name'],
              chapter_number: e['chapter_number'],
              chapter_summary: e['chapter_summary'],
              chapter_summary_hindi: e['chapter_summary_hindi'],
              name_hindi: e['name'],
              verses_count: e['verses_count']),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Provider.of<themeprovider>(context, listen: false).changelanguage();
          },
          child: Text("Hindi"),
        ),
        backgroundColor: Colors.brown,
        title: Text("Bhagavad gita chapters"),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<themeprovider>(context, listen: false).changetheme();
            },
            icon: (Provider.of<themeprovider>(context).themeDetails.isDark ==
                    false)
                ? Icon(Icons.dark_mode)
                : Icon(Icons.light_mode),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: allShloka
            .map(
              (e) => Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => details(information: e),
                        ));
                  },
                  title: Text(
                    "Chapter - ${e.chapter_number}",
                  ),
                  subtitle:
                      (Provider.of<themeprovider>(context).languages.ishindi ==
                              false)
                          ? Text("Chapter Name - ${e.name}")
                          : Text("chapter Name - ${e.name_hindi}"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
