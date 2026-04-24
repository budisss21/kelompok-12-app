import 'package:flutter/material.dart';

class LuasKotakPage extends StatefulWidget {
  const LuasKotakPage({Key? key}) : super(key: key);

  @override
  _LuasKotakPageState createState() => _LuasKotakPageState();
}

class _LuasKotakPageState extends State<LuasKotakPage> {
  final sisi = TextEditingController();
  double hasil = 0;

  void hitung() {
    setState(() {
      hasil = double.parse(sisi.text) * double.parse(sisi.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Luas Kotak")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: sisi,
              decoration: InputDecoration(labelText: "Sisi"),
            ),
            ElevatedButton(onPressed: hitung, child: Text("Hitung")),
            Text("Hasil: $hasil"),
          ],
        ),
      ),
    );
  }
}
