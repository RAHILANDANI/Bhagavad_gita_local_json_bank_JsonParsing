import 'package:flutter/material.dart';
import 'package:jsonparsing/model/language_model.dart';

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
    );
  }
}
