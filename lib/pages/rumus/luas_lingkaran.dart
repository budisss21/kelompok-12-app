import 'package:flutter/material.dart';
import 'dart:math';

class LuasLingkaranPage extends StatefulWidget {
  const LuasLingkaranPage({Key? key}) : super(key: key);
  @override
  _LuasLingkaranPageState createState() => _LuasLingkaranPageState();
}

class _LuasLingkaranPageState extends State<LuasLingkaranPage> {
  final r = TextEditingController();
  double hasil = 0;

  void hitung() {
    setState(() {
      hasil = pi * pow(double.parse(r.text), 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Luas Lingkaran")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: r,
              decoration: InputDecoration(labelText: "Jari-jari"),
            ),
            ElevatedButton(onPressed: hitung, child: Text("Hitung")),
            Text("Hasil: $hasil"),
          ],
        ),
      ),
    );
  }
}
