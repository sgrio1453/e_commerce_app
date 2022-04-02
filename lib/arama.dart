import 'package:flutter/material.dart';

class Aramapage extends StatefulWidget {
  const Aramapage({Key? key}) : super(key: key);

  @override
  State<Aramapage> createState() => _AramapageState();
}

class _AramapageState extends State<Aramapage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Arama"),
      ),
      body: Container(
        margin: EdgeInsets.all(50),
        child: Center(
          child: Text(
            "Burası yakın zamanda işleve girecektir.",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
