import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NestedIfDiskonPage extends StatefulWidget {
  const NestedIfDiskonPage({Key? key}) : super(key: key);

  @override
  State<NestedIfDiskonPage> createState() => _NestedIfDiskonPageState();
}

class _NestedIfDiskonPageState extends State<NestedIfDiskonPage> {
  final buyController = TextEditingController();
  final currencyFormatter = NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);

  double totalBeli = 0;
  double diskonPersen = 0;
  double nilaiDiskon = 0;
  double totalBayar = 0;
  bool calculated = false;

  void hitungDiskon() {
    double? beli = double.tryParse(buyController.text);
    if (beli == null) return;

    setState(() {
      totalBeli = beli;
      calculated = true;

      if (totalBeli >= 1500000) {
        diskonPersen = 30;
      } else {
        if (totalBeli >= 1000000) {
          diskonPersen = 20;
        } else {
          if (totalBeli >= 500000) {
            diskonPersen = 10;
          } else {
            diskonPersen = 0;
          }
        }
      }

      nilaiDiskon = (diskonPersen / 100) * totalBeli;
      totalBayar = totalBeli - nilaiDiskon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diskon (Nested IF)", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.pinkAccent,
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
                    const Icon(Icons.shopping_bag, size: 60, color: Colors.pinkAccent),
                    const SizedBox(height: 10),
                    Text("Hitung diskon belanja menggunakan Nested IF", style: GoogleFonts.poppins(fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: buyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Jumlah Pembelian (Rp)",
                prefixIcon: const Icon(Icons.payments),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: hitungDiskon,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Hitung Total", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            if (calculated) ...[
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent.withAlpha(20),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.pinkAccent.withAlpha(50)),
                ),
                child: Column(
                  children: [
                    _buildResultRow("Total Pembelian", currencyFormatter.format(totalBeli)),
                    _buildResultRow("Diskon (%)", "$diskonPersen%"),
                    _buildResultRow("Potongan Harga", "- ${currencyFormatter.format(nilaiDiskon)}", color: Colors.red),
                    const Divider(height: 30),
                    _buildResultRow("Total Bayar", currencyFormatter.format(totalBayar), color: Colors.pinkAccent, isBold: true),
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildResultRow(String label, String value, {Color? color, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: GoogleFonts.poppins()),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: isBold ? 18 : 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
