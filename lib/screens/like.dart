import 'package:flutter/material.dart';
import 'package:jsonparsing/model/information.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

List<info> likedlist = [];

class liked extends StatefulWidget {
  const liked({super.key});

  @override
  State<liked> createState() => _likedState();
}

class _likedState extends State<liked> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Liked Chapter"),
      ),
      body: ListView.builder(
        itemCount: likedlist.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(
              "Chapter - ${likedlist[index].chapter_number}",
            ),
            subtitle:
                (Provider.of<themeprovider>(context).languages.ishindi == false)
                    ? Text("Chapter Name - ${likedlist[index].name}")
                    : Text("chapter Name - ${likedlist[index].name_hindi}"),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    likedlist.removeAt(index);
                  });
                },
                icon: Icon(Icons.delete)),
          ),
        ),
      ),
    );
  }
}
