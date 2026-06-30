import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizMultiPage extends StatefulWidget {
  @override
  State<QuizMultiPage> createState() => _QuizMultiPageState();
}

class _QuizMultiPageState extends State<QuizMultiPage> {
  final correct = ["A", "C"];
  List<String> selected = [];

  final options = {
    "A": "Flutter",
    "B": "HTML",
    "C": "Dart",
    "D": "CSS",
    "E": "CorelDraw",
  };

  void check(String key) {
    if (selected.contains(key)) return;
    
    setState(() {
      selected.add(key);
    });

    bool isCorrect = correct.contains(key);
    
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(isCorrect ? Icons.check_circle : Icons.cancel, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                isCorrect 
                  ? "Bagus! Itu jawaban yang benar." 
                  : "Kurang tepat. Coba lagi atau cari yang lain!",
              ),
            ),
          ],
        ),
        backgroundColor: isCorrect ? Colors.green : Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void reset() {
    setState(() {
      selected.clear();
    });
  }

  Color getCardColor(String key) {
    if (!selected.contains(key)) return Colors.white;
    return correct.contains(key) ? Colors.green.shade100 : Colors.red.shade100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Multiple Choice", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange.withAlpha(20),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                "Manakah yang termasuk bahasa pemrograman untuk mobile development?",
                style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "*Pilih semua yang benar",
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: options.entries.map((e) {
                  bool isSelected = selected.contains(e.key);
                  bool isCorrect = correct.contains(e.key);
                  
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Card(
                      elevation: isSelected ? 0 : 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: isSelected 
                              ? (isCorrect ? Colors.green : Colors.red) 
                              : Colors.grey.shade300,
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      color: getCardColor(e.key),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 15,
                          backgroundColor: isSelected 
                              ? (isCorrect ? Colors.green : Colors.red) 
                              : Colors.orange.shade100,
                          child: Text(e.key, style: TextStyle(color: isSelected ? Colors.white : Colors.orange.shade900, fontSize: 12)),
                        ),
                        title: Text(e.value, style: GoogleFonts.poppins(fontSize: 16)),
                        trailing: isSelected 
                            ? Icon(isCorrect ? Icons.check_circle : Icons.cancel, color: isCorrect ? Colors.green : Colors.red)
                            : null,
                        onTap: () => check(e.key),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton.icon(
              onPressed: reset,
              icon: const Icon(Icons.refresh),
              label: const Text("Mulai Ulang"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
