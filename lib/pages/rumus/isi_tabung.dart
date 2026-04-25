import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class IsiTabungPage extends StatefulWidget {
  const IsiTabungPage({Key? key}) : super(key: key);
  @override
  _IsiTabungPageState createState() => _IsiTabungPageState();
}

class _IsiTabungPageState extends State<IsiTabungPage> {
  final jariJari = TextEditingController();
  final tinggi = TextEditingController();
  double hasil = 0;

  void hitung() {
    if (jariJari.text.isEmpty || tinggi.text.isEmpty) return;
    setState(() {
      double r = double.tryParse(jariJari.text) ?? 0;
      double t = double.tryParse(tinggi.text) ?? 0;
      hasil = pi * pow(r, 2) * t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Isi Tabung", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
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
                    const Icon(Icons.opacity, size: 60, color: Colors.deepPurple),
                    const SizedBox(height: 10),
                    Text("Rumus: π × r² × t", style: GoogleFonts.poppins(fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: jariJari,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Jari-jari (r)",
                prefixIcon: const Icon(Icons.circle_outlined),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: tinggi,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Tinggi (t)",
                prefixIcon: const Icon(Icons.height),
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
              child: const Text("Hitung Volume", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                  Text("Volume Tabung", style: GoogleFonts.poppins(fontSize: 14)),
                  Text(
                    hasil.toStringAsFixed(2),
                    style: GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                  ),
                  Text("cm³", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
