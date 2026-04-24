import 'package:flutter/material.dart';

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
    setState(() {
      selected.add(key);
    });

    if (correct.contains(key)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("✅ Benar")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "❌ Salah! Jawaban benar: ${correct.map((e) => options[e]).join(", ")}",
          ),
        ),
      );
    }
  }

  void reset() {
    setState(() {
      selected.clear();
    });
  }

  Color? getColor(String key) {
    if (!selected.contains(key)) return null;
    if (correct.contains(key)) return Colors.green[200];
    return Colors.red[200];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz Multiple")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Manakah yang termasuk bahasa pemrograman untuk mobile development?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16),

            ...options.entries.map((e) {
              return Card(
                color: getColor(e.key),
                child: ListTile(
                  title: Text("${e.key}. ${e.value}"),
                  onTap: selected.contains(e.key) ? null : () => check(e.key),
                ),
              );
            }).toList(),

            SizedBox(height: 20),

            ElevatedButton(onPressed: reset, child: Text("Reset Quiz")),
          ],
        ),
      ),
    );
  }
}
