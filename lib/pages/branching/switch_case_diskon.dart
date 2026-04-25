import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SwitchCaseDiskonPage extends StatefulWidget {
  const SwitchCaseDiskonPage({Key? key}) : super(key: key);

  @override
  State<SwitchCaseDiskonPage> createState() => _SwitchCaseDiskonPageState();
}

class _SwitchCaseDiskonPageState extends State<SwitchCaseDiskonPage> {
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

      // Logic Switch Case: Mengubah range menjadi "tier" (int)
      int tier;
      if (totalBeli >= 1500000) {
        tier = 3; // Tier 3: 30%
      } else if (totalBeli >= 1000000) {
        tier = 2; // Tier 2: 20%
      } else if (totalBeli >= 500000) {
        tier = 1; // Tier 1: 10%
      } else {
        tier = 0; // Tier 0: No discount
      }

      switch (tier) {
        case 3:
          diskonPersen = 30;
          break;
        case 2:
          diskonPersen = 20;
          break;
        case 1:
          diskonPersen = 10;
          break;
        default:
          diskonPersen = 0;
      }

      nilaiDiskon = (diskonPersen / 100) * totalBeli;
      totalBayar = totalBeli - nilaiDiskon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diskon (Switch Case)", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigo,
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
                    const Icon(Icons.confirmation_number, size: 60, color: Colors.indigo),
                    const SizedBox(height: 10),
                    Text("Hitung diskon belanja menggunakan Switch Case", style: GoogleFonts.poppins(fontStyle: FontStyle.italic)),
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
                prefixIcon: const Icon(Icons.receipt_long),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: hitungDiskon,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
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
                  color: Colors.indigo.withAlpha(20),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.indigo.withAlpha(50)),
                ),
                child: Column(
                  children: [
                    _buildResultRow("Total Pembelian", currencyFormatter.format(totalBeli)),
                    _buildResultRow("Diskon (%)", "$diskonPersen%"),
                    _buildResultRow("Potongan Harga", "- ${currencyFormatter.format(nilaiDiskon)}", color: Colors.red),
                    const Divider(height: 30),
                    _buildResultRow("Total Bayar", currencyFormatter.format(totalBayar), color: Colors.indigo, isBold: true),
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
