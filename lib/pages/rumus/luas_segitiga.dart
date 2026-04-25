import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    if (alas.text.isEmpty || tinggi.text.isEmpty) return;
    setState(() {
      hasil = 0.5 * (double.tryParse(alas.text) ?? 0) * (double.tryParse(tinggi.text) ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Luas Segitiga", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
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
                    const Icon(Icons.architecture, size: 60, color: Colors.deepPurple),
                    const SizedBox(height: 10),
                    Text("Rumus: ½ × alas × tinggi", style: GoogleFonts.poppins(fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: alas,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Alas (cm)",
                prefixIcon: const Icon(Icons.straighten),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: tinggi,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Tinggi (cm)",
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
              child: const Text("Hitung Sekarang", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                  Text("Hasil Perhitungan", style: GoogleFonts.poppins(fontSize: 14)),
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
