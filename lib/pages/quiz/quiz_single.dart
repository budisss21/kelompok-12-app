import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizSinglePage extends StatefulWidget {
  @override
  State<QuizSinglePage> createState() => _QuizSinglePageState();
}

class _QuizSinglePageState extends State<QuizSinglePage> {
  String correctAnswer = "B";
  String? selected;
  bool answered = false;

  final options = {
    "A": "2 + 2 = 5",
    "B": "2 + 2 = 4",
    "C": "2 + 2 = 6",
    "D": "2 + 2 = 3",
    "E": "2 + 2 = 7",
  };

  void answer(String key) {
    setState(() {
      selected = key;
      answered = true;
    });
  }

  void reset() {
    setState(() {
      selected = null;
      answered = false;
    });
  }

  Color getCardColor(String key) {
    if (!answered) return Colors.white;
    if (key == correctAnswer) return Colors.green.shade100;
    if (key == selected && key != correctAnswer) return Colors.red.shade100;
    return Colors.white;
  }

  BorderSide getBorderSide(String key) {
    if (!answered) return BorderSide(color: Colors.grey.shade300);
    if (key == correctAnswer) return const BorderSide(color: Colors.green, width: 2);
    if (key == selected && key != correctAnswer) return const BorderSide(color: Colors.red, width: 2);
    return BorderSide(color: Colors.grey.shade300);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Single Choice", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
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
                "Berapa hasil dari 2 + 2 ?",
                style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView(
                children: options.entries.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: answered ? null : () => answer(e.key),
                      borderRadius: BorderRadius.circular(12),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: getCardColor(e.key),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.fromBorderSide(getBorderSide(e.key)),
                          boxShadow: [
                            if (selected == e.key)
                              BoxShadow(color: Colors.black.withAlpha(20), blurRadius: 8, offset: const Offset(0, 4))
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: answered && e.key == correctAnswer ? Colors.green : Colors.orange,
                              child: Text(e.key, style: const TextStyle(color: Colors.white, fontSize: 12)),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(e.value, style: GoogleFonts.poppins(fontSize: 16)),
                            ),
                            if (answered && e.key == correctAnswer)
                              const Icon(Icons.check_circle, color: Colors.green),
                            if (answered && e.key == selected && e.key != correctAnswer)
                              const Icon(Icons.cancel, color: Colors.red),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            if (answered)
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: selected == correctAnswer ? Colors.green.shade50 : Colors.red.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      selected == correctAnswer ? Icons.sentiment_very_satisfied : Icons.sentiment_very_dissatisfied,
                      color: selected == correctAnswer ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        selected == correctAnswer
                            ? "Hebat! Jawabanmu benar."
                            : "Kurang tepat. Jawaban yang benar adalah ${options[correctAnswer]}",
                        style: TextStyle(
                          color: selected == correctAnswer ? Colors.green.shade800 : Colors.red.shade800,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ElevatedButton.icon(
              onPressed: reset,
              icon: const Icon(Icons.refresh),
              label: const Text("Reset Quiz"),
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
