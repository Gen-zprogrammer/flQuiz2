import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
    appBar: AppBar(
    title: const Text("Dashboard"),
    actions: const [],
    ),
    body: SingleChildScrollView(
    child: Container(
    padding: const EdgeInsets.all(20.0),
    child: Column(
    children: [
      ElevatedButton(
      style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueGrey,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text("balik"),
      ),
    ],
    ),
    ),
    ),
    );
  }
}