import 'package:flutter/material.dart';
import 'dart:math';

class IsiTabungPage extends StatefulWidget {
  const IsiTabungPage({Key? key}) : super(key: key);

  @override
  _IsiTabungPageState createState() => _IsiTabungPageState();
}

class _IsiTabungPageState extends State<IsiTabungPage> {
  final r = TextEditingController();
  final t = TextEditingController();
  double hasil = 0;

  void hitung() {
    setState(() {
      hasil = pi * pow(double.parse(r.text), 2) * double.parse(t.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Isi Tabung")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: r,
              decoration: InputDecoration(labelText: "Jari-jari"),
            ),
            TextField(
              controller: t,
              decoration: InputDecoration(labelText: "Tinggi"),
            ),
            ElevatedButton(onPressed: hitung, child: Text("Hitung")),
            Text("Hasil: $hasil"),
          ],
        ),
      ),
    );
  }
}
