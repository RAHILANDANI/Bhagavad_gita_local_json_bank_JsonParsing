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
            Text(widget.information.chapter_summary)
          ],
        ),
      ),
    );
  }
}
