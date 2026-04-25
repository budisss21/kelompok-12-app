import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class LuasLingkaranPage extends StatefulWidget {
  const LuasLingkaranPage({Key? key}) : super(key: key);
  @override
  _LuasLingkaranPageState createState() => _LuasLingkaranPageState();
}

class _LuasLingkaranPageState extends State<LuasLingkaranPage> {
  final jariJari = TextEditingController();
  double hasil = 0;

  void hitung() {
    if (jariJari.text.isEmpty) return;
    setState(() {
      double r = double.tryParse(jariJari.text) ?? 0;
      hasil = pi * r * r;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Luas Lingkaran", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Icon(Icons.circle_outlined, size: 60, color: Colors.deepPurple),
                    const SizedBox(height: 10),
                    Text("Rumus: π × r²", style: GoogleFonts.poppins(fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: jariJari,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Jari-jari (cm)",
                prefixIcon: const Icon(Icons.blur_circular),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: hitung,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Hitung Luas", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.deepPurple.withAlpha(20),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.deepPurple.withAlpha(50)),
              ),
              child: Column(
                children: [
                  Text("Hasil Luas", style: GoogleFonts.poppins(fontSize: 14)),
                  Text(
                    hasil.toStringAsFixed(2),
                    style: GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                  ),
                  Text("cm²", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
