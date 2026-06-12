import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BilanganPage extends StatefulWidget {
  const BilanganPage({super.key});

  @override
  State<BilanganPage> createState() => _BilanganPageState();
}

class _BilanganPageState extends State<BilanganPage> {
  List<int> _getBilanganBulat() {
    List<int> result = [];
    for (int i = 1; i <= 20; i++) {
      result.add(i);
    }
    return result;
  }

  List<int> _getBilanganGanjil() {
    List<int> result = [];
    int count = 0;
    int current = 1;
    while (count < 20) {
      if (current % 2 != 0) {
        result.add(current);
        count++;
      }
      current++;
    }
    return result;
  }

  List<int> _getFibonacci() {
    List<int> result = [];
    int count = 0;
    int a = 0;
    int b = 1;
    do {
      result.add(a);
      int next = a + b;
      a = b;
      b = next;
      count++;
    } while (count < 20);
    return result;
  }

  List<int> _getBilanganGenap() {
    List<int> result = [];
    for (int i = 1; result.length < 20; i++) {
      if (i % 2 == 0) {
        result.add(i);
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: Text('Number Sequences',
            style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w700)),
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildNumberSection('1. Whole Numbers (For Loop)', _getBilanganBulat(), const Color(0xFF38BDF8)),
            const SizedBox(height: 20),
            _buildNumberSection('2. Odd Numbers (While Loop)', _getBilanganGanjil(), const Color(0xFFF59E0B)),
            const SizedBox(height: 20),
            _buildNumberSection('3. Fibonacci Series (Do-While)', _getFibonacci(), const Color(0xFF8B5CF6)),
            const SizedBox(height: 20),
            _buildNumberSection('4. Even Numbers (Selection)', _getBilanganGenap(), const Color(0xFFF43F5E)),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberSection(String title, List<int> numbers, Color accentColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: accentColor.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.auto_awesome_motion_rounded, color: accentColor, size: 16),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: accentColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: numbers.map((n) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white.withOpacity(0.05)),
              ),
              child: Text(
                n.toString(),
                style: GoogleFonts.jetBrainsMono(
                  fontWeight: FontWeight.w800,
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 13,
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}
