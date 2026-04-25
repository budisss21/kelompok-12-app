import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PollingPage extends StatefulWidget {
  @override
  State<PollingPage> createState() => _PollingPageState();
}

class _PollingPageState extends State<PollingPage> {
  Map<String, int> votes = {
    "Badminton": 0,
    "Catur": 0,
    "Padel": 0,
    "Basket": 0,
    "Lari Marathon": 0,
  };

  bool voted = false;
  String? userChoice;

  void vote(String key) {
    setState(() {
      votes[key] = votes[key]! + 1;
      voted = true;
      userChoice = key;
    });
  }

  int total() => votes.values.fold(0, (a, b) => a + b);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Polling Hobby", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Apa olahraga favoritmu?",
              style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              voted ? "Terima kasih sudah berpartisipasi!" : "Pilih salah satu di bawah ini:",
              style: GoogleFonts.poppins(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...votes.keys.map((e) {
              double percentage = total() == 0 ? 0 : (votes[e]! / total());
              bool isHighest = voted && votes[e] == votes.values.reduce((a, b) => a > b ? a : b);

              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: InkWell(
                  onTap: voted ? null : () => vote(e),
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: userChoice == e ? Colors.blue.withAlpha(20) : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: userChoice == e ? Colors.blue : Colors.grey.shade300,
                        width: userChoice == e ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: userChoice == e || isHighest ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                            if (voted)
                              Text(
                                "${(percentage * 100).toStringAsFixed(1)}%",
                                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                              ),
                          ],
                        ),
                        if (voted) ...[
                          const SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: percentage,
                              minHeight: 12,
                              backgroundColor: Colors.grey.shade200,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                isHighest ? Colors.blue : Colors.blue.withAlpha(100),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text("${votes[e]} suara", style: const TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
            if (voted)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Total Responden: ${total()}",
                  style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
