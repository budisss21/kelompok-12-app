import 'package:flutter/material.dart';

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

  Color? getColor(String key) {
    if (!answered) return null;
    if (key == correctAnswer) return Colors.green[200];
    if (key == selected && key != correctAnswer) return Colors.red[200];
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz Single")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Berapa hasil dari 2 + 2 ?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16),

            ...options.entries.map(
              (e) => Card(
                color: getColor(e.key),
                child: ListTile(
                  title: Text("${e.key}. ${e.value}"),
                  onTap: answered ? null : () => answer(e.key),
                ),
              ),
            ),

            SizedBox(height: 20),

            if (answered)
              Text(
                selected == correctAnswer
                    ? "✅ Jawaban Benar!"
                    : "❌ Salah! Jawaban benar: ${options[correctAnswer]}",
                style: TextStyle(fontSize: 16),
              ),

            SizedBox(height: 20),

            ElevatedButton(onPressed: reset, child: Text("Reset Quiz")),
          ],
        ),
      ),
    );
  }
}
