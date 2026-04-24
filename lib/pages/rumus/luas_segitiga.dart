import 'package:flutter/material.dart';

class LuasSegitigaPage extends StatefulWidget {
  const LuasSegitigaPage({Key? key}) : super(key: key);
  @override
  _LuasSegitigaPageState createState() => _LuasSegitigaPageState();
}

class _LuasSegitigaPageState extends State<LuasSegitigaPage> {
  final alas = TextEditingController();
  final tinggi = TextEditingController();
  double hasil = 0;

  void hitung() {
    setState(() {
      hasil = 0.5 * double.parse(alas.text) * double.parse(tinggi.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Luas Segitiga")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: alas,
              decoration: InputDecoration(labelText: "Alas"),
            ),
            TextField(
              controller: tinggi,
              decoration: InputDecoration(labelText: "Tinggi"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: hitung, child: Text("Hitung")),
            Text("Hasil: $hasil"),
          ],
        ),
      ),
    );
  }
}
