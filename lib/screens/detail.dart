import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/information.dart';
import '../provider/theme_provider.dart';

class details extends StatefulWidget {
  details({super.key, required this.information});

  info information;

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Text("Bhagavad Gita"),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Change Lanuage - "),
                  TextButton(
                    onPressed: () {
                      Provider.of<themeprovider>(context, listen: false)
                          .changelanguage();
                    },
                    child: (Provider.of<themeprovider>(context)
                                .languages
                                .ishindi ==
                            false)
                        ? Text("Hindi")
                        : Text("English"),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Change Theme - "),
                  IconButton(
                    onPressed: () {
                      Provider.of<themeprovider>(context, listen: false)
                          .changetheme();
                    },
                    icon: (Provider.of<themeprovider>(context)
                                .themeDetails
                                .isDark ==
                            false)
                        ? Icon(Icons.dark_mode)
                        : Icon(Icons.light_mode),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Chapter Number - ${widget.information.chapter_number}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Center(
              child: (Provider.of<themeprovider>(context).languages.ishindi ==
                      false)
                  ? Text(
                      widget.information.name,
                      style: TextStyle(fontSize: 30),
                    )
                  : Text(
                      widget.information.name_hindi,
                      style: TextStyle(fontSize: 30),
                    ),
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(widget.information.image),
            SizedBox(
              height: 30,
            ),
            (Provider.of<themeprovider>(context).languages.ishindi == false)
                ? Text(widget.information.chapter_summary)
                : Text(widget.information.chapter_summary_hindi)
          ],
        ),
      ),
    );
  }
}
