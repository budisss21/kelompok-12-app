import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IfMaxMinPage extends StatefulWidget {
  const IfMaxMinPage({Key? key}) : super(key: key);

  @override
  State<IfMaxMinPage> createState() => _IfMaxMinPageState();
}

class _IfMaxMinPageState extends State<IfMaxMinPage> {
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  String? maxVal;
  String? minVal;

  void compare() {
    double? n1 = double.tryParse(num1Controller.text);
    double? n2 = double.tryParse(num2Controller.text);

    if (n1 == null || n2 == null) return;

    setState(() {
      if (n1 > n2) {
        maxVal = n1.toString();
        minVal = n2.toString();
      } else if (n2 > n1) {
        maxVal = n2.toString();
        minVal = n1.toString();
      } else {
        maxVal = "Sama Besar ($n1)";
        minVal = "Sama Besar ($n2)";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Max & Min (IF)", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
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
                    const Icon(Icons.compare_arrows, size: 60, color: Colors.teal),
                    const SizedBox(height: 10),
                    Text("Bandingkan dua bilangan menggunakan IF", style: GoogleFonts.poppins(fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Bilangan Pertama",
                prefixIcon: const Icon(Icons.looks_one),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Bilangan Kedua",
                prefixIcon: const Icon(Icons.looks_two),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: compare,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Cek Nilai", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            if (maxVal != null) ...[
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.teal.withAlpha(20),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.teal.withAlpha(50)),
                ),
                child: Column(
                  children: [
                    _buildResultRow("Nilai Maksimal", maxVal!, Colors.green),
                    const Divider(height: 30),
                    _buildResultRow("Nilai Minimal", minVal!, Colors.red),
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildResultRow(String label, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
        Text(
          value,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }
}
