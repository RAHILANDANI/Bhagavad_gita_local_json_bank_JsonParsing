import 'package:flutter/material.dart';

class liked extends StatefulWidget {
  const liked({super.key});

  @override
  State<liked> createState() => _likedState();
}

class _likedState extends State<liked> {
  List list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Liked Chapter"),
      ),
      body: Column(
        children: list.map((e) => Card()).toList(),
      ),
    );
  }
}
